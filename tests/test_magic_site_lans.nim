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

suite "magic_site_lans serialization":
  test "round-trips MagicLanUpdateRequest":
    let obj = newMagicLanUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLanUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicLanDeletedResponse":
    let obj = newMagicLanDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLanDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicLanModifiedResponse":
    let obj = newMagicLanModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLanModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicLanSingleResponse":
    let obj = newMagicLanSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLanSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicLansAddSingleRequest":
    let obj = newMagicLansAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLansAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicLansCollectionResponse":
    let obj = newMagicLansCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicLansCollectionResponse)) == openjson.toJson(obj)

suite "magic_site_lans endpoints":
  test "GET /accounts/{account_id}/magic/sites/{site_id}/lans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdLans("test", "test")

  test "POST /accounts/{account_id}/magic/sites/{site_id}/lans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSitesSiteIdLans("test", "test", newMagicLansAddSingleRequest())

  test "GET /accounts/{account_id}/magic/sites/{site_id}/lans/{lan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdLansLanId("test", "test", "test")

  test "PUT /accounts/{account_id}/magic/sites/{site_id}/lans/{lan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteIdLansLanId("test", "test", "test", newMagicLanUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}/lans/{lan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteIdLansLanId("test", "test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}/lans/{lan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteIdLansLanId("test", "test", "test", newMagicLanUpdateRequest())

