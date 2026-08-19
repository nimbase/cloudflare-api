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

suite "zone_cache_settings serialization":
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsDeleteResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesCacheReserveClearResponseValue":
    let obj = newCacheRulesCacheReserveClearResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesCacheReserveClearResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesVariants":
    let obj = newCacheRulesVariants()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesVariants)) == openjson.toJson(obj)

  test "round-trips CacheRulesApiResponseCommon":
    let obj = newCacheRulesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CacheRulesRegionalTieredCacheResponseValue":
    let obj = newCacheRulesRegionalTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesRegionalTieredCacheResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesCacheReserveResponseValue":
    let obj = newCacheRulesCacheReserveResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesCacheReserveResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesVariantsResponseValue":
    let obj = newCacheRulesVariantsResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesVariantsResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesVariantsValue":
    let obj = newCacheRulesVariantsValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesVariantsValue)) == openjson.toJson(obj)

suite "zone_cache_settings endpoints":
  test "GET /zones/{zone_id}/cache/cache_reserve":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheCacheReserve("test")

  test "GET /zones/{zone_id}/cache/cache_reserve_clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheCacheReserveClear("test")

  test "POST /zones/{zone_id}/cache/cache_reserve_clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCacheCacheReserveClear("test")

  test "GET /zones/{zone_id}/cache/regional_tiered_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheRegionalTieredCache("test")

  test "GET /zones/{zone_id}/cache/variants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheVariants("test")

  test "DELETE /zones/{zone_id}/cache/variants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCacheVariants("test")

