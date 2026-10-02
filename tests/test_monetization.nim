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

suite "monetization serialization":
  test "round-trips MonetizationMonetizationRulePatch":
    let obj = newMonetizationMonetizationRulePatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationRulePatch)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationAccountEligibilityCheckInput":
    let obj = newMonetizationMonetizationAccountEligibilityCheckInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationAccountEligibilityCheckInput)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationZoneEligibilityCheckResponse":
    let obj = newMonetizationMonetizationZoneEligibilityCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationZoneEligibilityCheckResponse)) == openjson.toJson(obj)

  test "round-trips MonetizationApiResponseCommonFailure":
    let obj = newMonetizationApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationEligibilityResponse":
    let obj = newMonetizationMonetizationEligibilityResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationEligibilityResponse)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationRuleResponse":
    let obj = newMonetizationMonetizationRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationRuleResponse)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationAccountEligibilityCheckResponse":
    let obj = newMonetizationMonetizationAccountEligibilityCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationAccountEligibilityCheckResponse)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationRuleCollectionResponse":
    let obj = newMonetizationMonetizationRuleCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationRuleCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MonetizationMonetizationRulesetInput":
    let obj = newMonetizationMonetizationRulesetInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MonetizationMonetizationRulesetInput)) == openjson.toJson(obj)

suite "monetization endpoints":
  test "GET /accounts/{account_id}/monetization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMonetization("test")

  test "POST /accounts/{account_id}/monetization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMonetization("test", newMonetizationMonetizationAccountEligibilityCheckInput())

  test "GET /zones/{zone_id}/monetization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdMonetization("test")

  test "POST /zones/{zone_id}/monetization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdMonetization("test")

  test "GET /zones/{zone_id}/monetization/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdMonetizationRules("test")

  test "PUT /zones/{zone_id}/monetization/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdMonetizationRules("test", newMonetizationMonetizationRulesetInput())

  test "DELETE /zones/{zone_id}/monetization/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdMonetizationRules("test")

  test "GET /zones/{zone_id}/monetization/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdMonetizationRulesRuleId("test", "test")

  test "DELETE /zones/{zone_id}/monetization/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdMonetizationRulesRuleId("test", "test")

  test "PATCH /zones/{zone_id}/monetization/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdMonetizationRulesRuleId("test", "test", newMonetizationMonetizationRulePatch())

