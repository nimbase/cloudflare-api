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

suite "notification_silences serialization":
  test "round-trips AaaSilenceComponentsSchemasResponseCollection":
    let obj = newAaaSilenceComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSilenceComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommon2":
    let obj = newAaaApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips AaaSilencesComponentsSchemasResponseCollection":
    let obj = newAaaSilencesComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSilencesComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaSilenceUpdateRequest":
    let obj = newAaaSilenceUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSilenceUpdateRequest)) == openjson.toJson(obj)

  test "round-trips AaaSilenceCreateRequest":
    let obj = newAaaSilenceCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSilenceCreateRequest)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure3":
    let obj = newAaaApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure3)) == openjson.toJson(obj)

suite "notification_silences endpoints":
  test "GET /accounts/{account_id}/alerting/v3/silences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3Silences("test")

  test "POST /accounts/{account_id}/alerting/v3/silences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAlertingV3Silences("test")

  test "PUT /accounts/{account_id}/alerting/v3/silences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAlertingV3Silences("test")

  test "GET /accounts/{account_id}/alerting/v3/silences/{silence_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3SilencesSilenceId("test", "test")

  test "DELETE /accounts/{account_id}/alerting/v3/silences/{silence_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAlertingV3SilencesSilenceId("test", "test")

