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

suite "browser_extension_config serialization":
  test "round-trips BrexUpdateConfigRequest":
    let obj = newBrexUpdateConfigRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexUpdateConfigRequest)) == openjson.toJson(obj)

  test "round-trips BrexDeleteResponse":
    let obj = newBrexDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexDeleteResponse)) == openjson.toJson(obj)

  test "round-trips BrexCreateConfigRequest":
    let obj = newBrexCreateConfigRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexCreateConfigRequest)) == openjson.toJson(obj)

  test "round-trips BrexConfigResponse":
    let obj = newBrexConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexConfigResponse)) == openjson.toJson(obj)

  test "round-trips BrexErrorResponse":
    let obj = newBrexErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrexErrorResponse)) == openjson.toJson(obj)

suite "browser_extension_config endpoints":
  test "GET /accounts/{account_id}/browser-extension/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserExtensionConfig()

  test "POST /accounts/{account_id}/browser-extension/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrowserExtensionConfig(newBrexCreateConfigRequest())

  test "PUT /accounts/{account_id}/browser-extension/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBrowserExtensionConfig(newBrexUpdateConfigRequest())

  test "DELETE /accounts/{account_id}/browser-extension/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrowserExtensionConfig()

