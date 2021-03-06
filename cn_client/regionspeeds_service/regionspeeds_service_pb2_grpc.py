# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import regionspeeds_service_pb2 as regionspeeds__service__pb2


class RegionSpeedsServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.RegionSpeedsInfo = channel.unary_unary(
                '/RegionSpeedsService/RegionSpeedsInfo',
                request_serializer=regionspeeds__service__pb2.RegionSpeedsRequest.SerializeToString,
                response_deserializer=regionspeeds__service__pb2.RegionSpeedsResponse.FromString,
                )


class RegionSpeedsServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def RegionSpeedsInfo(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_RegionSpeedsServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'RegionSpeedsInfo': grpc.unary_unary_rpc_method_handler(
                    servicer.RegionSpeedsInfo,
                    request_deserializer=regionspeeds__service__pb2.RegionSpeedsRequest.FromString,
                    response_serializer=regionspeeds__service__pb2.RegionSpeedsResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'RegionSpeedsService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class RegionSpeedsService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def RegionSpeedsInfo(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/RegionSpeedsService/RegionSpeedsInfo',
            regionspeeds__service__pb2.RegionSpeedsRequest.SerializeToString,
            regionspeeds__service__pb2.RegionSpeedsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
