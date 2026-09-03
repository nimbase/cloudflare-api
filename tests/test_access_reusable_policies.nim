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

suite "access_reusable_policies serialization":
  test "round-trips AccessIdResponse4":
    let obj = newAccessIdResponse4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse4)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse10":
    let obj = newAccessSingleResponse10()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse10)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessPolicyReq":
    let obj = newAccessPolicyReq()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyReq)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection9":
    let obj = newAccessResponseCollection9()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection9)) == openjson.toJson(obj)

suite "access_reusable_policies endpoints":
  test "GET /accounts/{account_id}/access/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessPolicies("test", 1, 1)

  test "POST /accounts/{account_id}/access/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessPolicies("test", newAccessPolicyReq())

  test "GET /accounts/{account_id}/access/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessPoliciesPolicyId("test", "test")

  test "PUT /accounts/{account_id}/access/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessPoliciesPolicyId("test", "test", newAccessPolicyReq())

  test "DELETE /accounts/{account_id}/access/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessPoliciesPolicyId("test", "test")

