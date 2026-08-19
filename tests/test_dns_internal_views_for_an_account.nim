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

suite "dns_internal_views_for_an_account serialization":
  test "round-trips DnsSettingsDnsViewPatch":
    let obj = newDnsSettingsDnsViewPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsViewPatch)) == openjson.toJson(obj)

  test "round-trips DnsSettingsDnsViewPost":
    let obj = newDnsSettingsDnsViewPost()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsViewPost)) == openjson.toJson(obj)

  test "round-trips DnsSettingsApiResponseCommonFailure":
    let obj = newDnsSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsSettingsDnsViewResponseCollection":
    let obj = newDnsSettingsDnsViewResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsViewResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnsSettingsDnsViewResponseSingle":
    let obj = newDnsSettingsDnsViewResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsDnsViewResponseSingle)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse)) == openjson.toJson(obj)

suite "dns_internal_views_for_an_account endpoints":
  test "POST /accounts/{account_id}/dns_settings/views":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDnsSettingsViews("test", newDnsSettingsDnsViewPost())

  test "GET /accounts/{account_id}/dns_settings/views/{view_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsSettingsViewsViewId("test", "test")

  test "DELETE /accounts/{account_id}/dns_settings/views/{view_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDnsSettingsViewsViewId("test", "test")

  test "PATCH /accounts/{account_id}/dns_settings/views/{view_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDnsSettingsViewsViewId("test", "test", newDnsSettingsDnsViewPatch())

