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

suite "zone_lockdown serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallZonelockdownResponseCollection":
    let obj = newFirewallZonelockdownResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallZonelockdownResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallZonelockdownResponseSingle":
    let obj = newFirewallZonelockdownResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallZonelockdownResponseSingle)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse)) == openjson.toJson(obj)

suite "zone_lockdown endpoints":
  test "GET /zones/{zone_id}/firewall/lockdowns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallLockdowns("test", 1.0, openjson.newJObject(), openjson.newJObject(), openjson.newJObject(), openjson.newJObject(), openjson.newJObject(), openjson.newJObject(), 1.0, "test", "test", "test")

  test "GET /zones/{zone_id}/firewall/lockdowns/{lock_downs_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallLockdownsLockDownsId("test", "test")

  test "DELETE /zones/{zone_id}/firewall/lockdowns/{lock_downs_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFirewallLockdownsLockDownsId("test", "test")

