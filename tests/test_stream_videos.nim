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

suite "stream_videos serialization":
  test "round-trips StreamVideoResponseSingle":
    let obj = newStreamVideoResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamVideoResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamSignedTokenRequest":
    let obj = newStreamSignedTokenRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamSignedTokenRequest)) == openjson.toJson(obj)

  test "round-trips StreamVideoCopyRequest":
    let obj = newStreamVideoCopyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamVideoCopyRequest)) == openjson.toJson(obj)

  test "round-trips StreamVideoUpdate":
    let obj = newStreamVideoUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamVideoUpdate)) == openjson.toJson(obj)

  test "round-trips StreamDirectUploadResponse":
    let obj = newStreamDirectUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDirectUploadResponse)) == openjson.toJson(obj)

  test "round-trips StreamSignedTokenResponse":
    let obj = newStreamSignedTokenResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamSignedTokenResponse)) == openjson.toJson(obj)

  test "round-trips StreamVideoResponseCollection":
    let obj = newStreamVideoResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamVideoResponseCollection)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips StreamStorageUseResponse":
    let obj = newStreamStorageUseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamStorageUseResponse)) == openjson.toJson(obj)

  test "round-trips StreamDirectUploadRequest":
    let obj = newStreamDirectUploadRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDirectUploadRequest)) == openjson.toJson(obj)

suite "stream_videos endpoints":
  test "POST /accounts/{account_id}/stream":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStream("test", true)

  test "POST /accounts/{account_id}/stream/copy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamCopy("test", newStreamVideoCopyRequest())

  test "POST /accounts/{account_id}/stream/direct_upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamDirectUpload("test", newStreamDirectUploadRequest())

  test "GET /accounts/{account_id}/stream/storage-usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamStorageUsage("test", "test")

  test "GET /accounts/{account_id}/stream/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifier("test", "test")

  test "POST /accounts/{account_id}/stream/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamIdentifier("test", "test", newStreamVideoUpdate())

  test "DELETE /accounts/{account_id}/stream/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamIdentifier("test", "test")

  test "GET /accounts/{account_id}/stream/{identifier}/embed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierEmbed("test", "test")

  test "POST /accounts/{account_id}/stream/{identifier}/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamIdentifierToken("test", "test", newStreamSignedTokenRequest())

