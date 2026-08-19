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

suite "ip_list serialization":
  test "round-trips IntelComponentsSchemasResponse":
    let obj = newIntelComponentsSchemasResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelComponentsSchemasResponse)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "ip_list endpoints":
  test "GET /accounts/{account_id}/intel/ip-lists":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIpLists("test")

