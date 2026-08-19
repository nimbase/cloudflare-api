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

suite "firewall_rules serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallFilter":
    let obj = newFirewallFilter()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilter)) == openjson.toJson(obj)

  test "round-trips FirewallFilterRulesResponseCollection":
    let obj = newFirewallFilterRulesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterRulesResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallAction":
    let obj = newFirewallAction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallAction)) == openjson.toJson(obj)

  test "round-trips FirewallFilterRulesSingleResponseDelete":
    let obj = newFirewallFilterRulesSingleResponseDelete()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterRulesSingleResponseDelete)) == openjson.toJson(obj)

  test "round-trips FirewallFilterRulesSingleResponse":
    let obj = newFirewallFilterRulesSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterRulesSingleResponse)) == openjson.toJson(obj)

  test "round-trips FirewallFilterRulesResponseCollectionDelete":
    let obj = newFirewallFilterRulesResponseCollectionDelete()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterRulesResponseCollectionDelete)) == openjson.toJson(obj)

suite "firewall_rules endpoints":
  test "GET /zones/{zone_id}/firewall/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallRules("test", "test", "test", 1.0, 1.0, "test", true)

  test "PUT /zones/{zone_id}/firewall/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdFirewallRules("test")

  test "PATCH /zones/{zone_id}/firewall/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdFirewallRules("test")

  test "GET /zones/{zone_id}/firewall/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallRulesRuleId("test", "test", openjson.newJObject())

