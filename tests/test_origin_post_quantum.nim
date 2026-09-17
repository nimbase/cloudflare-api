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

suite "origin_post_quantum serialization":
  test "round-trips CacheSettingsOriginPostQuantumEncryptionResponseValue":
    let obj = newCacheSettingsOriginPostQuantumEncryptionResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsOriginPostQuantumEncryptionResponseValue)) == openjson.toJson(obj)

  test "round-trips CacheSettingsApiResponseCommonFailure":
    let obj = newCacheSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSettingsZoneCacheSettingsResponseSingle":
    let obj = newCacheSettingsZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSettingsZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

suite "origin_post_quantum endpoints":
  test "GET /zones/{zone_id}/cache/origin_post_quantum_encryption":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginPostQuantumEncryption("test")

