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

suite "ai_gateway_evaluations serialization":
  test "round-trips GetAccountsAccountIdAiGatewayEvaluationTypesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayEvaluationTypesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayEvaluationTypesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse)) == openjson.toJson(obj)

suite "ai_gateway_evaluations endpoints":
  test "GET /accounts/{account_id}/ai-gateway/evaluation-types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayEvaluationTypes("test", 1, 1, "test", {})

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/evaluations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluations("test", "test", 1, 1, "test", true, "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/evaluations/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsId("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/evaluations/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsId("test", "test", "test")

