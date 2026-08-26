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

suite "mcp_portal_analytics serialization":
  test "round-trips GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse)) == openjson.toJson(obj)

suite "mcp_portal_analytics endpoints":
  test "GET /accounts/{account_id}/access/ai-controls/mcp/analytics/portals/{portal_id}/tool-calls/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseries("test", "test", {}, {}, "test")

  test "GET /accounts/{account_id}/access/ai-controls/mcp/analytics/servers/{server_id}/tool-calls/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseries("test", "test", {}, {}, "test")

  test "GET /accounts/{account_id}/access/ai-controls/mcp/analytics/tool-calls/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseries("test", {}, {}, "test")

