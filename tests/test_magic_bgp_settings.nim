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

suite "magic_bgp_settings serialization":
  test "round-trips MagicUpdateBgpSettingsRequest":
    let obj = newMagicUpdateBgpSettingsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicUpdateBgpSettingsRequest)) == openjson.toJson(obj)

  test "round-trips MagicMagicBgpSettingsResponse":
    let obj = newMagicMagicBgpSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicMagicBgpSettingsResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

suite "magic_bgp_settings endpoints":
  test "GET /accounts/{account_id}/magic/bgp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicBgpSettings("test")

  test "PUT /accounts/{account_id}/magic/bgp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicBgpSettings("test", newMagicUpdateBgpSettingsRequest())

