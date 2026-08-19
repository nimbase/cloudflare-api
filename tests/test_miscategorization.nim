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

suite "miscategorization serialization":
  test "round-trips IntelMiscategorization":
    let obj = newIntelMiscategorization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelMiscategorization)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseSingle":
    let obj = newIntelApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "miscategorization endpoints":
  test "POST /accounts/{account_id}/intel/miscategorization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIntelMiscategorization("test", newIntelMiscategorization())

