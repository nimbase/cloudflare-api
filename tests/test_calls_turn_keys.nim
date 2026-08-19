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

suite "calls_turn_keys serialization":
  test "round-trips CallsTurnKeyResponseSingle":
    let obj = newCallsTurnKeyResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsTurnKeyResponseSingle)) == openjson.toJson(obj)

  test "round-trips CallsApiResponseCommonFailure":
    let obj = newCallsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CallsTurnKeySingleWithSecret":
    let obj = newCallsTurnKeySingleWithSecret()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsTurnKeySingleWithSecret)) == openjson.toJson(obj)

  test "round-trips CallsTurnKeyCollection":
    let obj = newCallsTurnKeyCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsTurnKeyCollection)) == openjson.toJson(obj)

  test "round-trips CallsTurnKeyEditableFields":
    let obj = newCallsTurnKeyEditableFields()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsTurnKeyEditableFields)) == openjson.toJson(obj)

suite "calls_turn_keys endpoints":
  test "GET /accounts/{account_id}/calls/turn_keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCallsTurnKeys("test")

  test "POST /accounts/{account_id}/calls/turn_keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCallsTurnKeys("test", newCallsTurnKeyEditableFields())

  test "GET /accounts/{account_id}/calls/turn_keys/{key_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCallsTurnKeysKeyId("test", "test")

  test "PUT /accounts/{account_id}/calls/turn_keys/{key_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCallsTurnKeysKeyId("test", "test", newCallsTurnKeyEditableFields())

  test "DELETE /accounts/{account_id}/calls/turn_keys/{key_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCallsTurnKeysKeyId("test", "test")

