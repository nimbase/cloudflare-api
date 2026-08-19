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

suite "asn_intelligence serialization":
  test "round-trips IntelAsnComponentsSchemasResponse":
    let obj = newIntelAsnComponentsSchemasResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelAsnComponentsSchemasResponse)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdIntelAsnAsnSubnetsResponse":
    let obj = cloudflare.GetAccountsAccountIdIntelAsnAsnSubnetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdIntelAsnAsnSubnetsResponse)) == openjson.toJson(obj)

suite "asn_intelligence endpoints":
  test "GET /accounts/{account_id}/intel/asn/{asn}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelAsnAsn(1, "test")

  test "GET /accounts/{account_id}/intel/asn/{asn}/subnets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelAsnAsnSubnets(1, "test")

