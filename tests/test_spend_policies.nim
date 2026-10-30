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

suite "spend_policies serialization":
  test "round-trips BillingSpendPoliciesPolicyDeleteResponse":
    let obj = newBillingSpendPoliciesPolicyDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyDeleteResponse)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesPolicyInput":
    let obj = newBillingSpendPoliciesPolicyInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyInput)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesPolicyActivityResponse":
    let obj = newBillingSpendPoliciesPolicyActivityResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyActivityResponse)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesPolicyAuditResponse":
    let obj = newBillingSpendPoliciesPolicyAuditResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyAuditResponse)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesPolicyListResponse":
    let obj = newBillingSpendPoliciesPolicyListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyListResponse)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesPolicyResponse":
    let obj = newBillingSpendPoliciesPolicyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesPolicyResponse)) == openjson.toJson(obj)

  test "round-trips BillingSpendPoliciesApiResponseCommonFailure":
    let obj = newBillingSpendPoliciesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillingSpendPoliciesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "spend_policies endpoints":
  test "GET /accounts/{account_id}/billing/spend-policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingSpendPolicies("test")

  test "POST /accounts/{account_id}/billing/spend-policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBillingSpendPolicies("test", newBillingSpendPoliciesPolicyInput())

  test "GET /accounts/{account_id}/billing/spend-policies/activity":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingSpendPoliciesActivity("test", 1, "test")

  test "GET /accounts/{account_id}/billing/spend-policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingSpendPoliciesPolicyId("test", "test")

  test "PUT /accounts/{account_id}/billing/spend-policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBillingSpendPoliciesPolicyId("test", "test", newBillingSpendPoliciesPolicyInput())

  test "DELETE /accounts/{account_id}/billing/spend-policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBillingSpendPoliciesPolicyId("test", "test")

  test "GET /accounts/{account_id}/billing/spend-policies/{policy_id}/audit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingSpendPoliciesPolicyIdAudit("test", "test", 1)

