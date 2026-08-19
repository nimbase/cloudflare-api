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

suite "zero_trust_gateway_rules serialization":
  test "round-trips ZeroTrustGatewayExpiration":
    let obj = newZeroTrustGatewayExpiration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayExpiration)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection6":
    let obj = newZeroTrustGatewayResponseCollection6()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection6)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySchedule":
    let obj = newZeroTrustGatewaySchedule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySchedule)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse4":
    let obj = newZeroTrustGatewaySingleResponse4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse4)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayRuleSettings":
    let obj = newZeroTrustGatewayRuleSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayRuleSettings)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayEmptyResponse":
    let obj = newZeroTrustGatewayEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEmptyResponse)) == openjson.toJson(obj)

suite "zero_trust_gateway_rules endpoints":
  test "GET /accounts/{account_id}/gateway/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayRules("test")

  test "PATCH /accounts/{account_id}/gateway/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdGatewayRules("test")

  test "GET /accounts/{account_id}/gateway/rules/tenant":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayRulesTenant("test")

  test "GET /accounts/{account_id}/gateway/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayRulesRuleId("test", "test")

  test "POST /accounts/{account_id}/gateway/rules/{rule_id}/reset_expiration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayRulesRuleIdResetExpiration("test", "test")

