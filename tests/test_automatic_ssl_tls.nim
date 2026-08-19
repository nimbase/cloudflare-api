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

suite "automatic_ssl_tls serialization":
  test "round-trips CacheApiResponseSingleId":
    let obj = newCacheApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips CacheApiResponseCommonFailure":
    let obj = newCacheApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CacheSchemasPatch":
    let obj = newCacheSchemasPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheSchemasPatch)) == openjson.toJson(obj)

suite "automatic_ssl_tls endpoints":
  test "GET /zones/{zone_id}/settings/ssl_automatic_mode":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsSslAutomaticMode("test")

  test "PATCH /zones/{zone_id}/settings/ssl_automatic_mode":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSettingsSslAutomaticMode("test", newCacheSchemasPatch())

