from concurrent import futures
import logging
import random
import re
import mysql.connector

import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from regionspeeds_service_pb2 import (
    RegionSpeeds,
    RegionSpeedsResponse,
)
import regionspeeds_service_pb2_grpc

from mysql.connector import connect, Error
region = []

class DBManager:

    def __init__(self, database, host="35.197.232.46", user="root"):
        self.connection = mysql.connector.connect(
            user=user, 
            password="54505450",
            host=host, # name of the mysql service as set in the docker-compose file
            database=database,
            auth_plugin='mysql_native_password'
        )
        self.cursor = self.connection.cursor()


    def query_region(self, region_name):
        self.cursor.execute("SELECT * FROM Region.region WHERE region = '%s'"%str(region_name))
        for region_row in self.cursor.fetchall():
                region_temp = region_row
        return region_temp
        
    def query_country(self, region_temp):
        self.cursor.execute("SELECT * FROM Country.country WHERE country_code = '%s'"%str(region_temp[3]))
        for country_row in self.cursor.fetchall():
                country_temp = country_row
        return country_temp
    
    def query_region_info(self, country_temp,region_temp):
        self.cursor.execute("SELECT * FROM RegionInfo.region_isp_daily_speeds WHERE region_code = '%s' Limit 5000"%str(region_temp[2]))
        if(region is not None):
            del region[:]
        for region_row in self.cursor.fetchall():
                info = RegionSpeeds(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    region_name = str(region_temp[1]),
                    region_code = str(region_temp[2]),
                    isp_name = str(region_row[4]),
                    date_request = str(region_row[5]),
                    download_speed = str(region_row[6]),
                    upload_speed = str(region_row[7]))
                
                region.append(info)

class RegionSpeedsService(regionspeeds_service_pb2_grpc.RegionSpeedsServiceServicer):
    def RegionSpeedsInfo(self, request, context):
        country_temp =""
        region_temp =""
        connRegion = DBManager('Region')
        region_temp = connRegion.query_region(request.region_name)
        connRegion = DBManager('Country')
        country_temp = connRegion.query_country(region_temp)
        connRegion = DBManager('RegionInfo')
        connRegion.query_region_info(country_temp, region_temp)
        count = 0
        sumDownload = 0
        sumUpload = 0
        meanDownload = 0
        meanUpload = 0
        if(request.mean) :
            for i in region :
                count += 1
                sumDownload += float(i.download_speed)
                sumUpload += float(i.upload_speed)
            meanDownload = sumDownload/count
            meanUpload = sumUpload/count    
            del region[:]
            region.append(RegionSpeeds(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    region_name = str(region_temp[1]),
                    region_code = str(region_temp[2]),
                    isp_name = str('---'),
                    date_request = str('---'),
                    download_speed = str(round(meanDownload,2)),
                    upload_speed = str(round(meanUpload,2)))
                    )

        return RegionSpeedsResponse(regionSpeeds=region)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    regionspeeds_service_pb2_grpc.add_RegionSpeedsServiceServicer_to_server(
        RegionSpeedsService(), server
    )


    server.add_insecure_port("[::]:50056")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
