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

suite "waf_packages serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallAnomalyPackage":
    let obj = newFirewallAnomalyPackage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallAnomalyPackage)) == openjson.toJson(obj)

  test "round-trips FirewallPackageResponseCollection":
    let obj = newFirewallPackageResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallPackageResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallPackageResponseSingle":
    let obj = newFirewallPackageResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallPackageResponseSingle)) == openjson.toJson(obj)

suite "waf_packages endpoints":
  test "GET /zones/{zone_id}/firewall/waf/packages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackages("test", 1.0, 1.0, {}, {}, {}, "test")

  test "GET /zones/{zone_id}/firewall/waf/packages/{package_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallWafPackagesPackageId("test", "test")

