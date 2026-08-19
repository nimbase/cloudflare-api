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

suite "images serialization":
  test "round-trips GetAccountsAccountIdV1ImagesResponse":
    let obj = cloudflare.GetAccountsAccountIdV1ImagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdV1ImagesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdV1ImagesResponse":
    let obj = cloudflare.PostAccountsAccountIdV1ImagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdV1ImagesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdV1ImagesImageIdResponse":
    let obj = cloudflare.GetAccountsAccountIdV1ImagesImageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdV1ImagesImageIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdV1ImagesImageIdResponse":
    let obj = cloudflare.PutAccountsAccountIdV1ImagesImageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdV1ImagesImageIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdV1ImagesImageIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdV1ImagesImageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdV1ImagesImageIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdV1ImagesImageIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdV1ImagesImageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdV1ImagesImageIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdV2ImagesResponse":
    let obj = cloudflare.GetAccountsAccountIdV2ImagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdV2ImagesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdV2ImagesDirectUploadResponse":
    let obj = cloudflare.PostAccountsAccountIdV2ImagesDirectUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdV2ImagesDirectUploadResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse":
    let obj = cloudflare.GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse":
    let obj = cloudflare.PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse)) == openjson.toJson(obj)

suite "images endpoints":
  test "GET /accounts/{accountId}/v1/images":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdV1Images("test", 1, "test", "test", {})

  test "POST /accounts/{accountId}/v1/images":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdV1Images("test")

  test "GET /accounts/{accountId}/v1/images/{imageId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdV1ImagesImageId("test", "test")

  test "PUT /accounts/{accountId}/v1/images/{imageId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdV1ImagesImageId("test", "test")

  test "DELETE /accounts/{accountId}/v1/images/{imageId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdV1ImagesImageId("test", "test")

  test "GET /accounts/{accountId}/v1/images/{imageId}/blob":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdV1ImagesImageIdBlob("test", "test")

  test "GET /accounts/{accountId}/v2/images":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdV2Images("test", 1, "test", "test", {})

  test "POST /accounts/{accountId}/v2/images/direct_upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdV2ImagesDirectUpload("test")

  test "GET /accounts/{accountId}/zones/{zoneId}/v1/images/flows":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZonesZoneIdV1ImagesFlows("test", "test")

