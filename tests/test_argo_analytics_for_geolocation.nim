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

suite "argo_analytics_for_geolocation serialization":
  test "round-trips ArgoAnalyticsApiResponseCommonFailure":
    let obj = newArgoAnalyticsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArgoAnalyticsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ArgoAnalyticsResponseSingle":
    let obj = newArgoAnalyticsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArgoAnalyticsResponseSingle)) == openjson.toJson(obj)

suite "argo_analytics_for_geolocation endpoints":
  test "GET /zones/{zone_id}/analytics/latency/colos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAnalyticsLatencyColos("test")

