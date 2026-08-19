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

suite "magic_interconnects serialization":
  test "round-trips MagicComponentsSchemasTunnelModifiedResponse":
    let obj = newMagicComponentsSchemasTunnelModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicComponentsSchemasTunnelModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicComponentsSchemasTunnelsCollectionResponse":
    let obj = newMagicComponentsSchemasTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicComponentsSchemasTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicComponentsSchemasTunnelSingleResponse":
    let obj = newMagicComponentsSchemasTunnelSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicComponentsSchemasTunnelSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicComponentsSchemasModifiedTunnelsCollectionResponse":
    let obj = newMagicComponentsSchemasModifiedTunnelsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicComponentsSchemasModifiedTunnelsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicInterconnectTunnelUpdateRequest":
    let obj = newMagicInterconnectTunnelUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicInterconnectTunnelUpdateRequest)) == openjson.toJson(obj)

suite "magic_interconnects endpoints":
  test "GET /accounts/{account_id}/magic/cf_interconnects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCfInterconnects("test")

  test "PUT /accounts/{account_id}/magic/cf_interconnects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCfInterconnects("test")

  test "GET /accounts/{account_id}/magic/cf_interconnects/{cf_interconnect_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCfInterconnectsCfInterconnectId("test", "test")

  test "PUT /accounts/{account_id}/magic/cf_interconnects/{cf_interconnect_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCfInterconnectsCfInterconnectId("test", "test", newMagicInterconnectTunnelUpdateRequest())

