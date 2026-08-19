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

suite "magic_site_wans serialization":
  test "round-trips MagicWansCollectionResponse":
    let obj = newMagicWansCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWansCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicWanModifiedResponse":
    let obj = newMagicWanModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWanModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicWanDeletedResponse":
    let obj = newMagicWanDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWanDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicWanSingleResponse":
    let obj = newMagicWanSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWanSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicWansAddSingleRequest":
    let obj = newMagicWansAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWansAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicWanUpdateRequest":
    let obj = newMagicWanUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicWanUpdateRequest)) == openjson.toJson(obj)

suite "magic_site_wans endpoints":
  test "GET /accounts/{account_id}/magic/sites/{site_id}/wans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdWans("test", "test")

  test "POST /accounts/{account_id}/magic/sites/{site_id}/wans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSitesSiteIdWans("test", "test", newMagicWansAddSingleRequest())

  test "GET /accounts/{account_id}/magic/sites/{site_id}/wans/{wan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdWansWanId("test", "test", "test")

  test "PUT /accounts/{account_id}/magic/sites/{site_id}/wans/{wan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteIdWansWanId("test", "test", "test", newMagicWanUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}/wans/{wan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteIdWansWanId("test", "test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}/wans/{wan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteIdWansWanId("test", "test", "test", newMagicWanUpdateRequest())

