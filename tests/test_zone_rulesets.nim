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

suite "zone_rulesets serialization":
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

suite "zone_rulesets endpoints":
  test "GET /zones/{zone_id}/rulesets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRulesets("test", "test", 1)

  test "POST /zones/{zone_id}/rulesets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdRulesets("test", true)

  test "GET /zones/{zone_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRulesetsRulesetId("test", "test")

  test "PUT /zones/{zone_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdRulesetsRulesetId("test", "test", true)

  test "DELETE /zones/{zone_id}/rulesets/{ruleset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdRulesetsRulesetId("test", "test", true)

  test "POST /zones/{zone_id}/rulesets/{ruleset_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdRulesetsRulesetIdRules("test", "test", true)

  test "DELETE /zones/{zone_id}/rulesets/{ruleset_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdRulesetsRulesetIdRulesRuleId("test", "test", "test", true)

  test "PATCH /zones/{zone_id}/rulesets/{ruleset_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdRulesetsRulesetIdRulesRuleId("test", "test", "test", true)

  test "GET /zones/{zone_id}/rulesets/{ruleset_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRulesetsRulesetIdVersions("test", "test")

  test "GET /zones/{zone_id}/rulesets/{ruleset_id}/versions/{ruleset_version}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRulesetsRulesetIdVersionsRulesetVersion("test", "test", "test")

  test "DELETE /zones/{zone_id}/rulesets/{ruleset_id}/versions/{ruleset_version}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdRulesetsRulesetIdVersionsRulesetVersion("test", "test", "test", true)

  test "GET /zones/{zone_id}/rulesets/{ruleset_id}/versions/{ruleset_version}/by_tag/{rule_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRulesetsRulesetIdVersionsRulesetVersionByTagRuleTag("test", "test", "test", "test")

