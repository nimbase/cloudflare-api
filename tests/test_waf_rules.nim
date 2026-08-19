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

suite "waf_rules serialization":
  test "round-trips WafManagedRulesRuleResponseCollection":
    let obj = newWafManagedRulesRuleResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesRuleResponseCollection)) == openjson.toJson(obj)

  test "round-trips WafManagedRulesRuleResponseSingle":
    let obj = newWafManagedRulesRuleResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesRuleResponseSingle)) == openjson.toJson(obj)

  test "round-trips WafManagedRulesApiResponseCommonFailure":
    let obj = newWafManagedRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafManagedRulesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "waf_rules endpoints":
  test "GET /zones/{zone_id}/firewall/waf/packages/{package_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackagesPackageIdRules("test", "test", {}, openjson.newJObject(), 1.0, 1.0, {}, {}, {}, "test", "test")

  test "GET /zones/{zone_id}/firewall/waf/packages/{package_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackagesPackageIdRulesRuleId("test", "test", "test")

