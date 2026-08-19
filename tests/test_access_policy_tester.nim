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

suite "access_policy_tester serialization":
  test "round-trips AccessPolicyUsersResp":
    let obj = newAccessPolicyUsersResp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyUsersResp)) == openjson.toJson(obj)

  test "round-trips AccessPolicyInitReq":
    let obj = newAccessPolicyInitReq()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyInitReq)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessPolicyUpdateResp":
    let obj = newAccessPolicyUpdateResp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyUpdateResp)) == openjson.toJson(obj)

  test "round-trips AccessPolicyInitResp":
    let obj = newAccessPolicyInitResp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyInitResp)) == openjson.toJson(obj)

suite "access_policy_tester endpoints":
  test "POST /accounts/{account_id}/access/policy-tests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessPolicyTests("test", newAccessPolicyInitReq())

  test "GET /accounts/{account_id}/access/policy-tests/{policy_test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessPolicyTestsPolicyTestId("test", "test")

  test "GET /accounts/{account_id}/access/policy-tests/{policy_test_id}/users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessPolicyTestsPolicyTestIdUsers("test", "test", 1, 1, {})

