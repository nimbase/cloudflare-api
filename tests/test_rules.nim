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

suite "rules serialization":
  test "round-trips CloudforceOneApprovalPendingResponse":
    let obj = newCloudforceOneApprovalPendingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneApprovalPendingResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneEditApprovalResponse":
    let obj = newCloudforceOneEditApprovalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEditApprovalResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneAccountExemptions":
    let obj = newCloudforceOneAccountExemptions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneAccountExemptions)) == openjson.toJson(obj)

  test "round-trips CloudforceOneEmailRuleConditionGroup":
    let obj = newCloudforceOneEmailRuleConditionGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEmailRuleConditionGroup)) == openjson.toJson(obj)

  test "round-trips CloudforceOneErrorResponse":
    let obj = newCloudforceOneErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneErrorResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneMetaInputEntry":
    let obj = newCloudforceOneMetaInputEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneMetaInputEntry)) == openjson.toJson(obj)

  test "round-trips CloudforceOneTreeResponse":
    let obj = newCloudforceOneTreeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneTreeResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRule":
    let obj = newCloudforceOneRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRule)) == openjson.toJson(obj)

  test "round-trips CloudforceOneApprovalConflictResponse":
    let obj = newCloudforceOneApprovalConflictResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneApprovalConflictResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneValidationResponse":
    let obj = newCloudforceOneValidationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneValidationResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRulesPreviewListResponse":
    let obj = newCloudforceOneRulesPreviewListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRulesPreviewListResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneDeleteAllResponse":
    let obj = newCloudforceOneDeleteAllResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneDeleteAllResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneSuccessResponse":
    let obj = newCloudforceOneSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneSuccessResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneCreateRule":
    let obj = newCloudforceOneCreateRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneCreateRule)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRulePreview":
    let obj = newCloudforceOneRulePreview()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRulePreview)) == openjson.toJson(obj)

  test "round-trips CloudforceOneEmailRulesListResponse":
    let obj = newCloudforceOneEmailRulesListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEmailRulesListResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneUpdateAccountExemptionsBody":
    let obj = newCloudforceOneUpdateAccountExemptionsBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneUpdateAccountExemptionsBody)) == openjson.toJson(obj)

  test "round-trips CloudforceOneUpdateRule":
    let obj = newCloudforceOneUpdateRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneUpdateRule)) == openjson.toJson(obj)

  test "round-trips CloudforceOneResubmitApprovalResponse":
    let obj = newCloudforceOneResubmitApprovalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneResubmitApprovalResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneEmailRuleValidationResponse":
    let obj = newCloudforceOneEmailRuleValidationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEmailRuleValidationResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneDeleteRuleBody":
    let obj = newCloudforceOneDeleteRuleBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneDeleteRuleBody)) == openjson.toJson(obj)

  test "round-trips CloudforceOneStatsResponse":
    let obj = newCloudforceOneStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneStatsResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRulesSearchResponse":
    let obj = newCloudforceOneRulesSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRulesSearchResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOnePartialAccountExemptions":
    let obj = newCloudforceOnePartialAccountExemptions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOnePartialAccountExemptions)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneRulesManagedResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneRulesManagedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneRulesManagedResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneRulesStructuredSchemaResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneRulesStructuredSchemaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneRulesStructuredSchemaResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse)) == openjson.toJson(obj)

suite "rules endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRules("test", openjson.newJObject(), openjson.newJObject(), {}, "test", {}, 1.0, 1.0)

  test "POST /accounts/{account_id}/cloudforce-one/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRules("test", newCloudforceOneCreateRule())

  test "DELETE /accounts/{account_id}/cloudforce-one/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRules("test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/exemptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesExemptions("test")

  test "POST /accounts/{account_id}/cloudforce-one/rules/exemptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRulesExemptions("test", newCloudforceOnePartialAccountExemptions())

  test "PUT /accounts/{account_id}/cloudforce-one/rules/exemptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCloudforceOneRulesExemptions("test", newCloudforceOneUpdateAccountExemptionsBody())

  test "DELETE /accounts/{account_id}/cloudforce-one/rules/exemptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRulesExemptions("test", newCloudforceOnePartialAccountExemptions())

  test "GET /accounts/{account_id}/cloudforce-one/rules/managed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesManaged("test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesSearch("test", openjson.newJObject(), openjson.newJObject(), {}, "test", {}, 1.0, 1.0, "test", {}, {})

  test "GET /accounts/{account_id}/cloudforce-one/rules/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesStats("test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/structured":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesStructured("test", 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/structured/schema":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesStructuredSchema("test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/structured/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesStructuredId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/rules/structured/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRulesStructuredId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/tree":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesTree("test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesId("test", "test")

  test "PUT /accounts/{account_id}/cloudforce-one/rules/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCloudforceOneRulesId("test", "test", newCloudforceOneUpdateRule())

  test "DELETE /accounts/{account_id}/cloudforce-one/rules/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneRulesId("test", "test", newCloudforceOneDeleteRuleBody())

