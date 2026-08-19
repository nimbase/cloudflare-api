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

suite "tunnel_virtual_network serialization":
  test "round-trips TunnelVnetResponseSingle":
    let obj = newTunnelVnetResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelVnetResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelVnetResponseCollection":
    let obj = newTunnelVnetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelVnetResponseCollection)) == openjson.toJson(obj)

suite "tunnel_virtual_network endpoints":
  test "GET /accounts/{account_id}/teamnet/virtual_networks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTeamnetVirtualNetworks("test", "test", "test", true, true, true)

  test "DELETE /accounts/{account_id}/teamnet/virtual_networks/{virtual_network_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkId("test", "test")

