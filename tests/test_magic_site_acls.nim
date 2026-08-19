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

suite "magic_site_acls serialization":
  test "round-trips MagicAclsCollectionResponse":
    let obj = newMagicAclsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicAclUpdateRequest":
    let obj = newMagicAclUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicAclsAddSingleRequest":
    let obj = newMagicAclsAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclsAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicAclSingleResponse":
    let obj = newMagicAclSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicAclDeletedResponse":
    let obj = newMagicAclDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclDeletedResponse)) == openjson.toJson(obj)

  test "round-trips MagicAclModifiedResponse":
    let obj = newMagicAclModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAclModifiedResponse)) == openjson.toJson(obj)

suite "magic_site_acls endpoints":
  test "GET /accounts/{account_id}/magic/sites/{site_id}/acls":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdAcls("test", "test")

  test "POST /accounts/{account_id}/magic/sites/{site_id}/acls":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSitesSiteIdAcls("test", "test", newMagicAclsAddSingleRequest())

  test "GET /accounts/{account_id}/magic/sites/{site_id}/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdAclsAclId("test", "test", "test")

  test "PUT /accounts/{account_id}/magic/sites/{site_id}/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteIdAclsAclId("test", "test", "test", newMagicAclUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteIdAclsAclId("test", "test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteIdAclsAclId("test", "test", "test", newMagicAclUpdateRequest())

