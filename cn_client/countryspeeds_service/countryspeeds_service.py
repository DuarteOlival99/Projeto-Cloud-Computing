import os

from flask import Flask, render_template,request,Response
import grpc
from distutils.util import strtobool

from countryspeeds_service_pb2 import CountrySpeedsRequest
from countryspeeds_service_pb2_grpc import CountrySpeedsServiceStub

app = Flask(__name__)


countryspeeds_service_channel = grpc.insecure_channel(
    "countryspeedsserver:50055"
)
country_speed_client = CountrySpeedsServiceStub(countryspeeds_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/internet_speed")
def render_countrySpeeds():


    country_name_temp = request.args.get('country_name'),
    
    mean_temp=request.args.get('mean'),
    countryspeeds_service_request = CountrySpeedsRequest(
        country_name=country_name_temp[0], mean=bool(strtobool(mean_temp[0]))
    )
    countryspeeds_service_response = country_speed_client.CountrySpeedsInfo(
        countryspeeds_service_request
    )
    return render_template(
        "countrySpeeds.html",
        countrySpeeds=countryspeeds_service_response.countrySpeeds,
    )