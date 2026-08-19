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

suite "user_agent_blocking_rules serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallFirewalluablockResponseSingle":
    let obj = newFirewallFirewalluablockResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFirewalluablockResponseSingle)) == openjson.toJson(obj)

  test "round-trips FirewallFirewalluablockResponseCollection":
    let obj = newFirewallFirewalluablockResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFirewalluablockResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallConfiguration":
    let obj = newFirewallConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallConfiguration)) == openjson.toJson(obj)

  test "round-trips FirewallUaConfiguration":
    let obj = newFirewallUaConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallUaConfiguration)) == openjson.toJson(obj)

suite "user_agent_blocking_rules endpoints":
  test "GET /zones/{zone_id}/firewall/ua_rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallUaRules("test", 1.0, openjson.newJObject(), 1.0, "test", true)

  test "GET /zones/{zone_id}/firewall/ua_rules/{ua_rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallUaRulesUaRuleId("test", "test")

  test "DELETE /zones/{zone_id}/firewall/ua_rules/{ua_rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFirewallUaRulesUaRuleId("test", "test")

