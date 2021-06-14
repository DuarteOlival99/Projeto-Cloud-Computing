import os

from flask import Flask, render_template,request,Response
import grpc
from distutils.util import strtobool

from countrypackageloss_service_pb2 import CountryPackageLossRequest
from countrypackageloss_service_pb2_grpc import CountryPackageLossServiceStub

app = Flask(__name__)


countrypackageloss_service_channel = grpc.insecure_channel(
    "countrypackagelossserver:50054"
)
country_package_loss_client = CountryPackageLossServiceStub(countrypackageloss_service_channel)

@app.route("/")
def render_default():
    return Response("Ok", status=200, mimetype='application/json')

@app.route("/country/internet_packageLoss")
def render_countryPackageLoss():

    country_name_temp = request.args.get('country_name'),
    mean_temp=request.args.get('mean'),
    countrypackageloss_service_request = CountryPackageLossRequest(
        country_name= country_name_temp[0], mean=bool(strtobool(mean_temp[0]))
    )
    countrypackageloss_service_response = country_package_loss_client.CountryPackageLossInfo(
        countrypackageloss_service_request
    )
    return render_template(
        "countryPackageLoss.html",
        countryPackageLoss=countrypackageloss_service_response.countryPackageLoss,
    )