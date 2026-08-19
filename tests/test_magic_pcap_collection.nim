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

suite "magic_pcap_collection serialization":
  test "round-trips MagicVisibilityPcapsApiResponseCommonFailure":
    let obj = newMagicVisibilityPcapsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsCollectionResponse":
    let obj = newMagicVisibilityPcapsPcapsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsOwnershipRequest":
    let obj = newMagicVisibilityPcapsPcapsOwnershipRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsOwnershipRequest)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsOwnershipSingleResponse":
    let obj = newMagicVisibilityPcapsPcapsOwnershipSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsOwnershipSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsRequestPcap":
    let obj = newMagicVisibilityPcapsPcapsRequestPcap()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsRequestPcap)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsOwnershipCollection":
    let obj = newMagicVisibilityPcapsPcapsOwnershipCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsOwnershipCollection)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsOwnershipValidateRequest":
    let obj = newMagicVisibilityPcapsPcapsOwnershipValidateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsOwnershipValidateRequest)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityPcapsPcapsSingleResponse":
    let obj = newMagicVisibilityPcapsPcapsSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityPcapsPcapsSingleResponse)) == openjson.toJson(obj)

suite "magic_pcap_collection endpoints":
  test "GET /accounts/{account_id}/pcaps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPcaps("test")

  test "POST /accounts/{account_id}/pcaps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPcaps("test", newMagicVisibilityPcapsPcapsRequestPcap())

  test "GET /accounts/{account_id}/pcaps/ownership":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPcapsOwnership("test")

  test "POST /accounts/{account_id}/pcaps/ownership":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPcapsOwnership("test", newMagicVisibilityPcapsPcapsOwnershipRequest())

  test "POST /accounts/{account_id}/pcaps/ownership/validate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPcapsOwnershipValidate("test", newMagicVisibilityPcapsPcapsOwnershipValidateRequest())

  test "DELETE /accounts/{account_id}/pcaps/ownership/{ownership_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPcapsOwnershipOwnershipId("test", "test")

  test "GET /accounts/{account_id}/pcaps/{pcap_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPcapsPcapId("test", "test")

  test "GET /accounts/{account_id}/pcaps/{pcap_id}/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPcapsPcapIdDownload("test", "test")

  test "PUT /accounts/{account_id}/pcaps/{pcap_id}/stop":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdPcapsPcapIdStop("test", "test")

