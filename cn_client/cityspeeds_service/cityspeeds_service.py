import os

from flask import Flask, render_template,request
import grpc
import logging
from cityspeeds_service_pb2 import CitySpeedsRequest
from cityspeeds_service_pb2_grpc import CitySpeedsServiceStub
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

cityspeeds_service_channel = grpc.insecure_channel(
    "cityspeedsserver:50051"
)
city_speed_client = CitySpeedsServiceStub(cityspeeds_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/city/internet_speed")
def render_citySpeeds():
    city_name_temp = request.args.get('city_name'),
    
    
    mean_temp=request.args.get('mean'),

    logging.warning('121333333312321312312222222222222222222222'),
    cityspeeds_service_request = CitySpeedsRequest(
        city_name=city_name_temp[0], mean=bool(strtobool(mean_temp[0]))
    )
    cityspeeds_service_response = city_speed_client.CitySpeedsInfo(
        cityspeeds_service_request
    )
    return render_template(
        "cityInternetSpeed.html",
        citySpeeds=cityspeeds_service_response.citySpeeds,
    )