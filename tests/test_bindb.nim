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

suite "bindb serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneBinaryResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneBinaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneBinaryResponse)) == openjson.toJson(obj)

suite "bindb endpoints":
  test "POST /accounts/{account_id}/cloudforce-one/binary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneBinary(1.0)

  test "GET /accounts/{account_id}/cloudforce-one/binary/{hash}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneBinaryHash(1.0, "test")

