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
  test "round-trips BillSubsApiPlanResponseCollection":
    let obj = newBillSubsApiPlanResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiPlanResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseSingle":
    let obj = newBillSubsApiApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAvailableRatePlan":
    let obj = newBillSubsApiAvailableRatePlan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAvailableRatePlan)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCollection":
    let obj = newBillSubsApiApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

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

