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

suite "magic_cf1_sites serialization":
  test "round-trips MagicCf1SiteSingleResponse":
    let obj = newMagicCf1SiteSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SiteSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicCf1SiteUpdate":
    let obj = newMagicCf1SiteUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SiteUpdate)) == openjson.toJson(obj)

  test "round-trips MagicCf1SitesCollectionResponse":
    let obj = newMagicCf1SitesCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SitesCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicCf1Site":
    let obj = newMagicCf1Site()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1Site)) == openjson.toJson(obj)

suite "magic_cf1_sites endpoints":
  test "GET /accounts/{account_id}/magic/cf1_sites":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCf1Sites("test")

  test "POST /accounts/{account_id}/magic/cf1_sites":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCf1Sites("test")

  test "GET /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCf1SitesCf1SiteId("test", "test")

  test "DELETE /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicCf1SitesCf1SiteId("test", "test")

  test "PATCH /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicCf1SitesCf1SiteId("test", "test", newMagicCf1SiteUpdate())

