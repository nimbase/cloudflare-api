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

suite "rate_plans serialization":
  test "round-trips BillSubsApiRatePlanSimpleResponse":
    let obj = newBillSubsApiRatePlanSimpleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiRatePlanSimpleResponse)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "rate_plans endpoints":
  test "GET /billing/rate_plans/{public_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getBillingRatePlansPublicKey("test")

