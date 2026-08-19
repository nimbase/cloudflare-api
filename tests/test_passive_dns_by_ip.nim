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

suite "passive_dns_by_ip serialization":
  test "round-trips IntelStartEndParams":
    let obj = newIntelStartEndParams()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelStartEndParams)) == openjson.toJson(obj)

  test "round-trips IntelComponentsSchemasSingleResponse":
    let obj = newIntelComponentsSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelComponentsSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips IntelApiResponseCommonFailure":
    let obj = newIntelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "passive_dns_by_ip endpoints":
  test "GET /accounts/{account_id}/intel/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelDns("test", newIntelStartEndParams(), "test", 1.0, 1.0)

