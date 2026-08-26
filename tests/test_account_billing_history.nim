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

suite "account_billing_history serialization":
  test "round-trips BillSubsApiAccountBillingHistoryCollection":
    let obj = newBillSubsApiAccountBillingHistoryCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAccountBillingHistoryCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

suite "account_billing_history endpoints":
  test "GET /accounts/{account_id}/billing/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingHistory("test", 1, 1, "test")

