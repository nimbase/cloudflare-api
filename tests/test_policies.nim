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

suite "policies serialization":
  test "round-trips PostureApiPolicyResponse":
    let obj = newPostureApiPolicyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPolicyResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiDeletePolicyResponse":
    let obj = newPostureApiDeletePolicyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiDeletePolicyResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiUpdatePolicyRequest":
    let obj = newPostureApiUpdatePolicyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiUpdatePolicyRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiCreatePolicyRequest":
    let obj = newPostureApiCreatePolicyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiCreatePolicyRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiApiResponseCollection":
    let obj = newPostureApiApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips PostureApiPolicyLogResponse":
    let obj = newPostureApiPolicyLogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPolicyLogResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiApiResponseCommon":
    let obj = newPostureApiApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PostureApiErrorResponse":
    let obj = newPostureApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiErrorResponse)) == openjson.toJson(obj)

suite "policies endpoints":
  test "GET /accounts/{account_id}/data-security/posture/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPosturePolicies("test", "test")

  test "POST /accounts/{account_id}/data-security/posture/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPosturePolicies("test", newPostureApiCreatePolicyRequest())

  test "GET /accounts/{account_id}/data-security/posture/policies/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPosturePoliciesLogs("test", "test", "test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/data-security/posture/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPosturePoliciesPolicyId("test", "test")

  test "PUT /accounts/{account_id}/data-security/posture/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDataSecurityPosturePoliciesPolicyId("test", "test", newPostureApiUpdatePolicyRequest())

  test "DELETE /accounts/{account_id}/data-security/posture/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDataSecurityPosturePoliciesPolicyId("test", "test")

