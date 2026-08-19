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

suite "ai_gateway_datasets serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_datasets endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdDatasets("test", "test", 1, 1, "test", true, "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/datasets/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/datasets/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsId("test", "test", "test")

