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

suite "notification_history serialization":
  test "round-trips AaaHistoryComponentsSchemasResponseCollection":
    let obj = newAaaHistoryComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaHistoryComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure3":
    let obj = newAaaApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure3)) == openjson.toJson(obj)

suite "notification_history endpoints":
  test "GET /accounts/{account_id}/alerting/v3/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3History("test", 1.0, "test", 1.0, "test")

