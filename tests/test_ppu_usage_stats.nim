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

suite "ppu_usage_stats serialization":
  test "round-trips PayPerCrawlPPUUsageStatsResponse":
    let obj = newPayPerCrawlPPUUsageStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUUsageStatsResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

suite "ppu_usage_stats endpoints":
  test "GET /accounts/{account_id}/pay-per-use/usage-stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerUseUsageStats("test", "test", "test", 1, 1)

  test "GET /zones/{zone_id}/pay-per-use/usage-stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerUseUsageStats("test", "test", "test", 1, 1)

