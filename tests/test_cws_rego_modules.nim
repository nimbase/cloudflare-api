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

suite "cws_rego_modules serialization":
  test "round-trips CwsCreateRegoModuleInputBody":
    let obj = newCwsCreateRegoModuleInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateRegoModuleInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseRegoModule":
    let obj = newCwsResponseRegoModule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseRegoModule)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseRegoModule":
    let obj = newCwsPageResponseRegoModule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseRegoModule)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsUpdateRegoModuleInputBody":
    let obj = newCwsUpdateRegoModuleInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdateRegoModuleInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_rego_modules endpoints":
  test "GET /accounts/{account_id}/cws/rego-modules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsRegoModules("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/rego-modules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsRegoModules("test", newCwsCreateRegoModuleInputBody())

  test "GET /accounts/{account_id}/cws/rego-modules/{rego_module_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsRegoModulesRegoModuleId("test", "test")

  test "PUT /accounts/{account_id}/cws/rego-modules/{rego_module_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsRegoModulesRegoModuleId("test", "test", newCwsUpdateRegoModuleInputBody())

  test "DELETE /accounts/{account_id}/cws/rego-modules/{rego_module_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsRegoModulesRegoModuleId("test", "test")

