import os

from flask import Flask, render_template,request
import grpc
import logging
from countrycostmbps_service_pb2 import CountryCostmbpsRequest
from countrycostmbps_service_pb2_grpc import CountryCostmbpsServiceStub
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

countrycostmbps_service_channel = grpc.insecure_channel(
    "countrycostmbpsserver:50058"
)
country_cost_mbps_client = CountryCostmbpsServiceStub(countrycostmbps_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/cost_mbps")
def render_countryCostUSDmbps():
    country_name_temp = request.args.get('country_name'),
    
    logging.warning('121333333312321312312222222222222222222222'),
    countrycostmbps_service_request = CountryCostmbpsRequest(
        country_name=country_name_temp[0]
    )
    countrycostmbps_service_response = country_cost_mbps_client.CountryCostmbpsInfo(
        countrycostmbps_service_request
    )
    return render_template(
        "countryCostmbps.html",
        countrycostmbps=countrycostmbps_service_response.countryCostmbps,
    )