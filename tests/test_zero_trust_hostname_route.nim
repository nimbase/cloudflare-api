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

suite "zero_trust_hostname_route serialization":
  test "round-trips TunnelHostnameRouteResponseSingle":
    let obj = newTunnelHostnameRouteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelHostnameRouteResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelHostnameRouteResponseCollection":
    let obj = newTunnelHostnameRouteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelHostnameRouteResponseCollection)) == openjson.toJson(obj)

suite "zero_trust_hostname_route endpoints":
  test "GET /accounts/{account_id}/zerotrust/routes/hostname":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustRoutesHostname("test", "test", "test", "test", "test", "test", true, 1.0, 1.0)

  test "GET /accounts/{account_id}/zerotrust/routes/hostname/{hostname_route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustRoutesHostnameHostnameRouteId("test", "test")

  test "DELETE /accounts/{account_id}/zerotrust/routes/hostname/{hostname_route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdZerotrustRoutesHostnameHostnameRouteId("test", "test")

