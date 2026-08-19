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

suite "page_shield serialization":
  test "round-trips PageShieldGetZoneConnectionResponse":
    let obj = newPageShieldGetZoneConnectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldGetZoneConnectionResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldApiResponseCommonFailure":
    let obj = newPageShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PageShieldUpdateZoneSettingsResponse":
    let obj = newPageShieldUpdateZoneSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldUpdateZoneSettingsResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldGetZoneScriptResponse":
    let obj = newPageShieldGetZoneScriptResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldGetZoneScriptResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldGetZonePolicyResponse":
    let obj = newPageShieldGetZonePolicyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldGetZonePolicyResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldListZonePoliciesResponse":
    let obj = newPageShieldListZonePoliciesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldListZonePoliciesResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldApiGetResponseCollection":
    let obj = newPageShieldApiGetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldApiGetResponseCollection)) == openjson.toJson(obj)

  test "round-trips PageShieldListZoneConnectionsResponse":
    let obj = newPageShieldListZoneConnectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldListZoneConnectionsResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldGetZoneSettingsResponse":
    let obj = newPageShieldGetZoneSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldGetZoneSettingsResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldGetZoneCookieResponse":
    let obj = newPageShieldGetZoneCookieResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldGetZoneCookieResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldPolicy":
    let obj = newPageShieldPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldPolicy)) == openjson.toJson(obj)

  test "round-trips PageShieldListZoneScriptsResponse":
    let obj = newPageShieldListZoneScriptsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldListZoneScriptsResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldListZoneCookiesResponse":
    let obj = newPageShieldListZoneCookiesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldListZoneCookiesResponse)) == openjson.toJson(obj)

  test "round-trips PageShieldZoneSettingsResponseSingle":
    let obj = newPageShieldZoneSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PageShieldZoneSettingsResponseSingle)) == openjson.toJson(obj)

suite "page_shield endpoints":
  test "GET /zones/{zone_id}/page_shield":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShield("test")

  test "GET /zones/{zone_id}/page_shield/connections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldConnections("test", "test", "test", "test", "test", 1.0, {}, {}, true, true, "test", "test", {})

  test "GET /zones/{zone_id}/page_shield/connections/{connection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldConnectionsConnectionId("test", "test")

  test "GET /zones/{zone_id}/page_shield/cookies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldCookies("test", "test", "test", 1.0, {}, {}, "test", {}, "test", true, true, {}, {}, "test", "test")

  test "GET /zones/{zone_id}/page_shield/cookies/{cookie_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldCookiesCookieId("test", "test")

  test "GET /zones/{zone_id}/page_shield/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldPolicies("test")

  test "POST /zones/{zone_id}/page_shield/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdPageShieldPolicies("test", newPageShieldPolicy())

  test "GET /zones/{zone_id}/page_shield/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldPoliciesPolicyId("test", "test")

  test "DELETE /zones/{zone_id}/page_shield/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdPageShieldPoliciesPolicyId("test", "test")

  test "GET /zones/{zone_id}/page_shield/scripts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldScripts("test", "test", "test", "test", "test", 1.0, {}, {}, true, true, true, "test", "test", {})

  test "GET /zones/{zone_id}/page_shield/scripts/{script_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPageShieldScriptsScriptId("test", "test")

