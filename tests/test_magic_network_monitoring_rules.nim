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

suite "magic_network_monitoring_rules serialization":
  test "round-trips MagicVisibilityMnmMnmRulesSingleResponse":
    let obj = newMagicVisibilityMnmMnmRulesSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmRulesSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmMnmRulesCollectionResponse":
    let obj = newMagicVisibilityMnmMnmRulesCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmRulesCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmApiResponseCommonFailure":
    let obj = newMagicVisibilityMnmApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmMnmRuleAdvertisementSingleResponse":
    let obj = newMagicVisibilityMnmMnmRuleAdvertisementSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmRuleAdvertisementSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmMnmRuleCreate":
    let obj = newMagicVisibilityMnmMnmRuleCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmRuleCreate)) == openjson.toJson(obj)

suite "magic_network_monitoring_rules endpoints":
  test "GET /accounts/{account_id}/mnm/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMnmRules("test")

  test "POST /accounts/{account_id}/mnm/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMnmRules("test", newMagicVisibilityMnmMnmRuleCreate())

  test "PUT /accounts/{account_id}/mnm/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMnmRules("test", newMagicVisibilityMnmMnmRuleCreate())

  test "POST /accounts/{account_id}/mnm/rules/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMnmRulesBulk("test")

  test "PUT /accounts/{account_id}/mnm/rules/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMnmRulesBulk("test")

  test "GET /accounts/{account_id}/mnm/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMnmRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/mnm/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMnmRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/mnm/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMnmRulesRuleId("test", "test", newMagicVisibilityMnmMnmRuleCreate())

  test "PATCH /accounts/{account_id}/mnm/rules/{rule_id}/advertisement":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMnmRulesRuleIdAdvertisement("test", "test")

