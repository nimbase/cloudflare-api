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

suite "client_side_security serialization":
  test "round-trips ClientSideSecurityListZonePoliciesResponse":
    let obj = newClientSideSecurityListZonePoliciesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityListZonePoliciesResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityZoneSettingsResponseSingle":
    let obj = newClientSideSecurityZoneSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityZoneSettingsResponseSingle)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityGetZonePolicyResponse":
    let obj = newClientSideSecurityGetZonePolicyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityGetZonePolicyResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityGetZoneCookieResponse":
    let obj = newClientSideSecurityGetZoneCookieResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityGetZoneCookieResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityGetZoneConnectionResponse":
    let obj = newClientSideSecurityGetZoneConnectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityGetZoneConnectionResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityListZoneCookiesResponse":
    let obj = newClientSideSecurityListZoneCookiesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityListZoneCookiesResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityApiGetResponseCollection":
    let obj = newClientSideSecurityApiGetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityApiGetResponseCollection)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityGetZoneSettingsResponse":
    let obj = newClientSideSecurityGetZoneSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityGetZoneSettingsResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityListZoneConnectionsResponse":
    let obj = newClientSideSecurityListZoneConnectionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityListZoneConnectionsResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityListZoneScriptsResponse":
    let obj = newClientSideSecurityListZoneScriptsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityListZoneScriptsResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityGetZoneScriptResponse":
    let obj = newClientSideSecurityGetZoneScriptResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityGetZoneScriptResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityUpdateZoneSettingsResponse":
    let obj = newClientSideSecurityUpdateZoneSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityUpdateZoneSettingsResponse)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityPolicy":
    let obj = newClientSideSecurityPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityPolicy)) == openjson.toJson(obj)

  test "round-trips ClientSideSecurityApiResponseCommonFailure":
    let obj = newClientSideSecurityApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ClientSideSecurityApiResponseCommonFailure)) == openjson.toJson(obj)

suite "client_side_security endpoints":
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
    discard waitFor client.postZonesZoneIdPageShieldPolicies("test", newClientSideSecurityPolicy())

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

