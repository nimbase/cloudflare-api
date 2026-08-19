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

suite "evaluation serialization":
  test "round-trips FlagshipError":
    let obj = newFlagshipError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipError)) == openjson.toJson(obj)

  test "round-trips FlagshipEvaluationResult":
    let obj = newFlagshipEvaluationResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipEvaluationResult)) == openjson.toJson(obj)

suite "evaluation endpoints":
  test "GET /accounts/{account_id}/flagship/apps/{app_id}/evaluate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppIdEvaluate("test", "test", "test", "test")

