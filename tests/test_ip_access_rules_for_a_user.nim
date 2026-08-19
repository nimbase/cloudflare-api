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

suite "ip_access_rules_for_a_user serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallRuleSingleResponse":
    let obj = newFirewallRuleSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRuleSingleResponse)) == openjson.toJson(obj)

  test "round-trips FirewallConfiguration":
    let obj = newFirewallConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallConfiguration)) == openjson.toJson(obj)

  test "round-trips FirewallRuleCollectionResponse":
    let obj = newFirewallRuleCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRuleCollectionResponse)) == openjson.toJson(obj)

  test "round-trips FirewallRuleSingleIdResponse":
    let obj = newFirewallRuleSingleIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRuleSingleIdResponse)) == openjson.toJson(obj)

suite "ip_access_rules_for_a_user endpoints":
  test "GET /user/firewall/access_rules/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserFirewallAccessRulesRulesRuleId("test")

  test "DELETE /user/firewall/access_rules/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserFirewallAccessRulesRulesRuleId("test")

