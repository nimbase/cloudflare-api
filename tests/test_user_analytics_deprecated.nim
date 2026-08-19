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

suite "user_analytics_deprecated serialization":
  test "round-trips ZoneAnalyticsApiUntil":
    let obj = newZoneAnalyticsApiUntil()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiUntil)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiApiResponseCommonFailure":
    let obj = newZoneAnalyticsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiSince":
    let obj = newZoneAnalyticsApiSince()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiSince)) == openjson.toJson(obj)

  test "round-trips ZoneAnalyticsApiUserDashboardResponse":
    let obj = newZoneAnalyticsApiUserDashboardResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneAnalyticsApiUserDashboardResponse)) == openjson.toJson(obj)

suite "user_analytics_deprecated endpoints":
  test "GET /user/analytics/dashboard":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserAnalyticsDashboard(newZoneAnalyticsApiSince(), newZoneAnalyticsApiUntil(), true)

