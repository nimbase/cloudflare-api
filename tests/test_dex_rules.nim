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

suite "dex_rules serialization":
  test "round-trips DigitalExperienceMonitoringApiResponseSingle":
    let obj = newDigitalExperienceMonitoringApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringListRulesResponse":
    let obj = newDigitalExperienceMonitoringListRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringListRulesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCollection":
    let obj = newDigitalExperienceMonitoringApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringCreateRuleBody":
    let obj = newDigitalExperienceMonitoringCreateRuleBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringCreateRuleBody)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommonFailure":
    let obj = newDigitalExperienceMonitoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringPatchRuleBody":
    let obj = newDigitalExperienceMonitoringPatchRuleBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringPatchRuleBody)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDexRule":
    let obj = newDigitalExperienceMonitoringDexRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDexRule)) == openjson.toJson(obj)

suite "dex_rules endpoints":
  test "GET /accounts/{account_id}/dex/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexRules("test", 1.0, 1.0, {}, {}, "test")

  test "POST /accounts/{account_id}/dex/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDexRules("test", newDigitalExperienceMonitoringCreateRuleBody())

  test "GET /accounts/{account_id}/dex/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/dex/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDexRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/dex/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDexRulesRuleId("test", "test", newDigitalExperienceMonitoringPatchRuleBody())

