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

suite "analytics_engine serialization":
  test "round-trips AnalyticsEngineJsonFormatResponse":
    let obj = newAnalyticsEngineJsonFormatResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AnalyticsEngineJsonFormatResponse)) == openjson.toJson(obj)

suite "analytics_engine endpoints":
  test "GET /accounts/{account_id}/analytics_engine/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAnalyticsEngineSql("test")

  test "POST /accounts/{account_id}/analytics_engine/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsEngineSql()

