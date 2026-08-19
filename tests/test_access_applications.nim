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

suite "access_applications serialization":
  test "round-trips AccessPolicyCheckResponse":
    let obj = newAccessPolicyCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessPolicyCheckResponse)) == openjson.toJson(obj)

  test "round-trips AccessAppId":
    let obj = newAccessAppId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppId)) == openjson.toJson(obj)

  test "round-trips AccessAppSettingsRequest":
    let obj = newAccessAppSettingsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppSettingsRequest)) == openjson.toJson(obj)

  test "round-trips AccessAppRequest":
    let obj = newAccessAppRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppRequest)) == openjson.toJson(obj)

  test "round-trips AccessAppResponse":
    let obj = newAccessAppResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessAppResponse)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessEmptyResponse2":
    let obj = newAccessEmptyResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessEmptyResponse2)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse8":
    let obj = newAccessSingleResponse8()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse8)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection7":
    let obj = newAccessResponseCollection7()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection7)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponseUpdate":
    let obj = newAccessSingleResponseUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponseUpdate)) == openjson.toJson(obj)

suite "access_applications endpoints":
  test "GET /accounts/{account_id}/access/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessApps("test", "test", "test", "test", "test", true, "test", 1, 1)

  test "POST /accounts/{account_id}/access/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessApps("test", newAccessAppRequest())

  test "GET /accounts/{account_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsAppId(newAccessAppId(), "test")

  test "PUT /accounts/{account_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessAppsAppId(newAccessAppId(), "test", newAccessAppRequest())

  test "DELETE /accounts/{account_id}/access/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessAppsAppId(newAccessAppId(), "test")

  test "POST /accounts/{account_id}/access/apps/{app_id}/revoke_tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessAppsAppIdRevokeTokens(newAccessAppId(), "test")

  test "PUT /accounts/{account_id}/access/apps/{app_id}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessAppsAppIdSettings(newAccessAppId(), "test", newAccessAppSettingsRequest())

  test "PATCH /accounts/{account_id}/access/apps/{app_id}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdAccessAppsAppIdSettings(newAccessAppId(), "test", newAccessAppSettingsRequest())

  test "GET /accounts/{account_id}/access/apps/{app_id}/user_policy_checks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsAppIdUserPolicyChecks(newAccessAppId(), "test")

