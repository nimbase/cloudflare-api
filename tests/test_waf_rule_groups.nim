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

suite "waf_rule_groups serialization":
  test "round-trips WafManagedRulesRuleGroupResponseCollection":
    let obj = newWafManagedRulesRuleGroupResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesRuleGroupResponseCollection)) == openjson.toJson(obj)

  test "round-trips WafManagedRulesRuleGroupResponseSingle":
    let obj = newWafManagedRulesRuleGroupResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesRuleGroupResponseSingle)) == openjson.toJson(obj)

  test "round-trips WafManagedRulesApiResponseCommonFailure":
    let obj = newWafManagedRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "waf_rule_groups endpoints":
  test "GET /zones/{zone_id}/firewall/waf/packages/{package_id}/groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackagesPackageIdGroups("test", "test", openjson.newJObject(), 1.0, 1.0, {}, {}, {}, "test", 1.0)

  test "GET /zones/{zone_id}/firewall/waf/packages/{package_id}/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackagesPackageIdGroupsGroupId("test", "test", "test")

