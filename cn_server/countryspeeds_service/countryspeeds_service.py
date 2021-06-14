from concurrent import futures
import random
import mysql.connector
import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound

from countryspeeds_service_pb2 import (
    CountrySpeeds,
    CountrySpeedsResponse,
)
import countryspeeds_service_pb2_grpc
from mysql.connector import connect, Error


country = []

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
        self.cursor.execute("SELECT * FROM CountryInfo.country_daily_speeds WHERE country_code = '%s'"%country_temp[2])
        if(country is not None):
            del country[:]
        for country_row in self.cursor.fetchall():
                info = CountrySpeeds(
                    country_name = str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    date_request = str(country_row[2]),
                    download_speed = str(country_row[3]),
                    upload_speed = str(country_row[4]))
                country.append(info)
class CountrySpeedsService(countryspeeds_service_pb2_grpc.CountrySpeedsServiceServicer):
    def CountrySpeedsInfo(self, request, context):
        country_temp =""
        
        connCountry = DBManager('Country')
        country_temp = connCountry.query_country(request.country_name)
        connCountry = DBManager('CountryInfo')
        connCountry.query_country_info(country_temp)
        
        count = 0
        sumDownload = 0
        sumUpload = 0
        meanDownload = 0
        meanUpload = 0
        if(request.mean) :
            for i in country :
                count += 1
                sumDownload += float(i.download_speed)
                sumUpload += float(i.upload_speed)
            meanDownload = sumDownload/count
            meanUpload = sumUpload/count    
            del country[:]
            country.append(CountrySpeeds(
                    country_name = str(country_temp[1]), 
                    country_code = str(country_temp[2]),
                    date_request = str('---'),
                    download_speed = str(round(meanDownload,2)),
                    upload_speed = str(round(meanUpload,2)))
                    )

        return CountrySpeedsResponse(countrySpeeds=country)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countryspeeds_service_pb2_grpc.add_CountrySpeedsServiceServicer_to_server(
        CountrySpeedsService(), server
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

    server.add_insecure_port("[::]:50055")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
