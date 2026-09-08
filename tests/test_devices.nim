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

suite "devices serialization":
  test "round-trips TeamsDevicesOverrideCodesResponse":
    let obj = newTeamsDevicesOverrideCodesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesOverrideCodesResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeviceSettingsResponseCollection":
    let obj = newTeamsDevicesDeviceSettingsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeviceSettingsResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDefaultDeviceSettingsResponse":
    let obj = newTeamsDevicesDefaultDeviceSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDefaultDeviceSettingsResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSplitTunnelIncludeResponseCollection":
    let obj = newTeamsDevicesSplitTunnelIncludeResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSplitTunnelIncludeResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesServiceModeV2":
    let obj = newTeamsDevicesServiceModeV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesServiceModeV2)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeviceSettingsResponse":
    let obj = newTeamsDevicesDeviceSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeviceSettingsResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDevicesResponse":
    let obj = newTeamsDevicesDevicesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDevicesResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesGlobalAcceleration":
    let obj = newTeamsDevicesGlobalAcceleration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesGlobalAcceleration)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesFallbackDomainResponseCollection":
    let obj = newTeamsDevicesFallbackDomainResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesFallbackDomainResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDevicesPolicyCertificatesSingle":
    let obj = newTeamsDevicesDevicesPolicyCertificatesSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDevicesPolicyCertificatesSingle)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSplitTunnelResponseCollection":
    let obj = newTeamsDevicesSplitTunnelResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSplitTunnelResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSplitTunnelInclude":
    let obj = newTeamsDevicesSplitTunnelInclude()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSplitTunnelInclude)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSplitTunnel":
    let obj = newTeamsDevicesSplitTunnel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSplitTunnel)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeviceResponse":
    let obj = newTeamsDevicesDeviceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeviceResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesFallbackDomain":
    let obj = newTeamsDevicesFallbackDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesFallbackDomain)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDevicesPolicyCertificates":
    let obj = newTeamsDevicesDevicesPolicyCertificates()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDevicesPolicyCertificates)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseSingle":
    let obj = newTeamsDevicesApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesVirtualNetworks":
    let obj = newTeamsDevicesVirtualNetworks()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesVirtualNetworks)) == openjson.toJson(obj)

suite "devices endpoints":
  test "GET /accounts/{account_id}/devices":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevices("test")

  test "GET /accounts/{account_id}/devices/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicies("test")

  test "GET /accounts/{account_id}/devices/policy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicy("test")

  test "GET /accounts/{account_id}/devices/policy/exclude":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyExclude("test")

  test "PUT /accounts/{account_id}/devices/policy/exclude":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyExclude("test")

  test "GET /accounts/{account_id}/devices/policy/fallback_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyFallbackDomains("test")

  test "PUT /accounts/{account_id}/devices/policy/fallback_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyFallbackDomains("test")

  test "GET /accounts/{account_id}/devices/policy/include":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyInclude("test")

  test "PUT /accounts/{account_id}/devices/policy/include":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyInclude("test")

  test "GET /accounts/{account_id}/devices/policy/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyPolicyId("test", "test")

  test "DELETE /accounts/{account_id}/devices/policy/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesPolicyPolicyId("test", "test")

  test "GET /accounts/{account_id}/devices/policy/{policy_id}/exclude":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyPolicyIdExclude("test", "test")

  test "PUT /accounts/{account_id}/devices/policy/{policy_id}/exclude":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyPolicyIdExclude("test", "test")

  test "GET /accounts/{account_id}/devices/policy/{policy_id}/fallback_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyPolicyIdFallbackDomains("test", "test")

  test "PUT /accounts/{account_id}/devices/policy/{policy_id}/fallback_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyPolicyIdFallbackDomains("test", "test")

  test "GET /accounts/{account_id}/devices/policy/{policy_id}/include":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPolicyPolicyIdInclude("test", "test")

  test "PUT /accounts/{account_id}/devices/policy/{policy_id}/include":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesPolicyPolicyIdInclude("test", "test")

  test "GET /accounts/{account_id}/devices/{device_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesDeviceId("test", "test")

  test "GET /accounts/{account_id}/devices/{device_id}/override_codes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesDeviceIdOverrideCodes("test", "test")

  test "GET /zones/{zone_id}/devices/policy/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDevicesPolicyCertificates("test")

  test "PATCH /zones/{zone_id}/devices/policy/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdDevicesPolicyCertificates("test", newTeamsDevicesDevicesPolicyCertificates())

