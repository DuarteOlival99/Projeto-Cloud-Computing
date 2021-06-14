from concurrent import futures
import random
import logging
import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound
from pyspark.sql import SparkSession

from countrytotaltests_service_pb2 import (
    CountryTotalTests,
    CountryTotalTestsResponse,
)
import countrytotaltests_service_pb2_grpc
logging.warning("IMPORTOU BEM OSPARK")
totalTests = []

spark = SparkSession.builder.appName("PySpark example").getOrCreate()
df = spark.read.option("header", "true").csv("country_daily_quality.csv")
print("ready")
logging.warning("LEU O FICHEIRO")

class CountryTotalTestsService(countrytotaltests_service_pb2_grpc.CountryTotalTestsServiceServicer):
    def CountryTotalTestsInfo(self, request, context):
        
        df.createOrReplaceTempView("Tests")
        sqlDF = spark.sql("SELECT country,country_code,date,total_tests FROM Tests where country = '%s'" %str(request.country_name))
        sqlDF.show()
        del totalTests[:]
        for row in sqlDF.rdd.toLocalIterator():
            # print(row["country"])
            # print(row["country_code"])
            # print(row["total_tests"])
            totalTests.append(CountryTotalTests(
                    country_name = str(row["country"]),
                    country_code = str(row["country_code"]),
                    tests_date = str(row["date"]),
                    total_tests = str(row["total_tests"]))
                    )
        

        return CountryTotalTestsResponse(countryTotalTests=totalTests)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countrytotaltests_service_pb2_grpc.add_CountryTotalTestsServiceServicer_to_server(
        CountryTotalTestsService(), server
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

    server.add_insecure_port("[::]:50057")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
