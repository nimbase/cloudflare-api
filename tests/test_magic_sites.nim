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

suite "magic_sites serialization":
  test "round-trips MagicSiteUpdateRequest":
    let obj = newMagicSiteUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSiteUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicSitesCollectionResponse":
    let obj = newMagicSitesCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSitesCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicSiteDeletedResponse":
    let obj = newMagicSiteDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSiteDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicSiteModifiedResponse":
    let obj = newMagicSiteModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSiteModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicSitesAddSingleRequest":
    let obj = newMagicSitesAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSitesAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicSiteSingleResponse":
    let obj = newMagicSiteSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicSiteSingleResponse)) == openjson.toJson(obj)

suite "magic_sites endpoints":
  test "GET /accounts/{account_id}/magic/sites":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSites("test", "test")

  test "POST /accounts/{account_id}/magic/sites":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSites("test", newMagicSitesAddSingleRequest())

  test "GET /accounts/{account_id}/magic/sites/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteId("test", "test")

  test "PUT /accounts/{account_id}/magic/sites/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteId("test", "test", newMagicSiteUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteId("test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteId("test", "test", newMagicSiteUpdateRequest())

