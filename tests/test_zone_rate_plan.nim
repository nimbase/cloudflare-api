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

suite "zone_rate_plan serialization":
  test "round-trips BillSubsPlanResponseCollection":
    let obj = newBillSubsPlanResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsPlanResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCollection":
    let obj = newBillSubsApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsAvailableRatePlan":
    let obj = newBillSubsAvailableRatePlan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAvailableRatePlan)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseSingle":
    let obj = newBillSubsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseSingle)) == openjson.toJson(obj)

suite "zone_rate_plan endpoints":
  test "GET /zones/{zone_id}/available_plans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAvailablePlans("test")

  test "GET /zones/{zone_id}/available_plans/{plan_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAvailablePlansPlanIdentifier("test", "test")

  test "GET /zones/{zone_id}/available_rate_plans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAvailableRatePlans("test")

