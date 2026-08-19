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

suite "api_shield_api_discovery serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldPatchDiscoveriesResponse":
    let obj = newApiShieldPatchDiscoveriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPatchDiscoveriesResponse)) == openjson.toJson(obj)

  test "round-trips ApiShieldDiscoveryOperation":
    let obj = newApiShieldDiscoveryOperation()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldDiscoveryOperation)) == openjson.toJson(obj)

  test "round-trips ApiShieldPatchDiscoveryResponse":
    let obj = newApiShieldPatchDiscoveryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPatchDiscoveryResponse)) == openjson.toJson(obj)

  test "round-trips ApiShieldSchemaResponseDiscovery":
    let obj = newApiShieldSchemaResponseDiscovery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSchemaResponseDiscovery)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiDiscoveryPatchMultipleRequest":
    let obj = newApiShieldApiDiscoveryPatchMultipleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiDiscoveryPatchMultipleRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

suite "api_shield_api_discovery endpoints":
  test "GET /zones/{zone_id}/api_gateway/discovery":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayDiscovery()

  test "PATCH /zones/{zone_id}/api_gateway/discovery/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdApiGatewayDiscoveryOperations(newApiShieldApiDiscoveryPatchMultipleRequest())

  test "GET /zones/{zone_id}/api_gateway/discovery/operations/{discovery_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayDiscoveryOperationsDiscoveryId()

