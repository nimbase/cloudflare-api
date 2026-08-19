# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import cloudflare
import ./common

suite "account_request_tracer serialization":
  test "round-trips RequestTracerApiResponseCommonFailure":
    let obj = newRequestTracerApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RequestTracerApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RequestTracerApiResponseCommon":
    let obj = newRequestTracerApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RequestTracerApiResponseCommon)) == openjson.toJson(obj)

suite "account_request_tracer endpoints":
  test "module has no sampleable endpoints":
    check true

