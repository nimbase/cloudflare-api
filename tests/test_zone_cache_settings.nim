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
  test "round-trips CacheSettingsCacheReserveResponseValue":
    let obj = newCacheSettingsCacheReserveResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsCacheReserveResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsDeleteResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommon":
    let obj = newCacheSettingsApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CacheSettingsRegionalTieredCacheResponseValue":
    let obj = newCacheSettingsRegionalTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsRegionalTieredCacheResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSettingsVariants":
    let obj = newCacheSettingsVariants()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsVariants)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheSettingsCacheReserveClearResponseValue":
    let obj = newCacheSettingsCacheReserveClearResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsCacheReserveClearResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsVariantsValue":
    let obj = newCacheSettingsVariantsValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsVariantsValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsVariantsResponseValue":
    let obj = newCacheSettingsVariantsResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsVariantsResponseValue)) == openjson.toJson(obj)

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

