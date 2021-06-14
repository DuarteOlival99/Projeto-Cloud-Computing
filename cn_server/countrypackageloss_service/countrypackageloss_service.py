from concurrent import futures
import logging
import random
import mysql.connector

import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from countrypackageloss_service_pb2 import (
    CountryPackageLoss,
    CountryPackageLossResponse,
)
import countrypackageloss_service_pb2_grpc

from mysql.connector import connect, Error

countrypackageloss = []

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
        
    def query_country(self, country_name):
        self.cursor.execute("SELECT * FROM Country.country WHERE country = '%s'"%str(country_name))
        for country_row in self.cursor.fetchall():
                country_temp = country_row
        return country_temp
    
    def query_country_info(self, country_temp):
        if(countrypackageloss is not None):
            del countrypackageloss[:]
        self.cursor.execute("SELECT * FROM CountryInfo.country_isp_daily_quality WHERE country_code = '%s'"%country_temp[2])
        for country_row in self.cursor.fetchall():
            info = CountryPackageLoss(
                country_name= str(country_temp[1]), 
                country_code = str(country_temp[2]),
                isp_name = str(country_row[2]),
                date_request = str(country_row[3]), 
                packet_loss = str(country_row[6]))
            countrypackageloss.append(info)

class CountryPackageLossService(countrypackageloss_service_pb2_grpc.CountryPackageLossServiceServicer):
    def CountryPackageLossInfo(self, request, context):
        connCountry = DBManager('Country')
        country_temp = connCountry.query_country(request.country_name)
        connCountry = DBManager('CountryInfo')
        connCountry.query_country_info(country_temp)
        count = 0
        sumPacketLoss = 0
        meanPacketLoss = 0
        if(request.mean) :
            for i in countrypackageloss :
                count += 1
                sumPacketLoss += float(i.packet_loss)
            meanPacketLoss = sumPacketLoss/count
            del countrypackageloss[:]
            countrypackageloss.append(CountryPackageLoss(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    isp_name = str('---'),
                    date_request = str('---'), 
                    packet_loss = str(round(meanPacketLoss,2))
                    ))

        return CountryPackageLossResponse(countryPackageLoss=countrypackageloss)

def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countrypackageloss_service_pb2_grpc.add_CountryPackageLossServiceServicer_to_server(
        CountryPackageLossService(), server
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

    server.add_insecure_port("[::]:50054")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
