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

suite "cloudflare_tunnel serialization":
  test "round-trips TunnelWarpConnectorResponseSingle":
    let obj = newTunnelWarpConnectorResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelWarpConnectorResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelEmptyResponse":
    let obj = newTunnelEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelEmptyResponse)) == openjson.toJson(obj)

  test "round-trips TunnelCfdTunnelResponseCollection":
    let obj = newTunnelCfdTunnelResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelCfdTunnelResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelResponseCollection":
    let obj = newTunnelTunnelResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelConnectionsResponse":
    let obj = newTunnelTunnelConnectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelConnectionsResponse)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelWarpConnectorClientResponse":
    let obj = newTunnelTunnelWarpConnectorClientResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelWarpConnectorClientResponse)) == openjson.toJson(obj)

  test "round-trips TunnelWarpConnectorResponseCollection":
    let obj = newTunnelWarpConnectorResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelWarpConnectorResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelCfdTunnelResponseSingle":
    let obj = newTunnelCfdTunnelResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelCfdTunnelResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelWarpConnectorConnectionsResponse":
    let obj = newTunnelTunnelWarpConnectorConnectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelWarpConnectorConnectionsResponse)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelClientResponse":
    let obj = newTunnelTunnelClientResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelClientResponse)) == openjson.toJson(obj)

  test "round-trips TunnelTunnelResponseToken":
    let obj = newTunnelTunnelResponseToken()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelTunnelResponseToken)) == openjson.toJson(obj)

suite "cloudflare_tunnel endpoints":
  test "GET /accounts/{account_id}/cfd_tunnel/{tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCfdTunnelTunnelId("test", "test")

  test "DELETE /accounts/{account_id}/cfd_tunnel/{tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCfdTunnelTunnelId("test", "test")

  test "GET /accounts/{account_id}/cfd_tunnel/{tunnel_id}/connections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCfdTunnelTunnelIdConnections("test", "test")

  test "DELETE /accounts/{account_id}/cfd_tunnel/{tunnel_id}/connections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCfdTunnelTunnelIdConnections("test", "test", "test")

  test "GET /accounts/{account_id}/cfd_tunnel/{tunnel_id}/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCfdTunnelTunnelIdConnectorsConnectorId("test", "test", "test")

  test "GET /accounts/{account_id}/cfd_tunnel/{tunnel_id}/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCfdTunnelTunnelIdToken("test", "test")

  test "GET /accounts/{account_id}/warp_connector/{tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWarpConnectorTunnelId("test", "test")

  test "DELETE /accounts/{account_id}/warp_connector/{tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWarpConnectorTunnelId("test", "test")

  test "GET /accounts/{account_id}/warp_connector/{tunnel_id}/connections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWarpConnectorTunnelIdConnections("test", "test")

  test "GET /accounts/{account_id}/warp_connector/{tunnel_id}/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWarpConnectorTunnelIdConnectorsConnectorId("test", "test", "test")

  test "GET /accounts/{account_id}/warp_connector/{tunnel_id}/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWarpConnectorTunnelIdToken("test", "test")

