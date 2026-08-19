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

suite "cloudflare_tunnel_configuration serialization":
  test "round-trips TunnelConfigurationResponse":
    let obj = newTunnelConfigurationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelConfigurationResponse)) == openjson.toJson(obj)

  test "round-trips TunnelMeshConfigurationRequestBody":
    let obj = newTunnelMeshConfigurationRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelMeshConfigurationRequestBody)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure2":
    let obj = newTunnelApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips TunnelMeshConfigurationResponseSingle":
    let obj = newTunnelMeshConfigurationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelMeshConfigurationResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelConfig":
    let obj = newTunnelConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelConfig)) == openjson.toJson(obj)

suite "cloudflare_tunnel_configuration endpoints":
  test "GET /accounts/{account_id}/cfd_tunnel/{tunnel_id}/configurations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCfdTunnelTunnelIdConfigurations("test", "test")

  test "GET /accounts/{account_id}/warp_connector/{tunnel_id}/configurations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWarpConnectorTunnelIdConfigurations("test", "test")

  test "PUT /accounts/{account_id}/warp_connector/{tunnel_id}/configurations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWarpConnectorTunnelIdConfigurations("test", "test", newTunnelMeshConfigurationRequestBody())

