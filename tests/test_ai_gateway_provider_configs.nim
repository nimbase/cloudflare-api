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

suite "ai_gateway_provider_configs serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_provider_configs endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/provider_configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigs("test", "test", 1, 1)

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/provider_configs/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsId("test", "test", "test")

