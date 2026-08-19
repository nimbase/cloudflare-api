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

suite "request_for_information_rfi serialization":
  test "round-trips CloudforceOneRequestsRequestMessageEdit":
    let obj = newCloudforceOneRequestsRequestMessageEdit()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestMessageEdit)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestList":
    let obj = newCloudforceOneRequestsRequestList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestList)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestConstants":
    let obj = newCloudforceOneRequestsRequestConstants()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestConstants)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsApiResponseCommon":
    let obj = newCloudforceOneRequestsApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsQuota":
    let obj = newCloudforceOneRequestsQuota()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsQuota)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestEdit":
    let obj = newCloudforceOneRequestsRequestEdit()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestEdit)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestListItem":
    let obj = newCloudforceOneRequestsRequestListItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestListItem)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestItem":
    let obj = newCloudforceOneRequestsRequestItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestItem)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestAssetList":
    let obj = newCloudforceOneRequestsRequestAssetList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestAssetList)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestMessageList":
    let obj = newCloudforceOneRequestsRequestMessageList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestMessageList)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestAssetEdit":
    let obj = newCloudforceOneRequestsRequestAssetEdit()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestAssetEdit)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsApiResponseCommonFailure":
    let obj = newCloudforceOneRequestsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestAssetItem":
    let obj = newCloudforceOneRequestsRequestAssetItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestAssetItem)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRequestsRequestMessageItem":
    let obj = newCloudforceOneRequestsRequestMessageItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRequestsRequestMessageItem)) == openjson.toJson(obj)

suite "request_for_information_rfi endpoints":
  test "POST /accounts/{account_id}/cloudforce-one/requests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequests("test", newCloudforceOneRequestsRequestList())

  test "GET /accounts/{account_id}/cloudforce-one/requests/constants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRequestsConstants("test")

  test "POST /accounts/{account_id}/cloudforce-one/requests/new":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequestsNew("test", newCloudforceOneRequestsRequestEdit())

  test "GET /accounts/{account_id}/cloudforce-one/requests/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRequestsQuota("test")

  test "GET /accounts/{account_id}/cloudforce-one/requests/types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRequestsTypes("test")

  test "GET /accounts/{account_id}/cloudforce-one/requests/{request_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRequestsRequestId("test", "test")

  test "PUT /accounts/{account_id}/cloudforce-one/requests/{request_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCloudforceOneRequestsRequestId("test", "test", newCloudforceOneRequestsRequestEdit())

  test "DELETE /accounts/{account_id}/cloudforce-one/requests/{request_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRequestsRequestId("test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/requests/{request_id}/asset":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequestsRequestIdAsset("test", "test", newCloudforceOneRequestsRequestAssetList())

  test "POST /accounts/{account_id}/cloudforce-one/requests/{request_id}/asset/new":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequestsRequestIdAssetNew("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/requests/{request_id}/asset/{asset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId("test", "test", "test")

  test "PUT /accounts/{account_id}/cloudforce-one/requests/{request_id}/asset/{asset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId("test", "test", "test", newCloudforceOneRequestsRequestAssetEdit())

  test "DELETE /accounts/{account_id}/cloudforce-one/requests/{request_id}/asset/{asset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId("test", "test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/requests/{request_id}/message":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequestsRequestIdMessage("test", "test", newCloudforceOneRequestsRequestMessageList())

  test "POST /accounts/{account_id}/cloudforce-one/requests/{request_id}/message/new":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRequestsRequestIdMessageNew("test", "test", newCloudforceOneRequestsRequestMessageEdit())

  test "PUT /accounts/{account_id}/cloudforce-one/requests/{request_id}/message/{message_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCloudforceOneRequestsRequestIdMessageMessageId("test", "test", 1, newCloudforceOneRequestsRequestMessageEdit())

  test "DELETE /accounts/{account_id}/cloudforce-one/requests/{request_id}/message/{message_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRequestsRequestIdMessageMessageId("test", "test", 1)

