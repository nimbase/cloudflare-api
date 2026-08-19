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
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesTieredCacheResponseValue":
    let obj = newCacheRulesTieredCacheResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesTieredCacheResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesPatch":
    let obj = newCacheRulesPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesPatch)) == openjson.toJson(obj)

suite "tiered_caching endpoints":
  test "GET /zones/{zone_id}/argo/tiered_caching":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdArgoTieredCaching("test")

  test "PATCH /zones/{zone_id}/argo/tiered_caching":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdArgoTieredCaching("test", newCacheRulesPatch())

