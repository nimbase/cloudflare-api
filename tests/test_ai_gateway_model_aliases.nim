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

suite "ai_gateway_model_aliases serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_model_aliases endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/model_aliases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliases("test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/model_aliases/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/model_aliases/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesId("test", "test", "test")

