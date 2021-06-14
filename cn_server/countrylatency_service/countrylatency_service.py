from concurrent import futures
import random
import mysql.connector

import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from countrylatency_service_pb2 import (
    CountryLatency,
    CountryLatencyResponse,
)
import countrylatency_service_pb2_grpc
from mysql.connector import connect, Error

country = []
total_latency_value = 0 
total_row = 0


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
        if(country is not None):
            del country[:]
        for country_row in self.cursor.fetchall():
                info = CountryLatency(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    date_request = str(country_row[3]), 
                    isp_name = str(country_row[2]),
                    latency = str(country_row[7]))
                country.append(info)


class CountryLatencyService(countrylatency_service_pb2_grpc.CountryLatencyServiceServicer):
    def CountryLatencyInfo(self, request, context):
        country_temp =""
        connCountryLatency = DBManager('Country')
        country_temp = connCountryLatency.query_country(request.country_name)
        connCountryLatency = DBManager('CountryInfo')
        connCountryLatency.query_country_info(country_temp)
        count = 0
        sumLatency= 0
        meanLatency = 0
        if(request.mean) :
            for i in country :
                count += 1
                sumLatency += float(i.latency)
            meanLatency = sumLatency/count
            del country[:]
            country.append(CountryLatency(
                    country_name= str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    date_request = str('---'), 
                    isp_name = str('---'),
                    latency = str(round(meanLatency,4))
                    ))

        return CountryLatencyResponse(countryLatency=country)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countrylatency_service_pb2_grpc.add_CountryLatencyServiceServicer_to_server(
        CountryLatencyService(), server
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

    server.add_insecure_port("[::]:50053")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
