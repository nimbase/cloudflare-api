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

suite "radar_post_quantum serialization":
  test "round-trips GetRadarPostQuantumOriginSummaryDimensionResponse":
    let obj = cloudflare.GetRadarPostQuantumOriginSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarPostQuantumOriginSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarPostQuantumTlsSupportResponse":
    let obj = cloudflare.GetRadarPostQuantumTlsSupportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarPostQuantumTlsSupportResponse)) == openjson.toJson(obj)

suite "radar_post_quantum endpoints":
  test "GET /radar/post_quantum/tls/support":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarPostQuantumTlsSupport("test")

