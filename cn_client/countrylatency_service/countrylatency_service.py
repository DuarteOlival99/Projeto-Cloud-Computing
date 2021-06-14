import os

from flask import Flask, render_template,request,Response
import grpc
from distutils.util import strtobool

from countrylatency_service_pb2 import CountryLatencyRequest
from countrylatency_service_pb2_grpc import CountryLatencyServiceStub

app = Flask(__name__)


countrylatency_service_channel = grpc.insecure_channel(
    "countrylatencyserver:50053"
)
country_latency_client = CountryLatencyServiceStub(countrylatency_service_channel)


@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/internet_latency")
def render_countryLatency():

    country_name_temp = request.args.get('country_name'),
    
    mean_temp=request.args.get('mean'),
    countrylatency_service_request = CountryLatencyRequest(
        country_name=country_name_temp[0], mean=bool(strtobool(mean_temp[0]))
    )
    countrylatency_service_response = country_latency_client.CountryLatencyInfo(
        countrylatency_service_request
    )
    return render_template(
        "countryLatency.html",
        countryLatency=countrylatency_service_response.countryLatency,
    )