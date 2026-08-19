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

suite "rate_limits_for_a_zone serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallAction":
    let obj = newFirewallAction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallAction)) == openjson.toJson(obj)

  test "round-trips FirewallRatelimitResponseCollection":
    let obj = newFirewallRatelimitResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRatelimitResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallMatch":
    let obj = newFirewallMatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallMatch)) == openjson.toJson(obj)

  test "round-trips FirewallRatelimitResponseSingle":
    let obj = newFirewallRatelimitResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallRatelimitResponseSingle)) == openjson.toJson(obj)

suite "rate_limits_for_a_zone endpoints":
  test "GET /zones/{zone_id}/rate_limits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRateLimits("test", 1.0, 1.0)

  test "GET /zones/{zone_id}/rate_limits/{rate_limit_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdRateLimitsRateLimitId("test", "test")

  test "DELETE /zones/{zone_id}/rate_limits/{rate_limit_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdRateLimitsRateLimitId("test", "test")

