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

suite "magic_gre_tunnels serialization":
  test "round-trips MagicGreTunnelUpdateRequest":
    let obj = newMagicGreTunnelUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicGreTunnelUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicCreateGreTunnelResponse":
    let obj = newMagicCreateGreTunnelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateGreTunnelResponse)) == openjson.toJson(obj)

  test "round-trips MagicCreateGreTunnelRequest":
    let obj = newMagicCreateGreTunnelRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateGreTunnelRequest)) == openjson.toJson(obj)

  test "round-trips MagicTunnelSingleResponse":
    let obj = newMagicTunnelSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTunnelSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicTunnelDeletedResponse":
    let obj = newMagicTunnelDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTunnelDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicTunnelsCollectionResponse":
    let obj = newMagicTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicModifiedTunnelsCollectionResponse":
    let obj = newMagicModifiedTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicModifiedTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicTunnelModifiedResponse":
    let obj = newMagicTunnelModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTunnelModifiedResponse)) == openjson.toJson(obj)

suite "magic_gre_tunnels endpoints":
  test "GET /accounts/{account_id}/magic/gre_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicGreTunnels("test")

  test "POST /accounts/{account_id}/magic/gre_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicGreTunnels("test", newMagicCreateGreTunnelRequest())

  test "PUT /accounts/{account_id}/magic/gre_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicGreTunnels("test")

  test "GET /accounts/{account_id}/magic/gre_tunnels/{gre_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicGreTunnelsGreTunnelId("test", "test")

  test "PUT /accounts/{account_id}/magic/gre_tunnels/{gre_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicGreTunnelsGreTunnelId("test", "test", newMagicGreTunnelUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/gre_tunnels/{gre_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicGreTunnelsGreTunnelId("test", "test")

