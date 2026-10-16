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

suite "ai_search_instances_items serialization":
  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse)) == openjson.toJson(obj)

suite "ai_search_instances_items endpoints":
  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItems("test", "test", "test", 1, 1, "test", sortByStatus, statusQueued, "test", "test", "test", "test")

  test "POST /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItems("test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemId("test", "test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemId("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items/{item_id}/chunks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunks("test", "test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items/{item_id}/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdDownload("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/items/{item_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogs("test", "test", "test", "test", 1, "test")

