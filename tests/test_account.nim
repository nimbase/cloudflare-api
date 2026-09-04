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

suite "account serialization":
  test "round-trips BuildsGetAccountLimitResponse":
    let obj = newBuildsGetAccountLimitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsGetAccountLimitResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayLoggingStateResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayLoggingStateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayLoggingStateResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiGatewayLoggingStateResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiGatewayLoggingStateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiGatewayLoggingStateResponse)) == openjson.toJson(obj)

suite "account endpoints":
  test "GET /accounts/{account_id}/ai-gateway/logging-state":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayLoggingState("test")

  test "PATCH /accounts/{account_id}/ai-gateway/logging-state":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdAiGatewayLoggingState("test")

  test "GET /accounts/{account_id}/builds/account/limits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsAccountLimits("test")

