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

suite "notification_policies serialization":
  test "round-trips AaaUnsubscribeEmailPostSingleResponse":
    let obj = newAaaUnsubscribeEmailPostSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaUnsubscribeEmailPostSingleResponse)) == openjson.toJson(obj)

  test "round-trips AaaUnsubscribeEmailSingleResponse":
    let obj = newAaaUnsubscribeEmailSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaUnsubscribeEmailSingleResponse)) == openjson.toJson(obj)

  test "round-trips AaaIdResponse":
    let obj = newAaaIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaIdResponse)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCollection":
    let obj = newAaaApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommon2":
    let obj = newAaaApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips AaaSingleResponse":
    let obj = newAaaSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaSingleResponse)) == openjson.toJson(obj)

  test "round-trips AaaFilters":
    let obj = newAaaFilters()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaFilters)) == openjson.toJson(obj)

  test "round-trips AaaMechanisms":
    let obj = newAaaMechanisms()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaMechanisms)) == openjson.toJson(obj)

  test "round-trips AaaPoliciesComponentsSchemasResponseCollection":
    let obj = newAaaPoliciesComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaPoliciesComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure3":
    let obj = newAaaApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure3)) == openjson.toJson(obj)

suite "notification_policies endpoints":
  test "GET /accounts/{account_id}/alerting/v3/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3Policies("test")

  test "GET /accounts/{account_id}/alerting/v3/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3PoliciesPolicyId("test", "test")

  test "DELETE /accounts/{account_id}/alerting/v3/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAlertingV3PoliciesPolicyId("test", "test")

  test "GET /accounts/{account_id}/alerting/v3/policies/{policy_id}/email/unsubscribe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAlertingV3PoliciesPolicyIdEmailUnsubscribe("test", "test", "test", "test")

  test "POST /accounts/{account_id}/alerting/v3/policies/{policy_id}/email/unsubscribe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAlertingV3PoliciesPolicyIdEmailUnsubscribe("test", "test", "test", "test")

