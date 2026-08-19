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

suite "radar_top_level_domains serialization":
  test "round-trips GetRadarTldsResponse":
    let obj = cloudflare.GetRadarTldsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTldsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarTldsPerformanceSummaryDimensionResponse":
    let obj = cloudflare.GetRadarTldsPerformanceSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTldsPerformanceSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarTldsTldResponse":
    let obj = cloudflare.GetRadarTldsTldResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTldsTldResponse)) == openjson.toJson(obj)

suite "radar_top_level_domains endpoints":
  test "GET /radar/tlds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarTlds(1, 1, "test", {}, "test", {})

  test "GET /radar/tlds/{tld}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarTldsTld("test", {})

