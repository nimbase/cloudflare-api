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

suite "ip_access_rules_for_an_account serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallConfiguration":
    let obj = newFirewallConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallConfiguration)) == openjson.toJson(obj)

  test "round-trips FirewallApiResponseSingleId":
    let obj = newFirewallApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips FirewallSchemasRule":
    let obj = newFirewallSchemasRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallSchemasRule)) == openjson.toJson(obj)

  test "round-trips FirewallResponseCollection":
    let obj = newFirewallResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallResponseSingle":
    let obj = newFirewallResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallResponseSingle)) == openjson.toJson(obj)

suite "ip_access_rules_for_an_account endpoints":
  test "GET /accounts/{account_id}/firewall/access_rules/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFirewallAccessRulesRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/firewall/access_rules/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdFirewallAccessRulesRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/firewall/access_rules/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdFirewallAccessRulesRulesRuleId("test", "test", newFirewallSchemasRule())

