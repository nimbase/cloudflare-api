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

suite "ssl_tls_mode_recommendation serialization":
  test "round-trips CacheApiResponseSingleId":
    let obj = newCacheApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips CacheApiResponseCommonFailure":
    let obj = newCacheApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CacheApiResponseCommonFailure)) == openjson.toJson(obj)

suite "ssl_tls_mode_recommendation endpoints":
  test "GET /zones/{zone_id}/ssl/recommendation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslRecommendation("test")

