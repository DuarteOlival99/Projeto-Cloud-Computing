# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: regionspeeds_service.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='regionspeeds_service.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x1aregionspeeds_service.proto\"=\n\x13RegionSpeedsRequest\x12\x13\n\x0bregion_name\x18\x01 \x01(\t\x12\x11\n\tmean\x18\x02 \x01(\x08\"\xba\x01\n\x0cRegionSpeeds\x12\x14\n\x0c\x63ountry_name\x18\x01 \x01(\t\x12\x14\n\x0c\x63ountry_code\x18\x02 \x01(\t\x12\x13\n\x0bregion_name\x18\x03 \x01(\t\x12\x13\n\x0bregion_code\x18\x04 \x01(\t\x12\x14\n\x0c\x64\x61te_request\x18\x05 \x01(\t\x12\x10\n\x08isp_name\x18\x06 \x01(\t\x12\x16\n\x0e\x64ownload_speed\x18\x07 \x01(\t\x12\x14\n\x0cupload_speed\x18\x08 \x01(\t\";\n\x14RegionSpeedsResponse\x12#\n\x0cregionSpeeds\x18\x01 \x03(\x0b\x32\r.RegionSpeeds2V\n\x13RegionSpeedsService\x12?\n\x10RegionSpeedsInfo\x12\x14.RegionSpeedsRequest\x1a\x15.RegionSpeedsResponseb\x06proto3'
)




_REGIONSPEEDSREQUEST = _descriptor.Descriptor(
  name='RegionSpeedsRequest',
  full_name='RegionSpeedsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='region_name', full_name='RegionSpeedsRequest.region_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mean', full_name='RegionSpeedsRequest.mean', index=1,
      number=2, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=30,
  serialized_end=91,
)


_REGIONSPEEDS = _descriptor.Descriptor(
  name='RegionSpeeds',
  full_name='RegionSpeeds',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='country_name', full_name='RegionSpeeds.country_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='country_code', full_name='RegionSpeeds.country_code', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='region_name', full_name='RegionSpeeds.region_name', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='region_code', full_name='RegionSpeeds.region_code', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='date_request', full_name='RegionSpeeds.date_request', index=4,
      number=5, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='isp_name', full_name='RegionSpeeds.isp_name', index=5,
      number=6, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='download_speed', full_name='RegionSpeeds.download_speed', index=6,
      number=7, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='upload_speed', full_name='RegionSpeeds.upload_speed', index=7,
      number=8, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=94,
  serialized_end=280,
)


_REGIONSPEEDSRESPONSE = _descriptor.Descriptor(
  name='RegionSpeedsResponse',
  full_name='RegionSpeedsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='regionSpeeds', full_name='RegionSpeedsResponse.regionSpeeds', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=282,
  serialized_end=341,
)

_REGIONSPEEDSRESPONSE.fields_by_name['regionSpeeds'].message_type = _REGIONSPEEDS
DESCRIPTOR.message_types_by_name['RegionSpeedsRequest'] = _REGIONSPEEDSREQUEST
DESCRIPTOR.message_types_by_name['RegionSpeeds'] = _REGIONSPEEDS
DESCRIPTOR.message_types_by_name['RegionSpeedsResponse'] = _REGIONSPEEDSRESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

RegionSpeedsRequest = _reflection.GeneratedProtocolMessageType('RegionSpeedsRequest', (_message.Message,), {
  'DESCRIPTOR' : _REGIONSPEEDSREQUEST,
  '__module__' : 'regionspeeds_service_pb2'
  # @@protoc_insertion_point(class_scope:RegionSpeedsRequest)
  })
_sym_db.RegisterMessage(RegionSpeedsRequest)

RegionSpeeds = _reflection.GeneratedProtocolMessageType('RegionSpeeds', (_message.Message,), {
  'DESCRIPTOR' : _REGIONSPEEDS,
  '__module__' : 'regionspeeds_service_pb2'
  # @@protoc_insertion_point(class_scope:RegionSpeeds)
  })
_sym_db.RegisterMessage(RegionSpeeds)

RegionSpeedsResponse = _reflection.GeneratedProtocolMessageType('RegionSpeedsResponse', (_message.Message,), {
  'DESCRIPTOR' : _REGIONSPEEDSRESPONSE,
  '__module__' : 'regionspeeds_service_pb2'
  # @@protoc_insertion_point(class_scope:RegionSpeedsResponse)
  })
_sym_db.RegisterMessage(RegionSpeedsResponse)



_REGIONSPEEDSSERVICE = _descriptor.ServiceDescriptor(
  name='RegionSpeedsService',
  full_name='RegionSpeedsService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_start=343,
  serialized_end=429,
  methods=[
  _descriptor.MethodDescriptor(
    name='RegionSpeedsInfo',
    full_name='RegionSpeedsService.RegionSpeedsInfo',
    index=0,
    containing_service=None,
    input_type=_REGIONSPEEDSREQUEST,
    output_type=_REGIONSPEEDSRESPONSE,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_REGIONSPEEDSSERVICE)

DESCRIPTOR.services_by_name['RegionSpeedsService'] = _REGIONSPEEDSSERVICE

# @@protoc_insertion_point(module_scope)