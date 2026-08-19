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

suite "ai_gateway_account_providers serialization":
  test "round-trips GetAccountsAccountIdAiGatewayCustomProvidersResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayCustomProvidersResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayCustomProvidersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayCustomProvidersResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayCustomProvidersIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_account_providers endpoints":
  test "GET /accounts/{account_id}/ai-gateway/custom-providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayCustomProviders("test", 1, 1, true, true, "test")

  test "GET /accounts/{account_id}/ai-gateway/custom-providers/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayCustomProvidersId("test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/custom-providers/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayCustomProvidersId("test", "test")

