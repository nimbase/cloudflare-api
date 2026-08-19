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

suite "dns_settings_for_a_zone serialization":
  test "round-trips DnsSettingsDnsResponseSingle2":
    let obj = newDnsSettingsDnsResponseSingle2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsResponseSingle2)) == openjson.toJson(obj)

  test "round-trips DnsSettingsApiResponseCommonFailure":
    let obj = newDnsSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsSettingsDnsSettingsZonePatch":
    let obj = newDnsSettingsDnsSettingsZonePatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsSettingsZonePatch)) == openjson.toJson(obj)

suite "dns_settings_for_a_zone endpoints":
  test "GET /zones/{zone_id}/dns_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnsSettings("test")

  test "PATCH /zones/{zone_id}/dns_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdDnsSettings("test", newDnsSettingsDnsSettingsZonePatch())

