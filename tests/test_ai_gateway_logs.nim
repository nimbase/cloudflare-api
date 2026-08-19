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

suite "ai_gateway_logs serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_logs endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdLogs("test", "test", "test", 1, 1, {}, {}, @["test"], true, {}, "test", "test", 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, openjson.newJObject(), true, true, "test", "test", "test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogs("test", "test", {}, {}, @["test"], 1)

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/logs/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsId("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/logs/{id}/request":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdRequest("test", "test", "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/logs/{id}/response":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse("test", "test", "test")

