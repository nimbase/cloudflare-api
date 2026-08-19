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

suite "zone_analytics_deprecated serialization":
  test "round-trips ZoneAnalyticsApiColoResponse":
    let obj = newZoneAnalyticsApiColoResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiColoResponse)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiDashboardResponse":
    let obj = newZoneAnalyticsApiDashboardResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiDashboardResponse)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiUntil":
    let obj = newZoneAnalyticsApiUntil()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiUntil)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiApiResponseCommonFailure":
    let obj = newZoneAnalyticsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zone_analytics_deprecated endpoints":
  test "GET /zones/{zone_identifier}/analytics/colos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdentifierAnalyticsColos("test", newZoneAnalyticsApiUntil(), openjson.newJObject(), true)

  test "GET /zones/{zone_identifier}/analytics/dashboard":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdentifierAnalyticsDashboard("test", newZoneAnalyticsApiUntil(), openjson.newJObject(), true)

