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

suite "origin_tls serialization":
  test "round-trips CacheAutoOriginTlsKexPatch":
    let obj = newCacheAutoOriginTlsKexPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheAutoOriginTlsKexPatch)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsDeleteResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsDeleteResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsDeleteResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheAutoOriginTlsKexFailureResponse":
    let obj = newCacheAutoOriginTlsKexFailureResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheAutoOriginTlsKexFailureResponse)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginTlsComplianceModes":
    let obj = newCacheSettingsOriginTlsComplianceModes()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginTlsComplianceModes)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheAutoOriginTlsKexResponse":
    let obj = newCacheAutoOriginTlsKexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheAutoOriginTlsKexResponse)) == openjson.toJson(obj)

  test "round-trips CacheSettingsOriginTlsComplianceModesResponseValue":
    let obj = newCacheSettingsOriginTlsComplianceModesResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginTlsComplianceModesResponseValue)) == openjson.toJson(obj)

suite "origin_tls endpoints":
  test "GET /zones/{zone_id}/settings/auto_origin_tls_kex":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsAutoOriginTlsKex("test")

  test "PATCH /zones/{zone_id}/settings/auto_origin_tls_kex":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsAutoOriginTlsKex("test", newCacheAutoOriginTlsKexPatch())

  test "GET /zones/{zone_id}/settings/origin_tls_compliance_modes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsOriginTlsComplianceModes("test")

  test "DELETE /zones/{zone_id}/settings/origin_tls_compliance_modes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSettingsOriginTlsComplianceModes("test")

