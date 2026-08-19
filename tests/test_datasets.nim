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

suite "datasets serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse)) == openjson.toJson(obj)

suite "datasets endpoints":
  test "POST /accounts/{account_id}/cloudforce-one/events/datasets/populate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneEventsDatasetsPopulate("test")

