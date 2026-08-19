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

suite "billable_usage_v2 serialization":
  test "round-trips BillableUsageApiV2UsageQuery":
    let obj = newBillableUsageApiV2UsageQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiV2UsageQuery)) == openjson.toJson(obj)

  test "round-trips BillableUsageApiV2UsageResponse":
    let obj = newBillableUsageApiV2UsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiV2UsageResponse)) == openjson.toJson(obj)

  test "round-trips BillableUsageApiApiResponseCommonFailure":
    let obj = newBillableUsageApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillableUsageApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "billable_usage_v2 endpoints":
  test "GET /accounts/{account_id}/billable/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillableUsage("test", "test", "test")

  test "POST /accounts/{account_id}/billable/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBillableUsage("test", newBillableUsageApiV2UsageQuery())

  test "GET /organizations/{organization_id}/billable/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdBillableUsage("test", "test", "test")

