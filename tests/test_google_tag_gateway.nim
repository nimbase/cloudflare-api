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

suite "google_tag_gateway serialization":
  test "round-trips GoogleTagGatewayApiResponseCommon":
    let obj = newGoogleTagGatewayApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GoogleTagGatewayApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips GoogleTagGatewayApiResponseCommonFailure":
    let obj = newGoogleTagGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GoogleTagGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips GoogleTagGatewayGoogleTagGatewayConfig":
    let obj = newGoogleTagGatewayGoogleTagGatewayConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GoogleTagGatewayGoogleTagGatewayConfig)) == openjson.toJson(obj)

suite "google_tag_gateway endpoints":
  test "GET /zones/{zone_id}/settings/google-tag-gateway/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsGoogleTagGatewayConfig("test")

  test "PUT /zones/{zone_id}/settings/google-tag-gateway/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSettingsGoogleTagGatewayConfig("test", newGoogleTagGatewayGoogleTagGatewayConfig())

