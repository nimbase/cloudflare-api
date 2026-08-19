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

suite "ai_security_for_apps serialization":
  test "round-trips WafProductApiBundleCustomTopics":
    let obj = newWafProductApiBundleCustomTopics()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleCustomTopics)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleSettings":
    let obj = newWafProductApiBundleSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleSettings)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleApiResponseCommonFailure3":
    let obj = newWafProductApiBundleApiResponseCommonFailure3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleApiResponseCommonFailure3)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseCustomTopics":
    let obj = newWafProductApiBundleResponseCustomTopics()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseCustomTopics)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseSettings":
    let obj = newWafProductApiBundleResponseSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseSettings)) == openjson.toJson(obj)

suite "ai_security_for_apps endpoints":
  test "GET /zones/{zone_id}/ai-security/custom-topics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAiSecurityCustomTopics("test")

  test "PUT /zones/{zone_id}/ai-security/custom-topics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdAiSecurityCustomTopics("test", newWafProductApiBundleCustomTopics())

  test "GET /zones/{zone_id}/ai-security/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAiSecuritySettings("test")

  test "PUT /zones/{zone_id}/ai-security/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdAiSecuritySettings("test", newWafProductApiBundleSettings())

