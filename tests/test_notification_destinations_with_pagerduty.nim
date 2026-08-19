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

suite "notification_destinations_with_pagerduty serialization":
  test "round-trips AaaComponentsSchemasResponseCollection":
    let obj = newAaaComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaIdResponse":
    let obj = newAaaIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaIdResponse)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommon2":
    let obj = newAaaApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips AaaSensitiveIdResponse":
    let obj = newAaaSensitiveIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSensitiveIdResponse)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure3":
    let obj = newAaaApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure3)) == openjson.toJson(obj)

suite "notification_destinations_with_pagerduty endpoints":
  test "GET /accounts/{account_id}/alerting/v3/destinations/pagerduty":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3DestinationsPagerduty("test")

  test "DELETE /accounts/{account_id}/alerting/v3/destinations/pagerduty":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAlertingV3DestinationsPagerduty("test")

  test "POST /accounts/{account_id}/alerting/v3/destinations/pagerduty/connect":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAlertingV3DestinationsPagerdutyConnect("test")

  test "GET /accounts/{account_id}/alerting/v3/destinations/pagerduty/connect/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3DestinationsPagerdutyConnectTokenId("test", "test")

