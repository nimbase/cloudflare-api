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

suite "magic_cf1_site_ramps serialization":
  test "round-trips MagicCf1SiteRampBody":
    let obj = newMagicCf1SiteRampBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SiteRampBody)) == openjson.toJson(obj)

  test "round-trips MagicCf1SiteRampsCollectionResponse":
    let obj = newMagicCf1SiteRampsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SiteRampsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicCf1SiteRampSingleResponse":
    let obj = newMagicCf1SiteRampSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCf1SiteRampSingleResponse)) == openjson.toJson(obj)

suite "magic_cf1_site_ramps endpoints":
  test "GET /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}/ramps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCf1SitesCf1SiteIdRamps("test", "test")

  test "POST /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}/ramps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCf1SitesCf1SiteIdRamps("test", "test")

  test "GET /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}/ramps/{ramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCf1SitesCf1SiteIdRampsRampId("test", "test", "test")

  test "DELETE /accounts/{account_id}/magic/cf1_sites/{cf1_site_id}/ramps/{ramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicCf1SitesCf1SiteIdRampsRampId("test", "test", "test")

