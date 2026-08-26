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

suite "nel_settings serialization":
  test "round-trips NelConfigNelSettingResponse":
    let obj = newNelConfigNelSettingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NelConfigNelSettingResponse)) == openjson.toJson(obj)

  test "round-trips NelConfigApiResponseFailure":
    let obj = newNelConfigApiResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NelConfigApiResponseFailure)) == openjson.toJson(obj)

  test "round-trips NelConfigNelSettingPatch":
    let obj = newNelConfigNelSettingPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NelConfigNelSettingPatch)) == openjson.toJson(obj)

suite "nel_settings endpoints":
  test "GET /zones/{zone_id}/settings/nel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsNel("test")

  test "PATCH /zones/{zone_id}/settings/nel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsNel("test", newNelConfigNelSettingPatch())

