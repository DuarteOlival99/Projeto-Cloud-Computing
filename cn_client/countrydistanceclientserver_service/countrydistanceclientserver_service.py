import os

from flask import Flask, render_template,request,Response
import grpc
from distutils.util import strtobool


from countrydistanceclientserver_service_pb2 import CountryDistanceClientServerRequest
from countrydistanceclientserver_service_pb2_grpc import CountryDistanceClientServerServiceStub

app = Flask(__name__)


countrydistanceclientserver_service_channel = grpc.insecure_channel(
    "countrydistanceclientserverserver:50052"
)
country_distance_client_server_client = CountryDistanceClientServerServiceStub(countrydistanceclientserver_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/distanceClientServer")
def render_countryDistanceClientServer():

    country_name_temp = request.args.get('country_name'),
    
    mean_temp=request.args.get('mean'),
    print(country_name_temp),
    print(mean_temp),
    countrydistanceclientserver_service_request = CountryDistanceClientServerRequest(
        country_name= country_name_temp[0], mean=bool(strtobool(mean_temp[0]))
    )
    countrydistanceclientserver_service_response = country_distance_client_server_client.CountryDistanceClientServerInfo(
        countrydistanceclientserver_service_request
    )
    return render_template(
        "countryDistanceClientServer.html",
        CountryDistanceClientServer=countrydistanceclientserver_service_response.countryDistanceClientServer,
    )