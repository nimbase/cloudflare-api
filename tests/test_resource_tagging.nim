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

suite "resource_tagging serialization":
  test "round-trips ResourceTaggingDeleteTagsRequestZoneLevel":
    let obj = newResourceTaggingDeleteTagsRequestZoneLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingDeleteTagsRequestZoneLevel)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingAccountId":
    let obj = newResourceTaggingAccountId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingAccountId)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingSetTagsRequestZoneLevel":
    let obj = newResourceTaggingSetTagsRequestZoneLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingSetTagsRequestZoneLevel)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingApiResponseCommonFailure":
    let obj = newResourceTaggingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingDeleteTagsRequestAccountLevel":
    let obj = newResourceTaggingDeleteTagsRequestAccountLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingDeleteTagsRequestAccountLevel)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingTagValuesResponseCollection":
    let obj = newResourceTaggingTagValuesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingTagValuesResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingTagKeysResponseCollection":
    let obj = newResourceTaggingTagKeysResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingTagKeysResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingZoneId":
    let obj = newResourceTaggingZoneId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingZoneId)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingSetTagsRequestAccountLevel":
    let obj = newResourceTaggingSetTagsRequestAccountLevel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingSetTagsRequestAccountLevel)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingTaggedResourceResponseCollection":
    let obj = newResourceTaggingTaggedResourceResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingTaggedResourceResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingTaggedResourceResponseSingle":
    let obj = newResourceTaggingTaggedResourceResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingTaggedResourceResponseSingle)) == openjson.toJson(obj)

  test "round-trips ResourceTaggingTagKeySummaryResponseCollection":
    let obj = newResourceTaggingTagKeySummaryResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceTaggingTagKeySummaryResponseCollection)) == openjson.toJson(obj)

suite "resource_tagging endpoints":
  test "PUT /accounts/{account_id}/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdTags(newResourceTaggingAccountId(), newResourceTaggingSetTagsRequestAccountLevel())

  test "DELETE /accounts/{account_id}/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTags(newResourceTaggingAccountId(), newResourceTaggingDeleteTagsRequestAccountLevel())

  test "GET /accounts/{account_id}/tags/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTagsKeys(newResourceTaggingAccountId(), "test")

  test "GET /accounts/{account_id}/tags/resources":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTagsResources(newResourceTaggingAccountId(), @["test"], "test", @["test"], true, @["test"], "test")

  test "GET /accounts/{account_id}/tags/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTagsSummary(newResourceTaggingAccountId(), "test")

  test "PUT /zones/{zone_id}/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdTags(newResourceTaggingZoneId(), newResourceTaggingSetTagsRequestZoneLevel())

  test "DELETE /zones/{zone_id}/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdTags(newResourceTaggingZoneId(), newResourceTaggingDeleteTagsRequestZoneLevel())

