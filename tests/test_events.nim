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

suite "events serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsGraphResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsGraphResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsGraphResponse)) == openjson.toJson(obj)

suite "events endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/graph":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsGraph("test", @["test"], "test", "test", 1.0, 1.0, @["test"], @["test"], "test", @["test"])

