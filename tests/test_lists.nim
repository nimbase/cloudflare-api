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

suite "lists serialization":
  test "round-trips ListsListResponseCollection":
    let obj = newListsListResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsListResponseCollection)) == openjson.toJson(obj)

  test "round-trips ListsBulkOperationResponseSingle":
    let obj = newListsBulkOperationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsBulkOperationResponseSingle)) == openjson.toJson(obj)

  test "round-trips ListsItemResponseSingle":
    let obj = newListsItemResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsItemResponseSingle)) == openjson.toJson(obj)

  test "round-trips ListsItemsListResponseCollection":
    let obj = newListsItemsListResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsItemsListResponseCollection)) == openjson.toJson(obj)

  test "round-trips ListsApiResponseCommonFailure":
    let obj = newListsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ListsListDeleteResponseCollection":
    let obj = newListsListDeleteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsListDeleteResponseCollection)) == openjson.toJson(obj)

  test "round-trips ListsListsResponseCollection":
    let obj = newListsListsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsListsResponseCollection)) == openjson.toJson(obj)

  test "round-trips ListsListsAsyncResponse":
    let obj = newListsListsAsyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ListsListsAsyncResponse)) == openjson.toJson(obj)

suite "lists endpoints":
  test "GET /accounts/{account_id}/rules/lists":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesLists("test")

  test "GET /accounts/{account_id}/rules/lists/bulk_operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesListsBulkOperationsOperationId("test", "test")

  test "GET /accounts/{account_id}/rules/lists/{list_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesListsListId("test", "test")

  test "DELETE /accounts/{account_id}/rules/lists/{list_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRulesListsListId("test", "test")

  test "GET /accounts/{account_id}/rules/lists/{list_id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesListsListIdItems("test", "test", "test", 1, "test")

  test "GET /accounts/{account_id}/rules/lists/{list_id}/items/{item_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesListsListIdItemsItemId("test", "test", "test")

