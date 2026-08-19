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

suite "zone_subscription serialization":
  test "round-trips BillSubsApiZoneSubscriptionResponseSingle":
    let obj = newBillSubsApiZoneSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiZoneSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiSubscriptionV2":
    let obj = newBillSubsApiSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseSingle":
    let obj = newBillSubsApiApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zone_subscription endpoints":
  test "GET /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSubscription("test")

  test "POST /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSubscription("test", newBillSubsApiSubscriptionV2())

  test "PUT /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSubscription("test", newBillSubsApiSubscriptionV2())

  test "DELETE /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSubscription("test")

  test "POST /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSubscriptions("test", newBillSubsApiSubscriptionV2())

  test "PUT /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSubscriptions("test", newBillSubsApiSubscriptionV2())

  test "DELETE /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSubscriptions("test")

