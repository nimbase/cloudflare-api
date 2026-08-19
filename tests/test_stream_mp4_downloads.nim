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

suite "stream_mp4_downloads serialization":
  test "round-trips StreamDownloadsResponse":
    let obj = newStreamDownloadsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDownloadsResponse)) == openjson.toJson(obj)

  test "round-trips StreamDeletedResponse":
    let obj = newStreamDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDeletedResponse)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_mp4_downloads endpoints":
  test "GET /accounts/{account_id}/stream/{identifier}/downloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierDownloads("test", "test")

  test "POST /accounts/{account_id}/stream/{identifier}/downloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamIdentifierDownloads("test", "test")

  test "DELETE /accounts/{account_id}/stream/{identifier}/downloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamIdentifierDownloads("test", "test")

