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
  test "round-trips BillSubsBulkAccountSubscriptionResponse":
    let obj = newBillSubsBulkAccountSubscriptionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsBulkAccountSubscriptionResponse)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsAccountSubscriptionResponseCollection":
    let obj = newBillSubsAccountSubscriptionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAccountSubscriptionResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsSubscriptionV2":
    let obj = newBillSubsSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsCancelReasonResponseSingle":
    let obj = newBillSubsCancelReasonResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsCancelReasonResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsCancelReasonRequest":
    let obj = newBillSubsCancelReasonRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsCancelReasonRequest)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseSingle":
    let obj = newBillSubsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsAccountSubscriptionResponseSingle":
    let obj = newBillSubsAccountSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAccountSubscriptionResponseSingle)) == openjson.toJson(obj)

suite "account_subscriptions endpoints":
  test "GET /accounts/{account_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptions("test")

  test "POST /accounts/{account_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptions("test", newBillSubsSubscriptionV2())

  test "GET /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test")

  test "PUT /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test", newBillSubsSubscriptionV2())

  test "DELETE /accounts/{account_id}/subscriptions/{subscription_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSubscriptionsSubscriptionIdentifier("test", "test")

  test "POST /accounts/{account_id}/subscriptions/{subscription_identifier}/action/append":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptionsSubscriptionIdentifierActionAppend("test", "test", newBillSubsSubscriptionV2())

  test "GET /accounts/{account_id}/subscriptions/{subscription_identifier}/cancel-reason":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason("test", "test")

  test "POST /accounts/{account_id}/subscriptions/{subscription_identifier}/cancel-reason":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason("test", "test", newBillSubsCancelReasonRequest())

