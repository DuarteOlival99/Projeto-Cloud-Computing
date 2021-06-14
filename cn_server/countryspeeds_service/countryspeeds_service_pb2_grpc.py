# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import countryspeeds_service_pb2 as countryspeeds__service__pb2


class CountrySpeedsServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.CountrySpeedsInfo = channel.unary_unary(
                '/CountrySpeedsService/CountrySpeedsInfo',
                request_serializer=countryspeeds__service__pb2.CountrySpeedsRequest.SerializeToString,
                response_deserializer=countryspeeds__service__pb2.CountrySpeedsResponse.FromString,
                )


class CountrySpeedsServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def CountrySpeedsInfo(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_CountrySpeedsServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'CountrySpeedsInfo': grpc.unary_unary_rpc_method_handler(
                    servicer.CountrySpeedsInfo,
                    request_deserializer=countryspeeds__service__pb2.CountrySpeedsRequest.FromString,
                    response_serializer=countryspeeds__service__pb2.CountrySpeedsResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'CountrySpeedsService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class CountrySpeedsService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def CountrySpeedsInfo(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/CountrySpeedsService/CountrySpeedsInfo',
            countryspeeds__service__pb2.CountrySpeedsRequest.SerializeToString,
            countryspeeds__service__pb2.CountrySpeedsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
