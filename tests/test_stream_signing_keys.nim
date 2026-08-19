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

suite "stream_signing_keys serialization":
  test "round-trips StreamKeyGenerationResponse":
    let obj = newStreamKeyGenerationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamKeyGenerationResponse)) == openjson.toJson(obj)

  test "round-trips StreamKeyResponseCollection":
    let obj = newStreamKeyResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamKeyResponseCollection)) == openjson.toJson(obj)

  test "round-trips StreamDeletedResponse":
    let obj = newStreamDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDeletedResponse)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_signing_keys endpoints":
  test "GET /accounts/{account_id}/stream/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamKeys("test")

  test "POST /accounts/{account_id}/stream/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamKeys("test")

  test "DELETE /accounts/{account_id}/stream/keys/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamKeysIdentifier("test", "test")

