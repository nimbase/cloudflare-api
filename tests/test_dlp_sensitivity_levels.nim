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

suite "dlp_sensitivity_levels serialization":
  test "round-trips DlpSensitivityLevelUpdate":
    let obj = newDlpSensitivityLevelUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpSensitivityLevelUpdate)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpNewSensitivityLevel":
    let obj = newDlpNewSensitivityLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewSensitivityLevel)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

  test "round-trips DlpSensitivityLevel":
    let obj = newDlpSensitivityLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpSensitivityLevel)) == openjson.toJson(obj)

suite "dlp_sensitivity_levels endpoints":
  test "GET /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/levels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevels("test", "test")

  test "POST /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/levels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevels("test", "test", newDlpNewSensitivityLevel())

  test "GET /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/levels/{sensitivity_level_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId("test", "test", "test")

  test "PUT /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/levels/{sensitivity_level_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId("test", "test", "test", newDlpSensitivityLevelUpdate())

  test "DELETE /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/levels/{sensitivity_level_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId("test", "test", "test")

