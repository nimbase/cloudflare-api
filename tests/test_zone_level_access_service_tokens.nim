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

suite "zone_level_access_service_tokens serialization":
  test "round-trips AccessResponseCollection19":
    let obj = newAccessResponseCollection19()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection19)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessCreateResponse2":
    let obj = newAccessCreateResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCreateResponse2)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse18":
    let obj = newAccessSingleResponse18()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse18)) == openjson.toJson(obj)

suite "zone_level_access_service_tokens endpoints":
  test "GET /zones/{zone_id}/access/service_tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessServiceTokens("test")

  test "GET /zones/{zone_id}/access/service_tokens/{service_token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessServiceTokensServiceTokenId("test", "test")

  test "DELETE /zones/{zone_id}/access/service_tokens/{service_token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessServiceTokensServiceTokenId("test", "test")

