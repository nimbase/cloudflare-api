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

suite "dlp_settings serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpRegexValidationResult":
    let obj = newDlpRegexValidationResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpRegexValidationResult)) == openjson.toJson(obj)

  test "round-trips DlpDlpSettingsUpdate":
    let obj = newDlpDlpSettingsUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDlpSettingsUpdate)) == openjson.toJson(obj)

  test "round-trips DlpPayloadLogSettingUpdateLegacy":
    let obj = newDlpPayloadLogSettingUpdateLegacy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPayloadLogSettingUpdateLegacy)) == openjson.toJson(obj)

  test "round-trips DlpLimits":
    let obj = newDlpLimits()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpLimits)) == openjson.toJson(obj)

  test "round-trips DlpRegexValidationQuery":
    let obj = newDlpRegexValidationQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpRegexValidationQuery)) == openjson.toJson(obj)

  test "round-trips DlpDlpSettings":
    let obj = newDlpDlpSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDlpSettings)) == openjson.toJson(obj)

  test "round-trips DlpPayloadLogSetting":
    let obj = newDlpPayloadLogSetting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPayloadLogSetting)) == openjson.toJson(obj)

suite "dlp_settings endpoints":
  test "GET /accounts/{account_id}/dlp/limits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpLimits("test")

  test "POST /accounts/{account_id}/dlp/patterns/validate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpPatternsValidate("test", newDlpRegexValidationQuery())

  test "GET /accounts/{account_id}/dlp/payload_log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpPayloadLog("test")

  test "PUT /accounts/{account_id}/dlp/payload_log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpPayloadLog("test", newDlpPayloadLogSettingUpdateLegacy())

  test "GET /accounts/{account_id}/dlp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSettings("test")

  test "PUT /accounts/{account_id}/dlp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpSettings("test", newDlpDlpSettingsUpdate())

  test "DELETE /accounts/{account_id}/dlp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpSettings("test")

  test "PATCH /accounts/{account_id}/dlp/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDlpSettings("test", newDlpDlpSettingsUpdate())

