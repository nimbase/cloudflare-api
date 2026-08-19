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

suite "ai_gateway_account_provider_costs serialization":
  test "round-trips GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_account_provider_costs endpoints":
  test "GET /accounts/{account_id}/ai-gateway/custom-providers/costs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayCustomProvidersCosts("test", 1, 1, true, "test", {}, "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/custom-providers/costs/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayCustomProvidersCostsId("test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/custom-providers/costs/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayCustomProvidersCostsId("test", "test")

