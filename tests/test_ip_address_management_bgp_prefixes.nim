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

suite "ip_address_management_bgp_prefixes serialization":
  test "round-trips AddressingSingleResponseBgp":
    let obj = newAddressingSingleResponseBgp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingSingleResponseBgp)) == openjson.toJson(obj)

  test "round-trips AddressingBgpPrefixUpdateAdvertisement":
    let obj = newAddressingBgpPrefixUpdateAdvertisement()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingBgpPrefixUpdateAdvertisement)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingBgpPrefixCreate":
    let obj = newAddressingBgpPrefixCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingBgpPrefixCreate)) == openjson.toJson(obj)

  test "round-trips AddressingResponseCollectionBgp":
    let obj = newAddressingResponseCollectionBgp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingResponseCollectionBgp)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCommon":
    let obj = newAddressingApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommon)) == openjson.toJson(obj)

suite "ip_address_management_bgp_prefixes endpoints":
  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixes("test", "test")

  test "POST /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixes("test", "test", newAddressingBgpPrefixCreate())

  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/prefixes/{bgp_prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId("test", "test", "test")

  test "DELETE /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/prefixes/{bgp_prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId("test", "test", "test")

  test "PATCH /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/prefixes/{bgp_prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId("test", "test", "test", newAddressingBgpPrefixUpdateAdvertisement())

