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

suite "origin_cloud_regions serialization":
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesApiResponseCommon":
    let obj = newCacheRulesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionBatchResult":
    let obj = newCacheRulesOriginCloudRegionBatchResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionBatchResult)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionV2ResultInfo":
    let obj = newCacheRulesOriginCloudRegionV2ResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionV2ResultInfo)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionSingleResult":
    let obj = newCacheRulesOriginCloudRegionSingleResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionSingleResult)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionRequest":
    let obj = newCacheRulesOriginCloudRegionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionRequest)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionV2BatchResult":
    let obj = newCacheRulesOriginCloudRegionV2BatchResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionV2BatchResult)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionV2Entry":
    let obj = newCacheRulesOriginCloudRegionV2Entry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionV2Entry)) == openjson.toJson(obj)

  test "round-trips CacheRulesSupportedCloudRegionsResult":
    let obj = newCacheRulesSupportedCloudRegionsResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesSupportedCloudRegionsResult)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionsListResult":
    let obj = newCacheRulesOriginCloudRegionsListResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionsListResult)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionV2Request":
    let obj = newCacheRulesOriginCloudRegionV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionV2Request)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginCloudRegionV2DeleteResult":
    let obj = newCacheRulesOriginCloudRegionV2DeleteResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginCloudRegionV2DeleteResult)) == openjson.toJson(obj)

suite "origin_cloud_regions endpoints":
  test "GET /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginCloudRegions("test")

  test "POST /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCacheOriginCloudRegions("test", newCacheRulesOriginCloudRegionRequest())

  test "PATCH /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCacheOriginCloudRegions("test", newCacheRulesOriginCloudRegionRequest())

  test "DELETE /zones/{zone_id}/cache/origin_cloud_regions/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCacheOriginCloudRegionsBatch("test")

  test "PATCH /zones/{zone_id}/cache/origin_cloud_regions/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCacheOriginCloudRegionsBatch("test")

  test "GET /zones/{zone_id}/cache/origin_cloud_regions/supported_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginCloudRegionsSupportedRegions("test")

  test "GET /zones/{zone_id}/cache/origin_cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginCloudRegionsOriginIp("test", "test")

  test "DELETE /zones/{zone_id}/cache/origin_cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCacheOriginCloudRegionsOriginIp("test", "test")

  test "GET /zones/{zone_id}/origin/cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginCloudRegions("test", 1, 1)

  test "PUT /zones/{zone_id}/origin/cloud_regions/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdOriginCloudRegionsBatch("test")

  test "DELETE /zones/{zone_id}/origin/cloud_regions/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdOriginCloudRegionsBatch("test")

  test "GET /zones/{zone_id}/origin/cloud_regions/supported_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginCloudRegionsSupportedRegions("test")

  test "GET /zones/{zone_id}/origin/cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginCloudRegionsOriginIp("test", "test")

  test "PUT /zones/{zone_id}/origin/cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdOriginCloudRegionsOriginIp("test", "test", newCacheRulesOriginCloudRegionV2Request())

  test "DELETE /zones/{zone_id}/origin/cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdOriginCloudRegionsOriginIp("test", "test")

