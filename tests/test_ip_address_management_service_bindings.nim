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

suite "ip_address_management_service_bindings serialization":
  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingServiceBinding":
    let obj = newAddressingServiceBinding()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingServiceBinding)) == openjson.toJson(obj)

  test "round-trips AddressingCreateBindingRequest":
    let obj = newAddressingCreateBindingRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingCreateBindingRequest)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCommon":
    let obj = newAddressingApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommon)) == openjson.toJson(obj)

suite "ip_address_management_service_bindings endpoints":
  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/bindings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdBindings("test", "test")

  test "POST /accounts/{account_id}/addressing/prefixes/{prefix_id}/bindings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAddressingPrefixesPrefixIdBindings("test", "test", newAddressingCreateBindingRequest())

  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/bindings/{binding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdBindingsBindingId("test", "test", "test")

  test "DELETE /accounts/{account_id}/addressing/prefixes/{prefix_id}/bindings/{binding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingPrefixesPrefixIdBindingsBindingId("test", "test", "test")

  test "GET /accounts/{account_id}/addressing/services":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingServices("test")

