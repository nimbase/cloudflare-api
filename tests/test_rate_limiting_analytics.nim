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

suite "rate_limiting_analytics serialization":
  test "round-trips RlanalyticsRateLimitAnalytics":
    let obj = newRlanalyticsRateLimitAnalytics()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RlanalyticsRateLimitAnalytics)) == openjson.toJson(obj)

  test "round-trips RlanalyticsApiResponseCommonFailure":
    let obj = newRlanalyticsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RlanalyticsApiResponseCommonFailure)) == openjson.toJson(obj)

suite "rate_limiting_analytics endpoints":
  test "GET /zones/{zone_id}/rate_limit_analytics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRateLimitAnalytics("test", "test", "test", {})

