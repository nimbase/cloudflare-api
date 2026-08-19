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

suite "turnstile serialization":
  test "round-trips TurnstileApiResponseCommon":
    let obj = newTurnstileApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TurnstileApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips TurnstileResultInfo":
    let obj = newTurnstileResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TurnstileResultInfo)) == openjson.toJson(obj)

  test "round-trips TurnstileWidgetDetail":
    let obj = newTurnstileWidgetDetail()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TurnstileWidgetDetail)) == openjson.toJson(obj)

  test "round-trips TurnstileWidgetList":
    let obj = newTurnstileWidgetList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TurnstileWidgetList)) == openjson.toJson(obj)

  test "round-trips TurnstileApiResponseCommonFailure":
    let obj = newTurnstileApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TurnstileApiResponseCommonFailure)) == openjson.toJson(obj)

suite "turnstile endpoints":
  test "GET /accounts/{account_id}/challenges/widgets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdChallengesWidgets()

  test "GET /accounts/{account_id}/challenges/widgets/{sitekey}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdChallengesWidgetsSitekey()

  test "DELETE /accounts/{account_id}/challenges/widgets/{sitekey}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdChallengesWidgetsSitekey()

