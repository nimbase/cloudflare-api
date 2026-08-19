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

suite "ip_profiles serialization":
  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesIpProfileUpdateRequest":
    let obj = newTeamsDevicesIpProfileUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIpProfileUpdateRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesIpProfileCreateRequest":
    let obj = newTeamsDevicesIpProfileCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIpProfileCreateRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesPaginationInfo":
    let obj = newTeamsDevicesPaginationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesPaginationInfo)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesIpProfile":
    let obj = newTeamsDevicesIpProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIpProfile)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesIpProfilesResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesIpProfilesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesIpProfilesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesIpProfilesResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesIpProfilesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesIpProfilesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesIpProfilesProfileIdResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesIpProfilesProfileIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesIpProfilesProfileIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse)) == openjson.toJson(obj)

suite "ip_profiles endpoints":
  test "GET /accounts/{account_id}/devices/ip-profiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesIpProfiles("test", 1, 1)

  test "POST /accounts/{account_id}/devices/ip-profiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesIpProfiles("test", newTeamsDevicesIpProfileCreateRequest())

  test "GET /accounts/{account_id}/devices/ip-profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesIpProfilesProfileId("test", "test")

  test "DELETE /accounts/{account_id}/devices/ip-profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesIpProfilesProfileId("test", "test")

  test "PATCH /accounts/{account_id}/devices/ip-profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDevicesIpProfilesProfileId("test", "test", newTeamsDevicesIpProfileUpdateRequest())

