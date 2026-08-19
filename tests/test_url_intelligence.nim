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

suite "url_intelligence serialization":
  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IntelUrlIntelligenceSingleResponse":
    let obj = newIntelUrlIntelligenceSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelUrlIntelligenceSingleResponse)) == openjson.toJson(obj)

suite "url_intelligence endpoints":
  test "GET /accounts/{account_id}/intel/url":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelUrl("test", "test")

