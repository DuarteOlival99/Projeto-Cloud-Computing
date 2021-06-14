    # syntax = docker/dockerfile:1.0-experimental
# DOCKER_BUILDKIT=1 docker build . -f marketplace/Dockerfile -t marketplace --secret id=ca.key,src=ca.key

FROM python

RUN mkdir /service
COPY protobufs/ /service/protobufs/
COPY / /service/cn_server/countrytotaltests_service


#COPY ca.pem /service/marketplace/
WORKDIR /service/cn_server/countrytotaltests_service
COPY requirements.txt .
RUN apt-get update
RUN apt-get install default-jdk -y
RUN pip install -r requirements.txt
# RUN export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# RUN export PATH=$PATH:$JAVA_HOME/bin
RUN python -m grpc_tools.protoc -I protobufs/ --python_out=. --grpc_python_out=. protobufs/countrytotaltests_service.proto
#RUN openssl req -nodes -newkey rsa:4096 -subj /CN=marketplace \
                #-keyout client.key -out client.csr
#RUN --mount=type=secret,id=ca.key \
    #openssl x509 -req -in client.csr -CA ca.pem -CAkey /run/secrets/ca.key \
                 #-set_serial 1 -out client.pem

EXPOSE 50057
ENTRYPOINT [ "python", "countrytotaltests_service.py" ]