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
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsDeleteResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesSmartTieredCachePatch":
    let obj = newCacheRulesSmartTieredCachePatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesSmartTieredCachePatch)) == openjson.toJson(obj)

  test "round-trips CacheRulesSmartTieredCacheResponseValue":
    let obj = newCacheRulesSmartTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesSmartTieredCacheResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesSmartTieredCache":
    let obj = newCacheRulesSmartTieredCache()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesSmartTieredCache)) == openjson.toJson(obj)

suite "smart_tiered_cache endpoints":
  test "GET /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheTieredCacheSmartTopologyEnable("test")

  test "POST /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCacheTieredCacheSmartTopologyEnable("test", newCacheRulesSmartTieredCachePatch())

  test "DELETE /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCacheTieredCacheSmartTopologyEnable("test")

  test "PATCH /zones/{zone_id}/cache/tiered_cache_smart_topology_enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCacheTieredCacheSmartTopologyEnable("test", newCacheRulesSmartTieredCachePatch())

