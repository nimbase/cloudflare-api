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

suite "ai_search_instances serialization":
  test "round-trips GetAccountsAccountIdAiSearchInstancesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchInstancesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchInstancesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchInstancesIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchInstancesIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchInstancesIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchInstancesIdSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchInstancesIdSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchInstancesIdSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchInstancesIdStatsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesIdStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesIdStatsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse)) == openjson.toJson(obj)

suite "ai_search_instances endpoints":
  test "GET /accounts/{account_id}/ai-search/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstances("test", 1, 1, "test", "test", {}, {})

  test "GET /accounts/{account_id}/ai-search/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstancesId("test", "test")

  test "DELETE /accounts/{account_id}/ai-search/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchInstancesId("test", "test")

  test "GET /accounts/{account_id}/ai-search/instances/{id}/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstancesIdStats("test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstances("test", 1, 1, "test", "test", {}, {}, "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchNamespacesNameInstancesId("test", "test", "test")

  test "POST /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/purge_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCache("test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdStats("test", "test", "test")

