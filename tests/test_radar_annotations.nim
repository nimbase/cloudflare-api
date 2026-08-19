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

suite "radar_annotations serialization":
  test "round-trips GetRadarAnnotationsResponse":
    let obj = cloudflare.GetRadarAnnotationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAnnotationsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAnnotationsOutagesResponse":
    let obj = cloudflare.GetRadarAnnotationsOutagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAnnotationsOutagesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAnnotationsOutagesLocationsResponse":
    let obj = cloudflare.GetRadarAnnotationsOutagesLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAnnotationsOutagesLocationsResponse)) == openjson.toJson(obj)

suite "radar_annotations endpoints":
  test "GET /radar/annotations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAnnotations(1, 1, "test", "test", "test", {}, {}, 1, "test", "test", {})

  test "GET /radar/annotations/outages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAnnotationsOutages(1, 1, "test", "test", "test", 1, "test", "test", {})

  test "GET /radar/annotations/outages/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAnnotationsOutagesLocations(1, "test", "test", "test", {})

