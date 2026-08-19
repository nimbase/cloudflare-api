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

suite "magic_network_monitoring_configuration serialization":
  test "round-trips MagicVisibilityMnmApiResponseCommonFailure":
    let obj = newMagicVisibilityMnmApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmMnmConfigSingleResponse":
    let obj = newMagicVisibilityMnmMnmConfigSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmConfigSingleResponse)) == openjson.toJson(obj)

suite "magic_network_monitoring_configuration endpoints":
  test "GET /accounts/{account_id}/mnm/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMnmConfig("test")

  test "DELETE /accounts/{account_id}/mnm/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMnmConfig("test")

  test "GET /accounts/{account_id}/mnm/config/full":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMnmConfigFull("test")

