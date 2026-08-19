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

suite "dlp_profiles serialization":
  test "round-trips DlpPredefinedProfileUpdate":
    let obj = newDlpPredefinedProfileUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedProfileUpdate)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpProfile":
    let obj = newDlpProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpProfile)) == openjson.toJson(obj)

  test "round-trips DlpNewCustomProfile":
    let obj = newDlpNewCustomProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewCustomProfile)) == openjson.toJson(obj)

  test "round-trips DlpNewPredefinedProfile":
    let obj = newDlpNewPredefinedProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewPredefinedProfile)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedProfileConfig":
    let obj = newDlpPredefinedProfileConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedProfileConfig)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedProfileConfigUpdate":
    let obj = newDlpPredefinedProfileConfigUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedProfileConfigUpdate)) == openjson.toJson(obj)

  test "round-trips DlpCustomProfileUpdate":
    let obj = newDlpCustomProfileUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCustomProfileUpdate)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_profiles endpoints":
  test "GET /accounts/{account_id}/dlp/profiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfiles(true, "test")

  test "GET /accounts/{account_id}/dlp/profiles/custom":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfilesCustom("test")

  test "POST /accounts/{account_id}/dlp/profiles/custom":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpProfilesCustom("test", newDlpNewCustomProfile())

  test "GET /accounts/{account_id}/dlp/profiles/custom/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfilesCustomProfileId("test", "test")

  test "PUT /accounts/{account_id}/dlp/profiles/custom/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpProfilesCustomProfileId("test", "test", newDlpCustomProfileUpdate())

  test "DELETE /accounts/{account_id}/dlp/profiles/custom/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpProfilesCustomProfileId("test", "test")

  test "POST /accounts/{account_id}/dlp/profiles/predefined":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpProfilesPredefined("test", newDlpNewPredefinedProfile())

  test "GET /accounts/{account_id}/dlp/profiles/predefined/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfilesPredefinedProfileId("test", "test")

  test "PUT /accounts/{account_id}/dlp/profiles/predefined/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpProfilesPredefinedProfileId("test", "test", newDlpPredefinedProfileUpdate())

  test "DELETE /accounts/{account_id}/dlp/profiles/predefined/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpProfilesPredefinedProfileId("test", "test")

  test "GET /accounts/{account_id}/dlp/profiles/predefined/{profile_id}/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfilesPredefinedProfileIdConfig("test", "test")

  test "POST /accounts/{account_id}/dlp/profiles/predefined/{profile_id}/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpProfilesPredefinedProfileIdConfig("test", "test", newDlpPredefinedProfileConfigUpdate())

  test "PUT /accounts/{account_id}/dlp/profiles/predefined/{profile_id}/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpProfilesPredefinedProfileIdConfig("test", "test", newDlpPredefinedProfileConfigUpdate())

  test "GET /accounts/{account_id}/dlp/profiles/{profile_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpProfilesProfileId("test", "test")

