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

suite "smart_shield_settings serialization":
  test "round-trips SmartshieldApiResponseCommon":
    let obj = newSmartshieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SmartshieldSingleSmartShieldPatchResponse":
    let obj = newSmartshieldSingleSmartShieldPatchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldSingleSmartShieldPatchResponse)) == openjson.toJson(obj)

  test "round-trips SmartshieldSingleSmartShieldGetResponse":
    let obj = newSmartshieldSingleSmartShieldGetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldSingleSmartShieldGetResponse)) == openjson.toJson(obj)

  test "round-trips SmartshieldSmartShieldSettingsPatchBody":
    let obj = newSmartshieldSmartShieldSettingsPatchBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldSmartShieldSettingsPatchBody)) == openjson.toJson(obj)

  test "round-trips SmartshieldApiResponseCommonFailure":
    let obj = newSmartshieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldApiResponseCommonFailure)) == openjson.toJson(obj)

suite "smart_shield_settings endpoints":
  test "GET /zones/{zone_id}/smart_shield":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSmartShield("test")

  test "PATCH /zones/{zone_id}/smart_shield":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSmartShield("test", newSmartshieldSmartShieldSettingsPatchBody())

