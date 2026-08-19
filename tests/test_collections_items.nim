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

suite "collections_items serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse)) == openjson.toJson(obj)

suite "collections_items endpoints":
  test "POST /accounts/{account_id}/cloudforce-one/v2/collections/{collection_id}/items":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItems("test", "test")

