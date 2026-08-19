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

suite "radar_traffic_anomalies serialization":
  test "round-trips GetRadarTrafficAnomaliesResponse":
    let obj = cloudflare.GetRadarTrafficAnomaliesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTrafficAnomaliesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarTrafficAnomaliesLocationsResponse":
    let obj = cloudflare.GetRadarTrafficAnomaliesLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTrafficAnomaliesLocationsResponse)) == openjson.toJson(obj)

suite "radar_traffic_anomalies endpoints":
  test "GET /radar/traffic_anomalies/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarTrafficAnomaliesLocations(1, "test", "test", "test", {}, {})

