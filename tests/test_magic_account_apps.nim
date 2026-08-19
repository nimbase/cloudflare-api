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

suite "magic_account_apps serialization":
  test "round-trips MagicAppAddSingleRequest":
    let obj = newMagicAppAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicAppsCollectionResponse":
    let obj = newMagicAppsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicAppSingleResponse":
    let obj = newMagicAppSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicAppUpdateRequest":
    let obj = newMagicAppUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppUpdateRequest)) == openjson.toJson(obj)

suite "magic_account_apps endpoints":
  test "GET /accounts/{account_id}/magic/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicApps("test")

  test "POST /accounts/{account_id}/magic/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicApps("test", newMagicAppAddSingleRequest())

  test "PUT /accounts/{account_id}/magic/apps/{account_app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicAppsAccountAppId("test", "test", newMagicAppUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/apps/{account_app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAppsAccountAppId("test", "test")

  test "PATCH /accounts/{account_id}/magic/apps/{account_app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAppsAccountAppId("test", "test", newMagicAppUpdateRequest())

