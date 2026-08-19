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

suite "token_validation_token_rules serialization":
  test "round-trips ApiShieldTimestamp2":
    let obj = newApiShieldTimestamp2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldTimestamp2)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldCreateSingleRuleRequest":
    let obj = newApiShieldCreateSingleRuleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldCreateSingleRuleRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldRule":
    let obj = newApiShieldRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldRule)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseSingle":
    let obj = newApiShieldApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ApiShieldUuid2":
    let obj = newApiShieldUuid2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldUuid2)) == openjson.toJson(obj)

  test "round-trips ApiShieldSelector":
    let obj = newApiShieldSelector()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSelector)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseSingleObj":
    let obj = newApiShieldApiResponseSingleObj()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseSingleObj)) == openjson.toJson(obj)

  test "round-trips ApiShieldEditSingleRuleRequest":
    let obj = newApiShieldEditSingleRuleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldEditSingleRuleRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

suite "token_validation_token_rules endpoints":
  test "POST /zones/{zone_id}/token_validation/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdTokenValidationRules(newApiShieldCreateSingleRuleRequest())

  test "POST /zones/{zone_id}/token_validation/rules/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdTokenValidationRulesBulk()

  test "PATCH /zones/{zone_id}/token_validation/rules/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdTokenValidationRulesBulk()

  test "POST /zones/{zone_id}/token_validation/rules/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdTokenValidationRulesPreview(1, 1, @["test"], @["test"], @["test"], @["test"], @["test"], newApiShieldSelector())

  test "GET /zones/{zone_id}/token_validation/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdTokenValidationRulesRuleId()

  test "DELETE /zones/{zone_id}/token_validation/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdTokenValidationRulesRuleId()

  test "PATCH /zones/{zone_id}/token_validation/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdTokenValidationRulesRuleId(newApiShieldEditSingleRuleRequest())

