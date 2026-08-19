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

suite "dns_settings_for_an_account serialization":
  test "round-trips DnsSettingsAccountSettingsPatch":
    let obj = newDnsSettingsAccountSettingsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsAccountSettingsPatch)) == openjson.toJson(obj)

  test "round-trips DnsSettingsApiResponseCommonFailure":
    let obj = newDnsSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsSettingsDnsResponseSingle":
    let obj = newDnsSettingsDnsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsResponseSingle)) == openjson.toJson(obj)

suite "dns_settings_for_an_account endpoints":
  test "GET /accounts/{account_id}/dns_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsSettings("test")

  test "PATCH /accounts/{account_id}/dns_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDnsSettings("test", newDnsSettingsAccountSettingsPatch())

