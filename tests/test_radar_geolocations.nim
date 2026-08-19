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

suite "radar_geolocations serialization":
  test "round-trips GetRadarGeolocationsResponse":
    let obj = cloudflare.GetRadarGeolocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarGeolocationsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarGeolocationsGeoIdResponse":
    let obj = cloudflare.GetRadarGeolocationsGeoIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarGeolocationsGeoIdResponse)) == openjson.toJson(obj)

suite "radar_geolocations endpoints":
  test "GET /radar/geolocations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarGeolocations(1, 1, "test", "test", {})

  test "GET /radar/geolocations/{geo_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarGeolocationsGeoId("test", {})

