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

suite "account_subscriptions serialization":
  test "round-trips BillSubsApiSubscriptionV2":
    let obj = newBillSubsApiSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsApiCancelReasonRequest":
    let obj = newBillSubsApiCancelReasonRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiCancelReasonRequest)) == openjson.toJson(obj)

  test "round-trips BillSubsApiBulkAccountSubscriptionResponse":
    let obj = newBillSubsApiBulkAccountSubscriptionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiBulkAccountSubscriptionResponse)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseSingle":
    let obj = newBillSubsApiApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiCancelReasonResponseSingle":
    let obj = newBillSubsApiCancelReasonResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiCancelReasonResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAccountSubscriptionResponseCollection":
    let obj = newBillSubsApiAccountSubscriptionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAccountSubscriptionResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAccountSubscriptionResponseSingle":
    let obj = newBillSubsApiAccountSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAccountSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "account_subscriptions endpoints":
  test "GET /accounts/{account_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptions("test")

  test "POST /accounts/{account_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptions("test", newBillSubsApiSubscriptionV2())

  test "GET /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test")

  test "PUT /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test", newBillSubsApiSubscriptionV2())

  test "DELETE /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test")

  test "POST /accounts/{account_id}/subscriptions/{subscription_identifier}/action/append":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptionsSubscriptionIdentifierActionAppend("test", "test", newBillSubsApiSubscriptionV2())

  test "GET /accounts/{account_id}/subscriptions/{subscription_identifier}/cancel-reason":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason("test", "test")

  test "POST /accounts/{account_id}/subscriptions/{subscription_identifier}/cancel-reason":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason("test", "test", newBillSubsApiCancelReasonRequest())

