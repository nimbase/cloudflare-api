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

suite "available_page_rules_settings serialization":
  test "round-trips ZonesApiResponseCommonFailure2":
    let obj = newZonesApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommon2":
    let obj = newZonesApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommon2)) == openjson.toJson(obj)

suite "available_page_rules_settings endpoints":
  test "GET /zones/{zone_id}/pagerules/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPagerulesSettings("test")

