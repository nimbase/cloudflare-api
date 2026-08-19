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

suite "zone_level_access_applications serialization":
  test "round-trips AccessSingleResponse21":
    let obj = newAccessSingleResponse21()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse21)) == openjson.toJson(obj)

  test "round-trips AccessAppId":
    let obj = newAccessAppId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppId)) == openjson.toJson(obj)

  test "round-trips AccessAppSettingsRequest":
    let obj = newAccessAppSettingsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppSettingsRequest)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessPolicyCheckResponse2":
    let obj = newAccessPolicyCheckResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyCheckResponse2)) == openjson.toJson(obj)

  test "round-trips AccessEmptyResponse2":
    let obj = newAccessEmptyResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessEmptyResponse2)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection22":
    let obj = newAccessResponseCollection22()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection22)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

  test "round-trips AccessApps":
    let obj = newAccessApps()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApps)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponseUpdate":
    let obj = newAccessSingleResponseUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponseUpdate)) == openjson.toJson(obj)

suite "zone_level_access_applications endpoints":
  test "GET /zones/{zone_id}/access/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessApps("test")

  test "POST /zones/{zone_id}/access/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdAccessApps("test", newAccessApps())

  test "GET /zones/{zone_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessAppsAppId(newAccessAppId(), "test")

  test "PUT /zones/{zone_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdAccessAppsAppId(newAccessAppId(), "test", newAccessApps())

  test "DELETE /zones/{zone_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessAppsAppId(newAccessAppId(), "test")

  test "POST /zones/{zone_id}/access/apps/{app_id}/revoke_tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdAccessAppsAppIdRevokeTokens(newAccessAppId(), "test")

  test "PUT /zones/{zone_id}/access/apps/{app_id}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdAccessAppsAppIdSettings(newAccessAppId(), "test", newAccessAppSettingsRequest())

  test "PATCH /zones/{zone_id}/access/apps/{app_id}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdAccessAppsAppIdSettings(newAccessAppId(), "test", newAccessAppSettingsRequest())

  test "GET /zones/{zone_id}/access/apps/{app_id}/user_policy_checks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessAppsAppIdUserPolicyChecks(newAccessAppId(), "test")

