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

suite "cws_filter_schema serialization":
  test "round-trips CwsResponseFilterSchema":
    let obj = newCwsResponseFilterSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseFilterSchema)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

suite "cws_filter_schema endpoints":
  test "GET /cws/filter-schema":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsFilterSchema()

