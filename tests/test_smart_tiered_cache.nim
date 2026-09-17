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

suite "smart_tiered_cache serialization":
  test "round-trips CacheSettingsZoneCacheSettingsDeleteResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSettingsSmartTieredCache":
    let obj = newCacheSettingsSmartTieredCache()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsSmartTieredCache)) == openjson.toJson(obj)

  test "round-trips CacheSettingsSmartTieredCachePatch":
    let obj = newCacheSettingsSmartTieredCachePatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsSmartTieredCachePatch)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheSettingsSmartTieredCacheResponseValue":
    let obj = newCacheSettingsSmartTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsSmartTieredCacheResponseValue)) == openjson.toJson(obj)

suite "smart_tiered_cache endpoints":
  test "GET /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheTieredCacheSmartTopologyEnable("test")

  test "POST /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCacheTieredCacheSmartTopologyEnable("test", newCacheSettingsSmartTieredCachePatch())

  test "DELETE /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCacheTieredCacheSmartTopologyEnable("test")

  test "PATCH /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCacheTieredCacheSmartTopologyEnable("test", newCacheSettingsSmartTieredCachePatch())

