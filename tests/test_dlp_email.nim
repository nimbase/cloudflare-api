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

suite "dlp_email serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpAddinAccountMapping":
    let obj = newDlpAddinAccountMapping()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpAddinAccountMapping)) == openjson.toJson(obj)

  test "round-trips DlpUpdateEmailRulePriorities":
    let obj = newDlpUpdateEmailRulePriorities()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpUpdateEmailRulePriorities)) == openjson.toJson(obj)

  test "round-trips DlpEmailRule":
    let obj = newDlpEmailRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmailRule)) == openjson.toJson(obj)

  test "round-trips DlpUpdateAddinAccountMapping":
    let obj = newDlpUpdateAddinAccountMapping()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpUpdateAddinAccountMapping)) == openjson.toJson(obj)

  test "round-trips DlpCreateEmailRule":
    let obj = newDlpCreateEmailRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCreateEmailRule)) == openjson.toJson(obj)

suite "dlp_email endpoints":
  test "GET /accounts/{account_id}/dlp/email/account_mapping":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpEmailAccountMapping("test")

  test "POST /accounts/{account_id}/dlp/email/account_mapping":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpEmailAccountMapping("test", newDlpUpdateAddinAccountMapping())

  test "GET /accounts/{account_id}/dlp/email/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpEmailRules("test")

  test "POST /accounts/{account_id}/dlp/email/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpEmailRules("test", newDlpCreateEmailRule())

  test "PATCH /accounts/{account_id}/dlp/email/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDlpEmailRules("test", newDlpUpdateEmailRulePriorities())

  test "GET /accounts/{account_id}/dlp/email/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpEmailRulesRuleId("test", "test")

  test "PUT /accounts/{account_id}/dlp/email/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpEmailRulesRuleId("test", "test", newDlpCreateEmailRule())

  test "DELETE /accounts/{account_id}/dlp/email/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpEmailRulesRuleId("test", "test")

