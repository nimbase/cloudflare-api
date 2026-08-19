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

suite "whois_record serialization":
  test "round-trips CloudforceOneWhoisApiResponseCommonFailure":
    let obj = newCloudforceOneWhoisApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneWhoisApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CloudforceOneWhoisSchemasSingleResponse":
    let obj = newCloudforceOneWhoisSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneWhoisSchemasSingleResponse)) == openjson.toJson(obj)

suite "whois_record endpoints":
  test "GET /accounts/{account_id}/intel/whois":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelWhois("test", "test")

