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

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse)) == openjson.toJson(obj)

suite "ai_search_instances endpoints":
  test "GET /accounts/{account_id}/ai-search/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstances("test", 1, 1, "test", "test", "test", orderByCreatedAt, orderByDirectionAsc)

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

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstances("test", "test", 1, 1, "test", "test", orderByCreatedAt, orderByDirectionAsc)

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesId("test", "test", "test")

  test "POST /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/purge_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCache("test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStats("test", "test", "test")

