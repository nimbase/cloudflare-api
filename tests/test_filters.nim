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

suite "filters serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallFilter":
    let obj = newFirewallFilter()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilter)) == openjson.toJson(obj)

  test "round-trips FirewallFilterRuleUpdateRequest":
    let obj = newFirewallFilterRuleUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterRuleUpdateRequest)) == openjson.toJson(obj)

  test "round-trips FirewallFilterDeleteResponseSingle":
    let obj = newFirewallFilterDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips FirewallFilterDeleteResponseCollection":
    let obj = newFirewallFilterDeleteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterDeleteResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallFilterResponseCollection":
    let obj = newFirewallFilterResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterResponseCollection)) == openjson.toJson(obj)

  test "round-trips FirewallFilterResponseSingle":
    let obj = newFirewallFilterResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallFilterResponseSingle)) == openjson.toJson(obj)

suite "filters endpoints":
  test "GET /zones/{zone_id}/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFilters("test", openjson.newJObject(), "test", "test", "test", 1.0, 1.0, "test")

  test "POST /zones/{zone_id}/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdFilters("test")

  test "PUT /zones/{zone_id}/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdFilters("test")

  test "DELETE /zones/{zone_id}/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFilters("test", @["test"])

  test "GET /zones/{zone_id}/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFiltersFilterId("test", "test")

  test "PUT /zones/{zone_id}/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdFiltersFilterId("test", "test", newFirewallFilter())

  test "DELETE /zones/{zone_id}/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFiltersFilterId("test", "test")

