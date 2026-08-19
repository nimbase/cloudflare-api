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
  test "round-trips BillSubsApiSubscriptionV2":
    let obj = newBillSubsApiSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsApiUserSubscriptionResponseSingle":
    let obj = newBillSubsApiUserSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiUserSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsApiUserSubscriptionResponseCollection":
    let obj = newBillSubsApiUserSubscriptionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiUserSubscriptionResponseCollection)) == openjson.toJson(obj)

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
    discard waitFor client.postUserSubscriptions(newBillSubsApiSubscriptionV2())

  test "PUT /user/subscriptions/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserSubscriptionsIdentifier("test", newBillSubsApiSubscriptionV2())

  test "DELETE /user/subscriptions/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserSubscriptionsIdentifier("test")

