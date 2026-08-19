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

suite "ai_gateway_gateways serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiGatewayGatewaysIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiGatewayGatewaysIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiGatewayGatewaysIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_gateways endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGateways("test", 1, 1, "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/url/{provider}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProvider("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysId("test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysId("test", "test")

