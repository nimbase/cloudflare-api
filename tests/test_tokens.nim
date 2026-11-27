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

suite "tokens serialization":
  test "round-trips NetworkqualityErrorEnvelope":
    let obj = newNetworkqualityErrorEnvelope()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NetworkqualityErrorEnvelope)) == openjson.toJson(obj)

  test "round-trips NetworkqualityTokenRequest":
    let obj = newNetworkqualityTokenRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NetworkqualityTokenRequest)) == openjson.toJson(obj)

  test "round-trips NetworkqualityTokenSuccess":
    let obj = newNetworkqualityTokenSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NetworkqualityTokenSuccess)) == openjson.toJson(obj)

suite "tokens endpoints":
  test "POST /accounts/{account_id}/networkquality/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdNetworkqualityToken("test", newNetworkqualityTokenRequest())

