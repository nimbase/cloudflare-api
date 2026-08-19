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

suite "settings serialization":
  test "round-trips NscSettings":
    let obj = newNscSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscSettings)) == openjson.toJson(obj)

  test "round-trips NscSettingsRequest":
    let obj = newNscSettingsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscSettingsRequest)) == openjson.toJson(obj)

suite "settings endpoints":
  test "GET /accounts/{account_id}/cni/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniSettings("test")

  test "PUT /accounts/{account_id}/cni/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCniSettings("test", newNscSettingsRequest())

