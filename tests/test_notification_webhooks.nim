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

suite "notification_webhooks serialization":
  test "round-trips AaaSchemasSingleResponse":
    let obj = newAaaSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips AaaIdResponse":
    let obj = newAaaIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaIdResponse)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommon2":
    let obj = newAaaApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips AaaWebhooksComponentsSchemasResponseCollection":
    let obj = newAaaWebhooksComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaWebhooksComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure3":
    let obj = newAaaApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure3)) == openjson.toJson(obj)

suite "notification_webhooks endpoints":
  test "GET /accounts/{account_id}/alerting/v3/destinations/webhooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3DestinationsWebhooks("test")

  test "GET /accounts/{account_id}/alerting/v3/destinations/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3DestinationsWebhooksWebhookId("test", "test")

  test "DELETE /accounts/{account_id}/alerting/v3/destinations/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAlertingV3DestinationsWebhooksWebhookId("test", "test")

