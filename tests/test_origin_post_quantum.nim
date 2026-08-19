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
  test "round-trips CacheRulesApiResponseCommonFailure":
    let obj = newCacheRulesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheRulesZoneCacheSettingsResponseSingle":
    let obj = newCacheRulesZoneCacheSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesZoneCacheSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips CacheRulesOriginPostQuantumEncryptionResponseValue":
    let obj = newCacheRulesOriginPostQuantumEncryptionResponseValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheRulesOriginPostQuantumEncryptionResponseValue)) == openjson.toJson(obj)

suite "origin_post_quantum endpoints":
  test "GET /zones/{zone_id}/cache/origin_post_quantum_encryption":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCacheOriginPostQuantumEncryption("test")

