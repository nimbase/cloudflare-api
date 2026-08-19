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

suite "zero_trust_gateway_locations serialization":
  test "round-trips ZeroTrustGatewayEndpoints":
    let obj = newZeroTrustGatewayEndpoints()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEndpoints)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection5":
    let obj = newZeroTrustGatewayResponseCollection5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection5)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayMaxTtl":
    let obj = newZeroTrustGatewayMaxTtl()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayMaxTtl)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse3":
    let obj = newZeroTrustGatewaySingleResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse3)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayEmptyResponse":
    let obj = newZeroTrustGatewayEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEmptyResponse)) == openjson.toJson(obj)

suite "zero_trust_gateway_locations endpoints":
  test "GET /accounts/{account_id}/gateway/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayLocations("test")

  test "GET /accounts/{account_id}/gateway/locations/{location_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayLocationsLocationId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/locations/{location_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayLocationsLocationId("test", "test")

