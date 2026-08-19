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

suite "indicator_types serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse)) == openjson.toJson(obj)

suite "indicator_types endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/indicator-types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsIndicatorTypes("test", @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/indicatorTypes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsIndicatorTypes("test")

