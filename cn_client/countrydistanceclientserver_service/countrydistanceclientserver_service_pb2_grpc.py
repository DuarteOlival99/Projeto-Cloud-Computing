# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import countrydistanceclientserver_service_pb2 as countrydistanceclientserver__service__pb2


class CountryDistanceClientServerServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.CountryDistanceClientServerInfo = channel.unary_unary(
                '/CountryDistanceClientServerService/CountryDistanceClientServerInfo',
                request_serializer=countrydistanceclientserver__service__pb2.CountryDistanceClientServerRequest.SerializeToString,
                response_deserializer=countrydistanceclientserver__service__pb2.CountryDistanceClientServerResponse.FromString,
                )


class CountryDistanceClientServerServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def CountryDistanceClientServerInfo(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_CountryDistanceClientServerServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'CountryDistanceClientServerInfo': grpc.unary_unary_rpc_method_handler(
                    servicer.CountryDistanceClientServerInfo,
                    request_deserializer=countrydistanceclientserver__service__pb2.CountryDistanceClientServerRequest.FromString,
                    response_serializer=countrydistanceclientserver__service__pb2.CountryDistanceClientServerResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'CountryDistanceClientServerService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class CountryDistanceClientServerService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def CountryDistanceClientServerInfo(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/CountryDistanceClientServerService/CountryDistanceClientServerInfo',
            countrydistanceclientserver__service__pb2.CountryDistanceClientServerRequest.SerializeToString,
            countrydistanceclientserver__service__pb2.CountryDistanceClientServerResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
