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

suite "access_scim_update_logs serialization":
  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessScimUpdateLogsResponse":
    let obj = newAccessScimUpdateLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimUpdateLogsResponse)) == openjson.toJson(obj)

suite "access_scim_update_logs endpoints":
  test "module has no sampleable endpoints":
    check true

