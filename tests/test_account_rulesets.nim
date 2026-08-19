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

suite "account_rulesets serialization":
  test "round-trips RulesetsResponse":
    let obj = newRulesetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsResponse)) == openjson.toJson(obj)

  test "round-trips RulesetsRuleset":
    let obj = newRulesetsRuleset()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsRuleset)) == openjson.toJson(obj)

  test "round-trips RulesetsRequestRule":
    let obj = newRulesetsRequestRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsRequestRule)) == openjson.toJson(obj)

  test "round-trips RulesetsResultInfo":
    let obj = newRulesetsResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsResultInfo)) == openjson.toJson(obj)

suite "account_rulesets endpoints":
  test "GET /accounts/{account_id}/rulesets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesets("test", "test", 1)

  test "POST /accounts/{account_id}/rulesets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRulesets("test", true)

  test "GET /accounts/{account_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesetsRulesetId("test", "test")

  test "PUT /accounts/{account_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRulesetsRulesetId("test", "test", true)

  test "DELETE /accounts/{account_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRulesetsRulesetId("test", "test", true)

  test "POST /accounts/{account_id}/rulesets/{ruleset_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRulesetsRulesetIdRules("test", "test", true)

  test "DELETE /accounts/{account_id}/rulesets/{ruleset_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRulesetsRulesetIdRulesRuleId("test", "test", "test", true)

  test "PATCH /accounts/{account_id}/rulesets/{ruleset_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRulesetsRulesetIdRulesRuleId("test", "test", "test", true)

  test "GET /accounts/{account_id}/rulesets/{ruleset_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesetsRulesetIdVersions("test", "test")

  test "GET /accounts/{account_id}/rulesets/{ruleset_id}/versions/{ruleset_version}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersion("test", "test", "test")

  test "DELETE /accounts/{account_id}/rulesets/{ruleset_id}/versions/{ruleset_version}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersion("test", "test", "test", true)

  test "GET /accounts/{account_id}/rulesets/{ruleset_id}/versions/{ruleset_version}/by_tag/{rule_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersionByTagRuleTag("test", "test", "test", "test")

