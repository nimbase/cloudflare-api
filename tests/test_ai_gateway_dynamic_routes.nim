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

suite "ai_gateway_dynamic_routes serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_dynamic_routes endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutes("test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesId("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes/{id}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeployments("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes/{id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersions("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/routes/{id}/versions/{version_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionId("test", "test", "test", "test")

