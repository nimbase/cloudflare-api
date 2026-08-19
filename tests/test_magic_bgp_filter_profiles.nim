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

suite "magic_bgp_filter_profiles serialization":
  test "round-trips MagicMagicBgpFilterProfilesListResponse":
    let obj = newMagicMagicBgpFilterProfilesListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicMagicBgpFilterProfilesListResponse)) == openjson.toJson(obj)

  test "round-trips MagicMagicBgpFilterProfileResponse":
    let obj = newMagicMagicBgpFilterProfileResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicMagicBgpFilterProfileResponse)) == openjson.toJson(obj)

  test "round-trips MagicCreateBgpFilterProfileRequest":
    let obj = newMagicCreateBgpFilterProfileRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateBgpFilterProfileRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicUpdateBgpFilterProfileRequest":
    let obj = newMagicUpdateBgpFilterProfileRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicUpdateBgpFilterProfileRequest)) == openjson.toJson(obj)

suite "magic_bgp_filter_profiles endpoints":
  test "GET /accounts/{account_id}/magic/bgp/filter_profiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicBgpFilterProfiles("test")

  test "POST /accounts/{account_id}/magic/bgp/filter_profiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicBgpFilterProfiles("test", newMagicCreateBgpFilterProfileRequest())

  test "GET /accounts/{account_id}/magic/bgp/filter_profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicBgpFilterProfilesProfileId("test", "test")

  test "PUT /accounts/{account_id}/magic/bgp/filter_profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicBgpFilterProfilesProfileId("test", "test", newMagicUpdateBgpFilterProfileRequest())

  test "DELETE /accounts/{account_id}/magic/bgp/filter_profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicBgpFilterProfilesProfileId("test", "test")

