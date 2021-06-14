import os

from flask import Flask, render_template,request
import grpc
import logging
from countrytotaltests_service_pb2 import CountryTotalTestsRequest
from countrytotaltests_service_pb2_grpc import CountryTotalTestsServiceStub
from distutils.util import strtobool
from flask import Response

app = Flask(__name__)

#with open("client.key", "rb") as fp:
    #client_key = fp.read()
#with open("client.pem", "rb") as fp:
    #client_cert = fp.read()
#with open("ca.pem", "rb") as fp:
    #ca_cert = fp.read()
#creds = grpc.ssl_channel_credentials(ca_cert, client_key, client_cert)

countrytotaltests_service_channel = grpc.insecure_channel(
    "countrytotaltestsserver:50057"
)
country_total_tests_client = CountryTotalTestsServiceStub(countrytotaltests_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/total_tests")
def render_countryTotalTests():
    country_name_temp = request.args.get('country_name'),
    
    logging.warning('121333333312321312312222222222222222222222'),
    countrytotaltests_service_request = CountryTotalTestsRequest(
        country_name=country_name_temp[0]
    )
    countrytotaltests_service_response = country_total_tests_client.CountryTotalTestsInfo(
        countrytotaltests_service_request
    )
    return render_template(
        "countryTotalTests.html",
        countrytotaltests=countrytotaltests_service_response.countryTotalTests,
    )