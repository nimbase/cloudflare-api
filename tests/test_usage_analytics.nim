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

suite "usage_analytics serialization":
  test "round-trips UsageAnalyticsErrorResponse":
    let obj = newUsageAnalyticsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UsageAnalyticsErrorResponse)) == openjson.toJson(obj)

  test "round-trips UsageAnalyticsBillingUsageResponse":
    let obj = newUsageAnalyticsBillingUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UsageAnalyticsBillingUsageResponse)) == openjson.toJson(obj)

  test "round-trips UsageAnalyticsStreamUsageResponse":
    let obj = newUsageAnalyticsStreamUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UsageAnalyticsStreamUsageResponse)) == openjson.toJson(obj)

suite "usage_analytics endpoints":
  test "GET /accounts/{account_id}/billing/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingUsage("test", "test", "test", "test", {}, 1, "test")

  test "GET /accounts/{account_id}/media/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMediaUsage("test", "test", "test", "test", {}, 1, "test")

  test "GET /accounts/{account_id}/stream/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamUsage("test", "test", "test", "test", {}, 1, "test")

  test "GET /zones/{zone_id}/media/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdMediaUsage("test", "test", "test", "test", {}, 1, "test")

  test "GET /zones/{zone_id}/stream/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdStreamUsage("test", "test", "test", "test", {}, 1, "test")

