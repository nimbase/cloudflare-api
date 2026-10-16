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

suite "cws_policies serialization":
  test "round-trips CwsCreatePolicyInputBody":
    let obj = newCwsCreatePolicyInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreatePolicyInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponsePolicy":
    let obj = newCwsResponsePolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponsePolicy)) == openjson.toJson(obj)

  test "round-trips CwsUpdatePolicyInputBody":
    let obj = newCwsUpdatePolicyInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdatePolicyInputBody)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsPageResponsePolicy":
    let obj = newCwsPageResponsePolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponsePolicy)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_policies endpoints":
  test "GET /accounts/{account_id}/cws/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsPolicies("test", "test", 1, orderName, directionAsc, "test", "test", "test")

  test "POST /accounts/{account_id}/cws/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsPolicies("test", newCwsCreatePolicyInputBody())

  test "GET /accounts/{account_id}/cws/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsPoliciesPolicyId("test", "test")

  test "PUT /accounts/{account_id}/cws/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsPoliciesPolicyId("test", "test", newCwsUpdatePolicyInputBody())

  test "DELETE /accounts/{account_id}/cws/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsPoliciesPolicyId("test", "test")

