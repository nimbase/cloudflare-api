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

suite "zone_entitlements serialization":
  test "round-trips EntitlementsEntitlementsResponse":
    let obj = newEntitlementsEntitlementsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EntitlementsEntitlementsResponse)) == openjson.toJson(obj)

  test "round-trips EntitlementsApiResponseFailure":
    let obj = newEntitlementsApiResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EntitlementsApiResponseFailure)) == openjson.toJson(obj)

suite "zone_entitlements endpoints":
  test "GET /zones/{zone_id}/entitlements":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEntitlements("test")

