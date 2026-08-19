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

suite "api_shield_settings serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldConfigurationSingleResponse":
    let obj = newApiShieldConfigurationSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldConfigurationSingleResponse)) == openjson.toJson(obj)

  test "round-trips ApiShieldConfiguration":
    let obj = newApiShieldConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldConfiguration)) == openjson.toJson(obj)

suite "api_shield_settings endpoints":
  test "GET /zones/{zone_id}/api_gateway/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayConfiguration()

  test "PUT /zones/{zone_id}/api_gateway/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayConfiguration(newApiShieldConfiguration())

