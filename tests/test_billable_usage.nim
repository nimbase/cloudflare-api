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

suite "billable_usage serialization":
  test "round-trips BillableUsageApiUsageInfoResponse":
    let obj = newBillableUsageApiUsageInfoResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiUsageInfoResponse)) == openjson.toJson(obj)

  test "round-trips BillableUsageApiApiResponseCommonFailure":
    let obj = newBillableUsageApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillableUsageApiUsageResponse":
    let obj = newBillableUsageApiUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiUsageResponse)) == openjson.toJson(obj)

suite "billable_usage endpoints":
  test "GET /accounts/{account_id}/billable-usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillableUsage("test", "test", "test")

  test "GET /accounts/{account_id}/billable-usage/info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillableUsageInfo("test")

