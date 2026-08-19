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
  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse)) == openjson.toJson(obj)

suite "ai_search_instances_items endpoints":
  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdItems("test", "test", 1, 1, "test", {}, {}, "test", "test", "test", "test", "test")

  test "POST /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiSearchNamespacesNameInstancesIdItems("test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemId("test", "test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemId("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items/{item_id}/chunks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunks("test", "test", "test", 1, 1, "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items/{item_id}/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdDownload("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/items/{item_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogs("test", "test", "test", 1, "test", "test")

