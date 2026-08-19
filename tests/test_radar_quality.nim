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

suite "radar_quality serialization":
  test "round-trips GetRadarQualityIqiSummaryResponse":
    let obj = cloudflare.GetRadarQualityIqiSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualityIqiSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarQualityIqiTimeseriesGroupsResponse":
    let obj = cloudflare.GetRadarQualityIqiTimeseriesGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualityIqiTimeseriesGroupsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarQualitySpeedHistogramResponse":
    let obj = cloudflare.GetRadarQualitySpeedHistogramResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualitySpeedHistogramResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarQualitySpeedSummaryResponse":
    let obj = cloudflare.GetRadarQualitySpeedSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualitySpeedSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarQualitySpeedTopAsesResponse":
    let obj = cloudflare.GetRadarQualitySpeedTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualitySpeedTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarQualitySpeedTopLocationsResponse":
    let obj = cloudflare.GetRadarQualitySpeedTopLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarQualitySpeedTopLocationsResponse)) == openjson.toJson(obj)

suite "radar_quality endpoints":
  test "GET /radar/quality/iqi/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualityIqiSummary(@["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {}, {})

  test "GET /radar/quality/iqi/timeseries_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualityIqiTimeseriesGroups({}, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], true, {}, {})

  test "GET /radar/quality/speed/histogram":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualitySpeedHistogram(@["test"], @["test"], @["test"], @["test"], @["test"], 1, {}, {})

  test "GET /radar/quality/speed/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualitySpeedSummary(@["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/quality/speed/top/ases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualitySpeedTopAses(1, @["test"], @["test"], @["test"], @["test"], @["test"], {}, true, {})

  test "GET /radar/quality/speed/top/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarQualitySpeedTopLocations(1, @["test"], @["test"], @["test"], @["test"], @["test"], {}, true, {})

