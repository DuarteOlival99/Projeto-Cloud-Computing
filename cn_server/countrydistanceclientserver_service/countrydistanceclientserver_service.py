from concurrent import futures
import random
import mysql.connector

import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from countrydistanceclientserver_service_pb2 import (
    CountryDistanceClientServer,
    CountryDistanceClientServerResponse,
)
import countrydistanceclientserver_service_pb2_grpc
from getpass import getpass
from mysql.connector import connect, Error


countrydistanceclientserver = []

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
        self.cursor.execute("SELECT * FROM CountryInfo.country_isp_daily_quality WHERE country_code = '%s'"%country_temp[2])
        if(countrydistanceclientserver is not None):
            del countrydistanceclientserver[:]
        for country_row in self.cursor.fetchall():
            info = CountryDistanceClientServer(
                            country_name= str(country_temp[1]), 
                            country_code = str(country_temp[2]),
                            isp_name = str(country_row[2]), 
                            date_request = str(country_row[3]), 
                            total_tests  = str(country_row[8]), 
                            distance_miles = str(country_row[9]))
            countrydistanceclientserver.append(info)


class CountryDistanceClientServerService(countrydistanceclientserver_service_pb2_grpc.CountryDistanceClientServerServiceServicer):
    def CountryDistanceClientServerInfo(self, request, context):
        country_temp =""
        
        connCountry = DBManager('Country')
        country_temp = connCountry.query_country(request.country_name)
        connCountry = DBManager('CountryInfo')
        connCountry.query_country_info(country_temp)
        count = 0
        sumTests = 0
        sumDistance = 0
        meanTests = 0
        meanDistance = 0
        if(request.mean) :
            for i in countrydistanceclientserver :
                count += 1
                sumTests += float(i.total_tests)
                sumDistance += float(i.distance_miles)
            meanTests = sumTests/count
            meanDistance = sumDistance/count    
            del countrydistanceclientserver[:]
            countrydistanceclientserver.append(CountryDistanceClientServer(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    isp_name = str('---'), 
                    date_request = str('---'), 
                    total_tests  = str(round(meanTests,2)), 
                    distance_miles = str(round(meanDistance,2)))
                    )

        return CountryDistanceClientServerResponse(countryDistanceClientServer=countrydistanceclientserver)

def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countrydistanceclientserver_service_pb2_grpc.add_CountryDistanceClientServerServiceServicer_to_server(
        CountryDistanceClientServerService(), server
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

    server.add_insecure_port("[::]:50052")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
