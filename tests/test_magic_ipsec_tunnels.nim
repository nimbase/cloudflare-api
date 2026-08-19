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

suite "magic_ipsec_tunnels serialization":
  test "round-trips MagicSchemasTunnelSingleResponse":
    let obj = newMagicSchemasTunnelSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasTunnelSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicIpsecTunnelAddSingleRequest":
    let obj = newMagicIpsecTunnelAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicIpsecTunnelAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicSchemasTunnelModifiedResponse":
    let obj = newMagicSchemasTunnelModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasTunnelModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicSchemasCreateIpsecTunnelResponse":
    let obj = newMagicSchemasCreateIpsecTunnelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasCreateIpsecTunnelResponse)) == openjson.toJson(obj)

  test "round-trips MagicSchemasModifiedTunnelsCollectionResponse":
    let obj = newMagicSchemasModifiedTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasModifiedTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicSchemasTunnelDeletedResponse":
    let obj = newMagicSchemasTunnelDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasTunnelDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicIpsecTunnelsPskResponse":
    let obj = newMagicIpsecTunnelsPskResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicIpsecTunnelsPskResponse)) == openjson.toJson(obj)

  test "round-trips MagicIpsecTunnelAddRequest":
    let obj = newMagicIpsecTunnelAddRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicIpsecTunnelAddRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicSchemasTunnelsCollectionResponse":
    let obj = newMagicSchemasTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSchemasTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicPskGenerationResponse":
    let obj = newMagicPskGenerationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicPskGenerationResponse)) == openjson.toJson(obj)

  test "round-trips MagicIpsecTunnelsPskRequest":
    let obj = newMagicIpsecTunnelsPskRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicIpsecTunnelsPskRequest)) == openjson.toJson(obj)

suite "magic_ipsec_tunnels endpoints":
  test "GET /accounts/{account_id}/magic/ipsec_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicIpsecTunnels("test")

  test "POST /accounts/{account_id}/magic/ipsec_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicIpsecTunnels("test", newMagicIpsecTunnelAddRequest())

  test "PUT /accounts/{account_id}/magic/ipsec_tunnels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicIpsecTunnels("test")

  test "POST /accounts/{account_id}/magic/ipsec_tunnels/psk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicIpsecTunnelsPsk("test", true, newMagicIpsecTunnelsPskRequest())

  test "GET /accounts/{account_id}/magic/ipsec_tunnels/{ipsec_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId("test", "test")

  test "PUT /accounts/{account_id}/magic/ipsec_tunnels/{ipsec_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId("test", "test", newMagicIpsecTunnelAddSingleRequest())

  test "DELETE /accounts/{account_id}/magic/ipsec_tunnels/{ipsec_tunnel_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId("test", "test")

  test "POST /accounts/{account_id}/magic/ipsec_tunnels/{ipsec_tunnel_id}/psk_generate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicIpsecTunnelsIpsecTunnelIdPskGenerate("test", "test")

