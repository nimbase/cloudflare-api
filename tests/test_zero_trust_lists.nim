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

suite "zero_trust_lists serialization":
  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponseWithListItems":
    let obj = newZeroTrustGatewaySingleResponseWithListItems()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponseWithListItems)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayListSingleResponse":
    let obj = newZeroTrustGatewayListSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayListSingleResponse)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayCsvOperationSingleResponse":
    let obj = newZeroTrustGatewayCsvOperationSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayCsvOperationSingleResponse)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayListItemResponseCollection":
    let obj = newZeroTrustGatewayListItemResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayListItemResponseCollection)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection3":
    let obj = newZeroTrustGatewayResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection3)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayEmptyResponse":
    let obj = newZeroTrustGatewayEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEmptyResponse)) == openjson.toJson(obj)

suite "zero_trust_lists endpoints":
  test "POST /accounts/{account_id}/gateway/lists/upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayListsUpload("test")

  test "GET /accounts/{account_id}/gateway/lists/{list_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayListsListId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/lists/{list_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayListsListId("test", "test")

  test "GET /accounts/{account_id}/gateway/lists/{list_id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayListsListIdItems("test", "test")

