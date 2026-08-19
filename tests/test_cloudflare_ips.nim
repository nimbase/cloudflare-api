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

suite "cloudflare_ips serialization":
  test "round-trips PublicIpApiResponseSingle":
    let obj = newPublicIpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PublicIpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips PublicIpApiResponseCommonFailure":
    let obj = newPublicIpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PublicIpApiResponseCommonFailure)) == openjson.toJson(obj)

suite "cloudflare_ips endpoints":
  test "GET /ips":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getIps("test")

