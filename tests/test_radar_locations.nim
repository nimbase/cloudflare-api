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

suite "radar_locations serialization":
  test "round-trips GetRadarEntitiesLocationsResponse":
    let obj = cloudflare.GetRadarEntitiesLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesLocationsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesLocationsLocationResponse":
    let obj = cloudflare.GetRadarEntitiesLocationsLocationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesLocationsLocationResponse)) == openjson.toJson(obj)

suite "radar_locations endpoints":
  test "GET /radar/entities/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesLocations(1, 1, "test", "test", "test", {}, {})

  test "GET /radar/entities/locations/{location}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesLocationsLocation("test", {})

