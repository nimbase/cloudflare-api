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

suite "dlp_sensitivity_groups serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpSensitivityGroup":
    let obj = newDlpSensitivityGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpSensitivityGroup)) == openjson.toJson(obj)

  test "round-trips DlpSensitivityGroupUpdate":
    let obj = newDlpSensitivityGroupUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpSensitivityGroupUpdate)) == openjson.toJson(obj)

  test "round-trips DlpNewSensitivityGroup":
    let obj = newDlpNewSensitivityGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewSensitivityGroup)) == openjson.toJson(obj)

  test "round-trips DlpSensitivityLevelOrder":
    let obj = newDlpSensitivityLevelOrder()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpSensitivityLevelOrder)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_sensitivity_groups endpoints":
  test "GET /accounts/{account_id}/dlp/sensitivity_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSensitivityGroups("test")

  test "POST /accounts/{account_id}/dlp/sensitivity_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpSensitivityGroups("test", newDlpNewSensitivityGroup())

  test "GET /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId("test", "test")

  test "PUT /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId("test", "test", newDlpSensitivityGroupUpdate())

  test "DELETE /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId("test", "test")

  test "GET /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/level_order":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelOrder("test", "test")

  test "PUT /accounts/{account_id}/dlp/sensitivity_groups/{sensitivity_group_id}/level_order":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelOrder("test", "test", newDlpSensitivityLevelOrder())

