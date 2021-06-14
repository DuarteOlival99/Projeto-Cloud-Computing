    # syntax = docker/dockerfile:1.0-experimental
# DOCKER_BUILDKIT=1 docker build . -f marketplace/Dockerfile -t marketplace --secret id=ca.key,src=ca.key

FROM python

RUN mkdir /service
COPY protobufs/ /service/protobufs/
COPY / /service/cn_server/regionspeeds_service

#COPY ca.pem /service/marketplace/

WORKDIR /service/cn_server/regionspeeds_service
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN python -m grpc_tools.protoc -I protobufs/ --python_out=. --grpc_python_out=. protobufs/regionspeeds_service.proto
#RUN openssl req -nodes -newkey rsa:4096 -subj /CN=marketplace \
                #-keyout client.key -out client.csr
#RUN --mount=type=secret,id=ca.key \
    #openssl x509 -req -in client.csr -CA ca.pem -CAkey /run/secrets/ca.key \
                 #-set_serial 1 -out client.pem

EXPOSE 50056
ENTRYPOINT [ "python", "regionspeeds_service.py" ]
