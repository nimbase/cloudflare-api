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

suite "radar_ip serialization":
  test "round-trips GetRadarEntitiesIpResponse":
    let obj = cloudflare.GetRadarEntitiesIpResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesIpResponse)) == openjson.toJson(obj)

suite "radar_ip endpoints":
  test "GET /radar/entities/ip":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesIp("test", {})

