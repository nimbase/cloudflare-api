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

suite "browser_extension_inventories serialization":
  test "round-trips BrexInventoriesResponse":
    let obj = newBrexInventoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexInventoriesResponse)) == openjson.toJson(obj)

  test "round-trips BrexInventoryResponse":
    let obj = newBrexInventoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexInventoryResponse)) == openjson.toJson(obj)

  test "round-trips BrexErrorResponse":
    let obj = newBrexErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexErrorResponse)) == openjson.toJson(obj)

suite "browser_extension_inventories endpoints":
  test "GET /accounts/{account_id}/browser-extension/config/inventories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserExtensionConfigInventories("test", 1)

  test "GET /accounts/{account_id}/browser-extension/config/inventories/{registration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserExtensionConfigInventoriesRegistrationId()

