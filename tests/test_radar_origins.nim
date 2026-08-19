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

suite "radar_origins serialization":
  test "round-trips GetRadarOriginsResponse":
    let obj = cloudflare.GetRadarOriginsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarOriginsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarOriginsSummaryDimensionResponse":
    let obj = cloudflare.GetRadarOriginsSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarOriginsSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarOriginsTimeseriesResponse":
    let obj = cloudflare.GetRadarOriginsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarOriginsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarOriginsTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarOriginsTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarOriginsTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarOriginsSlugResponse":
    let obj = cloudflare.GetRadarOriginsSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarOriginsSlugResponse)) == openjson.toJson(obj)

suite "radar_origins endpoints":
  test "GET /radar/origins":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarOrigins(1, 1, {})

