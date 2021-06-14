from concurrent import futures
import random
import mysql.connector
import logging
import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from cityspeeds_service_pb2 import (
    CitySpeeds,
    CitySpeedsResponse,
)
import cityspeeds_service_pb2_grpc
from mysql.connector import connect, Error

city = []

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

    def query_city(self, city_name):
        self.cursor.execute("SELECT * FROM City.city WHERE city = '%s'"%str(city_name))
        for city_row in self.cursor.fetchall():
                city_temp = city_row
        return city_temp
        
    def query_country(self, city_temp):
        self.cursor.execute("SELECT * FROM Country.country WHERE country_code = '%s'"%str(city_temp[3]))
        for country_row in self.cursor.fetchall():
                country_temp = country_row
        return country_temp
    
    def query_city_info(self, country_temp,city_temp):
        self.cursor.execute("SELECT * FROM CityInfo.city_isp_daily_speeds WHERE city = '%s' Limit 5000"%str(city_temp[1]))
        if(city is not None):
            del city[:]
        for city_row in self.cursor.fetchall():
                info = CitySpeeds(
                    country_name= str(country_temp[1]),
                    country_code = str(country_temp[2]),
                    city_name = str(city_temp[1]), 
                    region_code = str(city_temp[2]),
                    isp_name = str(city_row[2]), 
                    date_request = str(city_row[3]), 
                    download_speed = str(city_row[4]), 
                    upload_speed = str(city_row[5]))
                city.append(info)

class CitySpeedsService(cityspeeds_service_pb2_grpc.CitySpeedsServiceServicer):
    def CitySpeedsInfo(self, request, context):
        city_temp =""
     
        connCity = DBManager('City')
        city_temp = connCity.query_city(request.city_name)
        connCity = DBManager('Country')
        country_temp = connCity.query_country(city_temp)
        connCity = DBManager('CityInfo')
        connCity.query_city_info(country_temp, city_temp)
        count = 0
        sumDownload = 0
        sumUpload = 0
        meanDownload = 0
        meanUpload = 0
        if(request.mean) :
            for i in city :
                count += 1
                sumDownload += float(i.download_speed)
                sumUpload += float(i.upload_speed)
            meanDownload = sumDownload/count
            meanUpload = sumUpload/count    
            del city[:]
            city.append(CitySpeeds(
                    country_name= str(country_temp[1]),
                    country_code = str(country_temp[2]),
                    city_name = str(city_temp[1]), 
                    region_code = str(city_temp[2]),
                    isp_name = str('---'),
                    date_request = str('---'),
                    download_speed = str(round(meanDownload,2)),
                    upload_speed = str(round(meanUpload,2)))
                    )
        return CitySpeedsResponse(citySpeeds=city)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    cityspeeds_service_pb2_grpc.add_CitySpeedsServiceServicer_to_server(
        CitySpeedsService(), server
    )

    #with open("server.key", "rb") as fp:
        #server_key = fp.read()
    #with open("server.pem", "rb") as fp:
        #server_cert = fp.read()
    #with open("ca.pem", "rb") as fp:
        #ca_cert = fp.read()

    #creds = grpc.ssl_server_credentials(
        #[(server_key, server_cert)],
        #root_certificates=ca_cert,
        #require_client_auth=True,
    #)

    server.add_insecure_port("[::]:50051")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
