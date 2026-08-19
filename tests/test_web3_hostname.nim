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

suite "web3_hostname serialization":
  test "round-trips Web3ContentListDetailsResponse":
    let obj = newWeb3ContentListDetailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ContentListDetailsResponse)) == openjson.toJson(obj)

  test "round-trips Web3ApiResponseCommonFailure":
    let obj = newWeb3ApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips Web3SingleResponse":
    let obj = newWeb3SingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3SingleResponse)) == openjson.toJson(obj)

  test "round-trips Web3ContentListEntrySingleResponse":
    let obj = newWeb3ContentListEntrySingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ContentListEntrySingleResponse)) == openjson.toJson(obj)

  test "round-trips Web3CreateRequest":
    let obj = newWeb3CreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3CreateRequest)) == openjson.toJson(obj)

  test "round-trips Web3ContentListUpdateRequest":
    let obj = newWeb3ContentListUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ContentListUpdateRequest)) == openjson.toJson(obj)

  test "round-trips Web3ModifyRequest":
    let obj = newWeb3ModifyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ModifyRequest)) == openjson.toJson(obj)

  test "round-trips Web3ContentListEntryCollectionResponse":
    let obj = newWeb3ContentListEntryCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ContentListEntryCollectionResponse)) == openjson.toJson(obj)

  test "round-trips Web3CollectionResponse":
    let obj = newWeb3CollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3CollectionResponse)) == openjson.toJson(obj)

  test "round-trips Web3ContentListEntryCreateRequest":
    let obj = newWeb3ContentListEntryCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ContentListEntryCreateRequest)) == openjson.toJson(obj)

  test "round-trips Web3ApiResponseSingleId":
    let obj = newWeb3ApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.Web3ApiResponseSingleId)) == openjson.toJson(obj)

suite "web3_hostname endpoints":
  test "GET /zones/{zone_id}/web3/hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWeb3Hostnames("test")

  test "POST /zones/{zone_id}/web3/hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWeb3Hostnames("test", newWeb3CreateRequest())

  test "GET /zones/{zone_id}/web3/hostnames/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWeb3HostnamesIdentifier("test", "test")

  test "DELETE /zones/{zone_id}/web3/hostnames/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdWeb3HostnamesIdentifier("test", "test")

  test "PATCH /zones/{zone_id}/web3/hostnames/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdWeb3HostnamesIdentifier("test", "test", newWeb3ModifyRequest())

  test "GET /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentList("test", "test")

  test "PUT /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentList("test", "test", newWeb3ContentListUpdateRequest())

  test "GET /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntries("test", "test")

  test "POST /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntries("test", "test", newWeb3ContentListEntryCreateRequest())

  test "GET /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{content_list_entry_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier("test", "test", "test")

  test "PUT /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{content_list_entry_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier("test", "test", "test", newWeb3ContentListEntryCreateRequest())

  test "DELETE /zones/{zone_id}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{content_list_entry_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier("test", "test", "test")

