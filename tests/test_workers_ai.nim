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

suite "workers_ai serialization":
  test "round-trips GetAccountsAccountIdAiAuthorsSearchResponse":
    let obj = cloudflare.GetAccountsAccountIdAiAuthorsSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiAuthorsSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiModelsSchemaResponse":
    let obj = cloudflare.GetAccountsAccountIdAiModelsSchemaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiModelsSchemaResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiRunResponse":
    let obj = cloudflare.PostAccountsAccountIdAiRunResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiRunResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiRunModelNameResponse":
    let obj = cloudflare.PostAccountsAccountIdAiRunModelNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiRunModelNameResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiTasksSearchResponse":
    let obj = cloudflare.GetAccountsAccountIdAiTasksSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiTasksSearchResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiTomarkdownResponse":
    let obj = cloudflare.PostAccountsAccountIdAiTomarkdownResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiTomarkdownResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiTomarkdownSupportedResponse":
    let obj = cloudflare.GetAccountsAccountIdAiTomarkdownSupportedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiTomarkdownSupportedResponse)) == openjson.toJson(obj)

suite "workers_ai endpoints":
  test "GET /accounts/{account_id}/ai/authors/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiAuthorsSearch("test")

  test "GET /accounts/{account_id}/ai/models/schema":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiModelsSchema("test", "test")

  test "GET /accounts/{account_id}/ai/models/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiModelsSearch("test", 1, 1, "test", "test", 1.0, true, "test", true, {})

  test "POST /accounts/{account_id}/ai/run/{model_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiRunModelName("test", "test")

  test "GET /accounts/{account_id}/ai/tasks/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiTasksSearch("test")

  test "POST /accounts/{account_id}/ai/tomarkdown":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiTomarkdown("test")

  test "GET /accounts/{account_id}/ai/tomarkdown/supported":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiTomarkdownSupported("test")

