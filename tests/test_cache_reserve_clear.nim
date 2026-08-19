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

suite "cache_reserve_clear serialization":
  test "round-trips SmartshieldApiResponseCommon":
    let obj = newSmartshieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SmartshieldCacheReserveClearResponseValue":
    let obj = newSmartshieldCacheReserveClearResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldCacheReserveClearResponseValue)) == openjson.toJson(obj)

  test "round-trips SmartshieldApiResponseCommonFailure":
    let obj = newSmartshieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldApiResponseCommonFailure)) == openjson.toJson(obj)

suite "cache_reserve_clear endpoints":
  test "GET /zones/{zone_id}/smart_shield/cache_reserve_clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSmartShieldCacheReserveClear("test")

  test "POST /zones/{zone_id}/smart_shield/cache_reserve_clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSmartShieldCacheReserveClear("test")

