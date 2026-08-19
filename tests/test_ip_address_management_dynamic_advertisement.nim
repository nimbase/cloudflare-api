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

suite "ip_address_management_dynamic_advertisement serialization":
  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingAdvertisedResponse":
    let obj = newAddressingAdvertisedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingAdvertisedResponse)) == openjson.toJson(obj)

suite "ip_address_management_dynamic_advertisement endpoints":
  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/bgp/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdBgpStatus("test", "test")

