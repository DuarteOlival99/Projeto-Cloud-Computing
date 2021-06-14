import logging
import os
from distutils.util import strtobool

from flask import Flask, render_template,request,Response
import grpc

from regionspeeds_service_pb2 import RegionSpeedsRequest
from regionspeeds_service_pb2_grpc import RegionSpeedsServiceStub

app = Flask(__name__)


regionspeeds_service_channel = grpc.insecure_channel(
    "regionspeedsserver:50056"
)
region_speed_client = RegionSpeedsServiceStub(regionspeeds_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/region/internet_speed")
def render_regionSpeeds():
    region_name_temp = request.args.get('region_name'),
    
    mean_temp=request.args.get('mean'),
    regionspeeds_service_request = RegionSpeedsRequest(
        region_name=region_name_temp[0], mean=bool(strtobool(mean_temp[0]))
        
    )
    regionspeeds_service_response = region_speed_client.RegionSpeedsInfo(
        regionspeeds_service_request
    )
    return render_template(
        "regionSpeeds.html",
        regionSpeeds=regionspeeds_service_response.regionSpeeds,
    )