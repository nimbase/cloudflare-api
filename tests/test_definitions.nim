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

suite "definitions serialization":
  test "round-trips FlagshipFlagDefinitions":
    let obj = newFlagshipFlagDefinitions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipFlagDefinitions)) == openjson.toJson(obj)

suite "definitions endpoints":
  test "GET /accounts/{account_id}/flagship/apps/{app_id}/definitions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppIdDefinitions("test", "test")

