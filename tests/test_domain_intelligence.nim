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

suite "domain_intelligence serialization":
  test "round-trips IntelCollectionResponse":
    let obj = newIntelCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelCollectionResponse)) == openjson.toJson(obj)

  test "round-trips IntelSingleResponse":
    let obj = newIntelSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSingleResponse)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "domain_intelligence endpoints":
  test "GET /accounts/{account_id}/intel/domain":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelDomain("test", "test", true, true)

  test "GET /accounts/{account_id}/intel/domain/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelDomainBulk("test", @["test"], true, true)

