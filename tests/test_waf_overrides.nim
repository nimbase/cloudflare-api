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

suite "waf_overrides serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallRewriteAction":
    let obj = newFirewallRewriteAction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRewriteAction)) == openjson.toJson(obj)

  test "round-trips FirewallOverrideResponseSingle":
    let obj = newFirewallOverrideResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallOverrideResponseSingle)) == openjson.toJson(obj)

  test "round-trips FirewallOverrideResponseCollection":
    let obj = newFirewallOverrideResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallOverrideResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallRules":
    let obj = newFirewallRules()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRules)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse)) == openjson.toJson(obj)

suite "waf_overrides endpoints":
  test "GET /zones/{zone_id}/firewall/waf/overrides":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafOverrides("test", 1.0, 1.0)

  test "GET /zones/{zone_id}/firewall/waf/overrides/{overrides_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafOverridesOverridesId("test", "test")

  test "DELETE /zones/{zone_id}/firewall/waf/overrides/{overrides_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFirewallWafOverridesOverridesId("test", "test")

