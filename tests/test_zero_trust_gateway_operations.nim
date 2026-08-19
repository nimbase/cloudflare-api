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

suite "zero_trust_gateway_operations serialization":
  test "round-trips ZeroTrustGatewayResponseCollection4":
    let obj = newZeroTrustGatewayResponseCollection4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection4)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse2":
    let obj = newZeroTrustGatewaySingleResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse2)) == openjson.toJson(obj)

suite "zero_trust_gateway_operations endpoints":
  test "GET /accounts/{account_id}/gateway/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayOperations("test")

  test "GET /accounts/{account_id}/gateway/operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayOperationsOperationId("test", "test")

