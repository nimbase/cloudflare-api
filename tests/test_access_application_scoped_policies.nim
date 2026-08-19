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

suite "access_application_scoped_policies serialization":
  test "round-trips AccessIdResponse4":
    let obj = newAccessIdResponse4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse4)) == openjson.toJson(obj)

  test "round-trips AccessAppPolicyWriteRequest":
    let obj = newAccessAppPolicyWriteRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppPolicyWriteRequest)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse9":
    let obj = newAccessSingleResponse9()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse9)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection8":
    let obj = newAccessResponseCollection8()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection8)) == openjson.toJson(obj)

suite "access_application_scoped_policies endpoints":
  test "GET /accounts/{account_id}/access/apps/{app_id}/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsAppIdPolicies("test", "test", 1, 1)

  test "POST /accounts/{account_id}/access/apps/{app_id}/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessAppsAppIdPolicies("test", "test", newAccessAppPolicyWriteRequest())

  test "GET /accounts/{account_id}/access/apps/{app_id}/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsAppIdPoliciesPolicyId("test", "test", "test")

  test "PUT /accounts/{account_id}/access/apps/{app_id}/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessAppsAppIdPoliciesPolicyId("test", "test", "test", newAccessAppPolicyWriteRequest())

  test "DELETE /accounts/{account_id}/access/apps/{app_id}/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessAppsAppIdPoliciesPolicyId("test", "test", "test")

  test "PUT /accounts/{account_id}/access/apps/{app_id}/policies/{policy_id}/make_reusable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessAppsAppIdPoliciesPolicyIdMakeReusable("test", "test", "test")

