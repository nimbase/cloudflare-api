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

suite "analytics serialization":
  test "round-trips GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse)) == openjson.toJson(obj)

suite "analytics endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/analytics/daywise":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdAnalyticsDaywise("test", "test", "test", "test")

