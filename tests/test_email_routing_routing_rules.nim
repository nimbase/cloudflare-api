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

suite "email_routing_routing_rules serialization":
  test "round-trips EmailUpdateCatchAllRuleProperties":
    let obj = newEmailUpdateCatchAllRuleProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailUpdateCatchAllRuleProperties)) == openjson.toJson(obj)

  test "round-trips EmailAccountRulesResponseCollection":
    let obj = newEmailAccountRulesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAccountRulesResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailCreateRuleProperties":
    let obj = newEmailCreateRuleProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailCreateRuleProperties)) == openjson.toJson(obj)

  test "round-trips EmailCatchAllRuleResponseSingle":
    let obj = newEmailCatchAllRuleResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailCatchAllRuleResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailUpdateRuleProperties":
    let obj = newEmailUpdateRuleProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailUpdateRuleProperties)) == openjson.toJson(obj)

  test "round-trips EmailAccountRulesPlanRequest":
    let obj = newEmailAccountRulesPlanRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAccountRulesPlanRequest)) == openjson.toJson(obj)

  test "round-trips EmailAccountRulesPlanResponseSingle":
    let obj = newEmailAccountRulesPlanResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAccountRulesPlanResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailRulesResponseCollection":
    let obj = newEmailRulesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailRulesResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailRuleResponseSingle":
    let obj = newEmailRuleResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailRuleResponseSingle)) == openjson.toJson(obj)

suite "email_routing_routing_rules endpoints":
  test "GET /accounts/{account_id}/email/routing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailRoutingRules("test", 1.0, 1.0, {})

  test "POST /accounts/{account_id}/email/routing/rules/plan":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailRoutingRulesPlan("test", newEmailAccountRulesPlanRequest())

  test "GET /zones/{zone_id}/email/routing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingRules("test", 1.0, 1.0, {})

  test "POST /zones/{zone_id}/email/routing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailRoutingRules("test", newEmailCreateRuleProperties())

  test "GET /zones/{zone_id}/email/routing/rules/catch_all":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingRulesCatchAll("test")

  test "PUT /zones/{zone_id}/email/routing/rules/catch_all":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdEmailRoutingRulesCatchAll("test", newEmailUpdateCatchAllRuleProperties())

  test "GET /zones/{zone_id}/email/routing/rules/{rule_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingRulesRuleIdentifier("test", "test")

  test "PUT /zones/{zone_id}/email/routing/rules/{rule_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdEmailRoutingRulesRuleIdentifier("test", "test", newEmailUpdateRuleProperties())

  test "DELETE /zones/{zone_id}/email/routing/rules/{rule_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEmailRoutingRulesRuleIdentifier("test", "test")

