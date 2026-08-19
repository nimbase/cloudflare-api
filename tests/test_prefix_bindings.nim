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

suite "prefix_bindings serialization":
  test "round-trips DlsPrefixBindingPaginatedListResponse":
    let obj = newDlsPrefixBindingPaginatedListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsPrefixBindingPaginatedListResponse)) == openjson.toJson(obj)

  test "round-trips DlsGoodResponse":
    let obj = newDlsGoodResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsGoodResponse)) == openjson.toJson(obj)

  test "round-trips DlsUpdatePrefixBindingInput":
    let obj = newDlsUpdatePrefixBindingInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsUpdatePrefixBindingInput)) == openjson.toJson(obj)

  test "round-trips DlsPrefixBindingResponse":
    let obj = newDlsPrefixBindingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsPrefixBindingResponse)) == openjson.toJson(obj)

  test "round-trips DlsCreatePrefixBindingInput":
    let obj = newDlsCreatePrefixBindingInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsCreatePrefixBindingInput)) == openjson.toJson(obj)

  test "round-trips DlsBadResponse":
    let obj = newDlsBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsBadResponse)) == openjson.toJson(obj)

suite "prefix_bindings endpoints":
  test "GET /accounts/{account_id}/dls/regional_services/prefix_bindings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlsRegionalServicesPrefixBindings("test", "test", 1)

  test "POST /accounts/{account_id}/dls/regional_services/prefix_bindings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlsRegionalServicesPrefixBindings("test", newDlsCreatePrefixBindingInput())

  test "GET /accounts/{account_id}/dls/regional_services/prefix_bindings/{binding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId("test", "test")

  test "DELETE /accounts/{account_id}/dls/regional_services/prefix_bindings/{binding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId("test", "test")

  test "PATCH /accounts/{account_id}/dls/regional_services/prefix_bindings/{binding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId("test", "test", newDlsUpdatePrefixBindingInput())

