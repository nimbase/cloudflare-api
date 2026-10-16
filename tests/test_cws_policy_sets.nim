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

suite "cws_policy_sets serialization":
  test "round-trips CwsResponsePolicySet":
    let obj = newCwsResponsePolicySet()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponsePolicySet)) == openjson.toJson(obj)

  test "round-trips CwsCreatePolicySetInputBody":
    let obj = newCwsCreatePolicySetInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreatePolicySetInputBody)) == openjson.toJson(obj)

  test "round-trips CwsUpdatePolicySetInputBody":
    let obj = newCwsUpdatePolicySetInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdatePolicySetInputBody)) == openjson.toJson(obj)

  test "round-trips CwsPageResponsePolicySet":
    let obj = newCwsPageResponsePolicySet()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponsePolicySet)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_policy_sets endpoints":
  test "GET /accounts/{account_id}/cws/policy-sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsPolicySets("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/policy-sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsPolicySets("test", newCwsCreatePolicySetInputBody())

  test "GET /accounts/{account_id}/cws/policy-sets/{policy_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsPolicySetsPolicySetId("test", "test")

  test "PUT /accounts/{account_id}/cws/policy-sets/{policy_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsPolicySetsPolicySetId("test", "test", newCwsUpdatePolicySetInputBody())

  test "DELETE /accounts/{account_id}/cws/policy-sets/{policy_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsPolicySetsPolicySetId("test", "test")

