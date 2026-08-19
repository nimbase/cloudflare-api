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

suite "zero_trust_gateway_pac_files serialization":
  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection10":
    let obj = newZeroTrustGatewayResponseCollection10()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection10)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse7":
    let obj = newZeroTrustGatewaySingleResponse7()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse7)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayEmptyResponse":
    let obj = newZeroTrustGatewayEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEmptyResponse)) == openjson.toJson(obj)

suite "zero_trust_gateway_pac_files endpoints":
  test "GET /accounts/{account_id}/gateway/pacfiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayPacfiles("test")

  test "GET /accounts/{account_id}/gateway/pacfiles/{pacfile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayPacfilesPacfileId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/pacfiles/{pacfile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayPacfilesPacfileId("test", "test")

