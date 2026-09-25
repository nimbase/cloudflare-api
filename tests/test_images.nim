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

suite "images serialization":
  test "round-trips GetZonesZoneIdImagesV1FlowsResponse":
    let obj = cloudflare.GetZonesZoneIdImagesV1FlowsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdImagesV1FlowsResponse)) == openjson.toJson(obj)

  test "round-trips PutZonesZoneIdImagesV1FlowsResponse":
    let obj = cloudflare.PutZonesZoneIdImagesV1FlowsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutZonesZoneIdImagesV1FlowsResponse)) == openjson.toJson(obj)

suite "images endpoints":
  test "GET /zones/{zone_id}/images/v1/flows":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdImagesV1Flows("test")

