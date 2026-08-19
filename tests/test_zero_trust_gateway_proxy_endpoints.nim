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

suite "zero_trust_gateway_proxy_endpoints serialization":
  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse5":
    let obj = newZeroTrustGatewaySingleResponse5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse5)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection9":
    let obj = newZeroTrustGatewayResponseCollection9()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection9)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayEmptyResponse":
    let obj = newZeroTrustGatewayEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayEmptyResponse)) == openjson.toJson(obj)

suite "zero_trust_gateway_proxy_endpoints endpoints":
  test "GET /accounts/{account_id}/gateway/proxy_endpoints":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayProxyEndpoints("test")

  test "GET /accounts/{account_id}/gateway/proxy_endpoints/{proxy_endpoint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayProxyEndpointsProxyEndpointId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/proxy_endpoints/{proxy_endpoint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayProxyEndpointsProxyEndpointId("test", "test")

