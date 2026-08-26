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

suite "health serialization":
  test "round-trips MonolithHealthResponse":
    let obj = newMonolithHealthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonolithHealthResponse)) == openjson.toJson(obj)

suite "health endpoints":
  test "GET /api/v4/health":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiV4Health()

