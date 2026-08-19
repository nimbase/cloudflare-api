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

suite "stream_webhook serialization":
  test "round-trips StreamWebhookResponseSingle":
    let obj = newStreamWebhookResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamWebhookResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamWebhookRequest":
    let obj = newStreamWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamWebhookRequest)) == openjson.toJson(obj)

  test "round-trips StreamDeletedResponse":
    let obj = newStreamDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDeletedResponse)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_webhook endpoints":
  test "GET /accounts/{account_id}/stream/webhook":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamWebhook("test")

  test "PUT /accounts/{account_id}/stream/webhook":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStreamWebhook("test", newStreamWebhookRequest())

  test "DELETE /accounts/{account_id}/stream/webhook":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamWebhook("test")

