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

suite "user_subscription serialization":
  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsUserSubscriptionResponseCollection":
    let obj = newBillSubsUserSubscriptionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsUserSubscriptionResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsSubscriptionV2":
    let obj = newBillSubsSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsUserSubscriptionResponseSingle":
    let obj = newBillSubsUserSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsUserSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsAccountSubscriptionResponseSingle":
    let obj = newBillSubsAccountSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAccountSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips DeleteUserSubscriptionsIdentifierResponse":
    let obj = cloudflare.DeleteUserSubscriptionsIdentifierResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteUserSubscriptionsIdentifierResponse)) == openjson.toJson(obj)

suite "user_subscription endpoints":
  test "GET /user/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserSubscriptions()

  test "POST /user/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postUserSubscriptions(newBillSubsSubscriptionV2())

  test "GET /user/subscriptions/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserSubscriptionsIdentifier("test")

  test "PUT /user/subscriptions/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserSubscriptionsIdentifier("test", newBillSubsSubscriptionV2())

  test "DELETE /user/subscriptions/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserSubscriptionsIdentifier("test")

