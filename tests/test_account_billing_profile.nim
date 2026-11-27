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

suite "account_billing_profile serialization":
  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsBillingProfileRequest":
    let obj = newBillSubsBillingProfileRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsBillingProfileRequest)) == openjson.toJson(obj)

  test "round-trips BillSubsBillingResponseSingle":
    let obj = newBillSubsBillingResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsBillingResponseSingle)) == openjson.toJson(obj)

suite "account_billing_profile endpoints":
  test "GET /accounts/{account_id}/billing/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingProfile("test")

  test "POST /accounts/{account_id}/billing/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBillingProfile("test", newBillSubsBillingProfileRequest())

  test "PUT /accounts/{account_id}/billing/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBillingProfile("test", newBillSubsBillingProfileRequest())

  test "DELETE /accounts/{account_id}/billing/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBillingProfile("test")

