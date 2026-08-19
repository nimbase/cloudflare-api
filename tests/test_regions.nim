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

suite "regions serialization":
  test "round-trips DlsRegionPublicPaginatedListResponse":
    let obj = newDlsRegionPublicPaginatedListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsRegionPublicPaginatedListResponse)) == openjson.toJson(obj)

  test "round-trips DlsFetchPublicRegionResponse":
    let obj = newDlsFetchPublicRegionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsFetchPublicRegionResponse)) == openjson.toJson(obj)

  test "round-trips DlsBadResponse":
    let obj = newDlsBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsBadResponse)) == openjson.toJson(obj)

suite "regions endpoints":
  test "GET /accounts/{account_id}/dls/regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlsRegions("test", "test", 1, {})

  test "GET /accounts/{account_id}/dls/regions/{region_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlsRegionsRegionId("test", "test")

