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

suite "zone_settings serialization":
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips SpeedCloudflareSpeedBrainResponse":
    let obj = newSpeedCloudflareSpeedBrainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedCloudflareSpeedBrainResponse)) == openjson.toJson(obj)

  test "round-trips ZonesSetting":
    let obj = newZonesSetting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesSetting)) == openjson.toJson(obj)

  test "round-trips SpeedTransformationsC2paResponse":
    let obj = newSpeedTransformationsC2paResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedTransformationsC2paResponse)) == openjson.toJson(obj)

  test "round-trips SpeedAutomaticPlatformOptimizationValue":
    let obj = newSpeedAutomaticPlatformOptimizationValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedAutomaticPlatformOptimizationValue)) == openjson.toJson(obj)

  test "round-trips CacheRulesAegisValue":
    let obj = newCacheRulesAegisValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesAegisValue)) == openjson.toJson(obj)

  test "round-trips SpeedH2PrioritizationResponse":
    let obj = newSpeedH2PrioritizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedH2PrioritizationResponse)) == openjson.toJson(obj)

  test "round-trips CacheRulesAegisResponseValue":
    let obj = newCacheRulesAegisResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesAegisResponseValue)) == openjson.toJson(obj)

  test "round-trips SpeedBinaryAstResponse":
    let obj = newSpeedBinaryAstResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedBinaryAstResponse)) == openjson.toJson(obj)

  test "round-trips ZonesZoneSettingsSingleRequest":
    let obj = newZonesZoneSettingsSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesZoneSettingsSingleRequest)) == openjson.toJson(obj)

  test "round-trips SpeedApiResponseCommon":
    let obj = newSpeedApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SpeedTransformationsAllowedOriginsResponse":
    let obj = newSpeedTransformationsAllowedOriginsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedTransformationsAllowedOriginsResponse)) == openjson.toJson(obj)

  test "round-trips SpeedApiResponseCommonFailure":
    let obj = newSpeedApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommonFailure3":
    let obj = newZonesApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommonFailure3)) == openjson.toJson(obj)

  test "round-trips SpeedTransformationsConfigValue":
    let obj = newSpeedTransformationsConfigValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedTransformationsConfigValue)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommon4":
    let obj = newZonesApiResponseCommon4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommon4)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginMaxHttpVersionResponseValue":
    let obj = newCacheRulesOriginMaxHttpVersionResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginMaxHttpVersionResponseValue)) == openjson.toJson(obj)

  test "round-trips SpeedTransformationsConfigResponse":
    let obj = newSpeedTransformationsConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedTransformationsConfigResponse)) == openjson.toJson(obj)

  test "round-trips SpeedAutomaticPlatformOptimizationResponse":
    let obj = newSpeedAutomaticPlatformOptimizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedAutomaticPlatformOptimizationResponse)) == openjson.toJson(obj)

  test "round-trips SpeedCloudflareFonts":
    let obj = newSpeedCloudflareFonts()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedCloudflareFonts)) == openjson.toJson(obj)

  test "round-trips ZonesZoneSettingsResponseCollection":
    let obj = newZonesZoneSettingsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesZoneSettingsResponseCollection)) == openjson.toJson(obj)

  test "round-trips SpeedImageResizingResponse":
    let obj = newSpeedImageResizingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedImageResizingResponse)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginH2MaxStreamsResponseValue":
    let obj = newCacheRulesOriginH2MaxStreamsResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginH2MaxStreamsResponseValue)) == openjson.toJson(obj)

suite "zone_settings endpoints":
  test "GET /zones/{zone_id}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettings("test")

  test "GET /zones/{zone_id}/settings/aegis":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsAegis("test")

  test "GET /zones/{zone_id}/settings/automatic_platform_optimization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsAutomaticPlatformOptimization("test")

  test "GET /zones/{zone_id}/settings/binary_ast":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsBinaryAst("test")

  test "GET /zones/{zone_id}/settings/fonts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsFonts("test")

  test "GET /zones/{zone_id}/settings/h2_prioritization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsH2Prioritization("test")

  test "GET /zones/{zone_id}/settings/image_resizing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsImageResizing("test")

  test "GET /zones/{zone_id}/settings/origin_h2_max_streams":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsOriginH2MaxStreams("test")

  test "GET /zones/{zone_id}/settings/origin_max_http_version":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsOriginMaxHttpVersion("test")

  test "GET /zones/{zone_id}/settings/speed_brain":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsSpeedBrain("test")

  test "GET /zones/{zone_id}/settings/transformations_allowed_origins":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsTransformationsAllowedOrigins("test")

  test "GET /zones/{zone_id}/settings/transformations_c2pa":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsTransformationsC2pa("test")

  test "GET /zones/{zone_id}/settings/transformations_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsTransformationsConfig("test")

  test "GET /zones/{zone_id}/settings/{setting_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsSettingId("test", "test")

  test "PATCH /zones/{zone_id}/settings/{setting_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsSettingId("test", "test", newZonesZoneSettingsSingleRequest())

