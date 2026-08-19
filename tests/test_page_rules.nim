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

suite "page_rules serialization":
  test "round-trips ZonesApiResponseCommonFailure2":
    let obj = newZonesApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommon2":
    let obj = newZonesApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseSingleId2":
    let obj = newZonesApiResponseSingleId2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseSingleId2)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseSingle":
    let obj = newZonesApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ZonesPageRule":
    let obj = newZonesPageRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesPageRule)) == openjson.toJson(obj)

suite "page_rules endpoints":
  test "GET /zones/{zone_id}/pagerules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPagerules("test", {}, {}, {}, {})

  test "GET /zones/{zone_id}/pagerules/{pagerule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPagerulesPageruleId("test", "test")

  test "DELETE /zones/{zone_id}/pagerules/{pagerule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdPagerulesPageruleId("test", "test")

