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

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

  test "round-trips CcAccountUsageResponse":
    let obj = newCcAccountUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcAccountUsageResponse)) == openjson.toJson(obj)

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

  test "GET /accounts/{account_id}/containers/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersUsage()

