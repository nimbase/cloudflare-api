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

suite "collections serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2CollectionsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2CollectionsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)) == openjson.toJson(obj)

suite "collections endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/collections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2Collections("test", 1.0, 1.0)

  test "POST /accounts/{account_id}/cloudforce-one/v2/collections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2Collections("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CollectionsCollectionId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/columns/{column_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnId("test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdExport("test", "test", true)

  test "GET /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItems("test", "test", "test", 1.0, "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemId("test", "test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemId("test", "test", "test")

