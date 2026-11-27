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
  test "round-trips BillSubsZoneSubscriptionResponseSingle":
    let obj = newBillSubsZoneSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsZoneSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsSubscriptionV2":
    let obj = newBillSubsSubscriptionV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsSubscriptionV2)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseSingle":
    let obj = newBillSubsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseSingle)) == openjson.toJson(obj)

suite "zone_subscription endpoints":
  test "GET /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSubscription("test")

  test "POST /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSubscription("test", newBillSubsSubscriptionV2())

  test "PUT /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSubscription("test", newBillSubsSubscriptionV2())

  test "DELETE /zones/{zone_id}/subscription":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSubscription("test")

  test "POST /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSubscriptions("test", newBillSubsSubscriptionV2())

  test "PUT /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSubscriptions("test", newBillSubsSubscriptionV2())

  test "DELETE /zones/{zone_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSubscriptions("test")

