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

suite "custom_assets_for_a_zone serialization":
  test "round-trips CustomPagesCustomAssetResultList":
    let obj = newCustomPagesCustomAssetResultList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesCustomAssetResultList)) == openjson.toJson(obj)

  test "round-trips CustomPagesApiResponseCommonFailure":
    let obj = newCustomPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CustomPagesCustomAssetResult":
    let obj = newCustomPagesCustomAssetResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesCustomAssetResult)) == openjson.toJson(obj)

suite "custom_assets_for_a_zone endpoints":
  test "GET /zones/{zone_identifier}/custom_pages/assets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdentifierCustomPagesAssets("test", 1, 1)

  test "GET /zones/{zone_identifier}/custom_pages/assets/{asset_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdentifierCustomPagesAssetsAssetName("test", "test")

  test "DELETE /zones/{zone_identifier}/custom_pages/assets/{asset_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdentifierCustomPagesAssetsAssetName("test", "test")

