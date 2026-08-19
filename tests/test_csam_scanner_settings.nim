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

suite "csam_scanner_settings serialization":
  test "round-trips CsamConfigServiceCsamScannerThirdPartyUpdateRequest":
    let obj = newCsamConfigServiceCsamScannerThirdPartyUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CsamConfigServiceCsamScannerThirdPartyUpdateRequest)) == openjson.toJson(obj)

  test "round-trips CsamConfigServiceApiResponseCommonFailure":
    let obj = newCsamConfigServiceApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CsamConfigServiceApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CsamConfigServiceCsamScannerSingleResponse":
    let obj = newCsamConfigServiceCsamScannerSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CsamConfigServiceCsamScannerSingleResponse)) == openjson.toJson(obj)

suite "csam_scanner_settings endpoints":
  test "GET /zones/{zone_id}/settings/csam_scanner_third_party":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsCsamScannerThirdParty("test")

  test "PATCH /zones/{zone_id}/settings/csam_scanner_third_party":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsCsamScannerThirdParty("test", newCsamConfigServiceCsamScannerThirdPartyUpdateRequest())

