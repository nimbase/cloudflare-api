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

suite "web_analytics serialization":
  test "round-trips RumCreateSiteRequest":
    let obj = newRumCreateSiteRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumCreateSiteRequest)) == openjson.toJson(obj)

  test "round-trips RumSiteResponseSingle":
    let obj = newRumSiteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumSiteResponseSingle)) == openjson.toJson(obj)

  test "round-trips RumToggleRumRequest":
    let obj = newRumToggleRumRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumToggleRumRequest)) == openjson.toJson(obj)

  test "round-trips RumUpdateSiteRequest":
    let obj = newRumUpdateSiteRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumUpdateSiteRequest)) == openjson.toJson(obj)

  test "round-trips RumRuleResponseSingle":
    let obj = newRumRuleResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumRuleResponseSingle)) == openjson.toJson(obj)

  test "round-trips RumCreateRuleRequest":
    let obj = newRumCreateRuleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumCreateRuleRequest)) == openjson.toJson(obj)

  test "round-trips RumRulesResponseCollection":
    let obj = newRumRulesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumRulesResponseCollection)) == openjson.toJson(obj)

  test "round-trips RumSitesResponseCollection":
    let obj = newRumSitesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumSitesResponseCollection)) == openjson.toJson(obj)

  test "round-trips RumRuleIdResponseSingle":
    let obj = newRumRuleIdResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumRuleIdResponseSingle)) == openjson.toJson(obj)

  test "round-trips RumApiResponseCommonFailure":
    let obj = newRumApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RumRumSiteResponseSingle":
    let obj = newRumRumSiteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumRumSiteResponseSingle)) == openjson.toJson(obj)

  test "round-trips RumSiteTagListResponse":
    let obj = newRumSiteTagListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumSiteTagListResponse)) == openjson.toJson(obj)

  test "round-trips RumEmptyResponse":
    let obj = newRumEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumEmptyResponse)) == openjson.toJson(obj)

  test "round-trips RumZoneTagListResponse":
    let obj = newRumZoneTagListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumZoneTagListResponse)) == openjson.toJson(obj)

  test "round-trips RumSiteTagResponseSingle":
    let obj = newRumSiteTagResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumSiteTagResponseSingle)) == openjson.toJson(obj)

  test "round-trips RumModifyRulesRequest":
    let obj = newRumModifyRulesRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RumModifyRulesRequest)) == openjson.toJson(obj)

suite "web_analytics endpoints":
  test "POST /accounts/{account_id}/rum/site_info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRumSiteInfo("test", newRumCreateSiteRequest())

  test "GET /accounts/{account_id}/rum/site_info/site_tag/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRumSiteInfoSiteTagList("test", true)

  test "GET /accounts/{account_id}/rum/site_info/validate/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRumSiteInfoValidateHostname("test", "test")

  test "GET /accounts/{account_id}/rum/site_info/zone_tag/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRumSiteInfoZoneTagList("test")

  test "GET /accounts/{account_id}/rum/site_info/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRumSiteInfoSiteId("test", "test")

  test "PUT /accounts/{account_id}/rum/site_info/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRumSiteInfoSiteId("test", "test", newRumUpdateSiteRequest())

  test "DELETE /accounts/{account_id}/rum/site_info/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRumSiteInfoSiteId("test", "test")

  test "POST /accounts/{account_id}/rum/v2/{ruleset_id}/rule":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRumV2RulesetIdRule("test", "test", newRumCreateRuleRequest())

  test "PUT /accounts/{account_id}/rum/v2/{ruleset_id}/rule/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRumV2RulesetIdRuleRuleId("test", "test", "test", newRumCreateRuleRequest())

  test "DELETE /accounts/{account_id}/rum/v2/{ruleset_id}/rule/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRumV2RulesetIdRuleRuleId("test", "test", "test")

  test "GET /accounts/{account_id}/rum/v2/{ruleset_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRumV2RulesetIdRules("test", "test")

  test "POST /accounts/{account_id}/rum/v2/{ruleset_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRumV2RulesetIdRules("test", "test", newRumModifyRulesRequest())

  test "GET /zones/{zone_id}/settings/rum":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsRum("test")

  test "PATCH /zones/{zone_id}/settings/rum":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsRum("test", newRumToggleRumRequest())

