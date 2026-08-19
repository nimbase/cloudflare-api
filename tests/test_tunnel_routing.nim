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

suite "tunnel_routing serialization":
  test "round-trips TunnelTeamnetResponseSingle":
    let obj = newTunnelTeamnetResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTeamnetResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelRouteResponseSingle":
    let obj = newTunnelRouteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelRouteResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelTeamnetResponseCollection":
    let obj = newTunnelTeamnetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTeamnetResponseCollection)) == openjson.toJson(obj)

suite "tunnel_routing endpoints":
  test "GET /accounts/{account_id}/teamnet/routes/ip/{ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTeamnetRoutesIpIp("test", "test", "test", true)

  test "PATCH /accounts/{account_id}/teamnet/routes/network/{ip_network_encoded}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncoded("test", "test")

  test "GET /accounts/{account_id}/teamnet/routes/{route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTeamnetRoutesRouteId("test", "test")

  test "DELETE /accounts/{account_id}/teamnet/routes/{route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTeamnetRoutesRouteId("test", "test")

