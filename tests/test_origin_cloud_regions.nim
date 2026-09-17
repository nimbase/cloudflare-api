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
  test "round-trips CacheSettingsOriginCloudRegionV2ResultInfo":
    let obj = newCacheSettingsOriginCloudRegionV2ResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionV2ResultInfo)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionsListResult":
    let obj = newCacheSettingsOriginCloudRegionsListResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionsListResult)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommon":
    let obj = newCacheSettingsApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CacheSettingsSupportedCloudRegionsResult":
    let obj = newCacheSettingsSupportedCloudRegionsResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsSupportedCloudRegionsResult)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionV2Entry":
    let obj = newCacheSettingsOriginCloudRegionV2Entry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionV2Entry)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionV2Request":
    let obj = newCacheSettingsOriginCloudRegionV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionV2Request)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionV2BatchResult":
    let obj = newCacheSettingsOriginCloudRegionV2BatchResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionV2BatchResult)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionV2DeleteResult":
    let obj = newCacheSettingsOriginCloudRegionV2DeleteResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionV2DeleteResult)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionSingleResult":
    let obj = newCacheSettingsOriginCloudRegionSingleResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionSingleResult)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionRequest":
    let obj = newCacheSettingsOriginCloudRegionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionRequest)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginCloudRegionBatchResult":
    let obj = newCacheSettingsOriginCloudRegionBatchResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginCloudRegionBatchResult)) == openjson.toJson(obj)

suite "origin_cloud_regions endpoints":
  test "GET /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginCloudRegions("test")

  test "POST /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCacheOriginCloudRegions("test", newCacheSettingsOriginCloudRegionRequest())

  test "PATCH /zones/{zone_id}/cache/origin_cloud_regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCacheOriginCloudRegions("test", newCacheSettingsOriginCloudRegionRequest())

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
    discard waitFor client.putZonesZoneIdOriginCloudRegionsOriginIp("test", "test", newCacheSettingsOriginCloudRegionV2Request())

  test "DELETE /zones/{zone_id}/origin/cloud_regions/{origin_ip}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdOriginCloudRegionsOriginIp("test", "test")

