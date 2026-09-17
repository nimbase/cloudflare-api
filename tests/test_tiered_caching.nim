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

suite "tiered_caching serialization":
  test "round-trips CacheSettingsTieredCacheResponseValue":
    let obj = newCacheSettingsTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsTieredCacheResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsPatch":
    let obj = newCacheSettingsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsPatch)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

suite "tiered_caching endpoints":
  test "GET /zones/{zone_id}/argo/tiered_caching":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdArgoTieredCaching("test")

  test "PATCH /zones/{zone_id}/argo/tiered_caching":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdArgoTieredCaching("test", newCacheSettingsPatch())

