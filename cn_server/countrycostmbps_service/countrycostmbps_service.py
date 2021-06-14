from concurrent import futures
import random
import logging
import grpc
from grpc_interceptor import ExceptionToStatusInterceptor
from grpc_interceptor.exceptions import NotFound
from pyspark.sql import SparkSession

from countrycostmbps_service_pb2 import (
    CountryCostmbps,
    CountryCostmbpsResponse,
)
import countrycostmbps_service_pb2_grpc

costUSDmbps = []

spark = SparkSession \
.builder \
.appName("PySpark example") \
.getOrCreate()
df = spark \
.read \
.option("header", "true") \
.csv("country_daily_value.csv")
print("ready")

class CountryCostmbpsService(countrycostmbps_service_pb2_grpc.CountryCostmbpsServiceServicer):
    def CountryCostmbpsInfo(self, request, context):

        df.createOrReplaceTempView("Costs")
        sqlDF = spark.sql("SELECT country,country_code,date,median_usd_mbps_down,median_usd_mbps_up,total_surveys FROM Costs where country = '%s'" %str(request.country_name))
        sqlDF.show()
        del costUSDmbps[:]
        for row in sqlDF.rdd.toLocalIterator():
            # print(row["country"])
            # print(row["country_code"])
            # print(row["total_tests"])
            costUSDmbps.append(CountryCostmbps(
                    country_name = str(row["country"]),
                    country_code = str(row["country_code"]),
                    date = str(row["date"]),
                    median_usd_mbps_down = str(row["median_usd_mbps_down"]),
                    median_usd_mbps_up = str(row["median_usd_mbps_up"]),
                    total_surveys = str(row["total_surveys"]))
                    )
        

        return CountryCostmbpsResponse(countryCostmbps=costUSDmbps)


def serve():
    interceptors = [ExceptionToStatusInterceptor()]
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=10), interceptors=interceptors
    )
    countrycostmbps_service_pb2_grpc.add_CountryCostmbpsServiceServicer_to_server(
        CountryCostmbpsService(), server
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

    server.add_insecure_port("[::]:50058")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
