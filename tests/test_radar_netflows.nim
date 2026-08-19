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

suite "radar_netflows serialization":
  test "round-trips GetRadarNetflowsSummaryResponse":
    let obj = cloudflare.GetRadarNetflowsSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarNetflowsSummaryDimensionResponse":
    let obj = cloudflare.GetRadarNetflowsSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarNetflowsTimeseriesResponse":
    let obj = cloudflare.GetRadarNetflowsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarNetflowsTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarNetflowsTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarNetflowsTopAsesResponse":
    let obj = cloudflare.GetRadarNetflowsTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarNetflowsTopLocationsResponse":
    let obj = cloudflare.GetRadarNetflowsTopLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarNetflowsTopLocationsResponse)) == openjson.toJson(obj)

suite "radar_netflows endpoints":
  test "GET /radar/netflows/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarNetflowsSummary(@["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/netflows/top/ases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarNetflowsTopAses(1, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/netflows/top/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarNetflowsTopLocations(1, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

