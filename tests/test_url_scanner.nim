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

suite "url_scanner serialization":
  test "round-trips GetAccountsAccountIdUrlscannerV2HarScanIdResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerV2HarScanIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerV2HarScanIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdUrlscannerV2ResultScanIdResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerV2ResultScanIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerV2ResultScanIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdUrlscannerV2ScanResponse":
    let obj = cloudflare.PostAccountsAccountIdUrlscannerV2ScanResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdUrlscannerV2ScanResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdUrlscannerV2SearchResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerV2SearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerV2SearchResponse)) == openjson.toJson(obj)

suite "url_scanner endpoints":
  test "POST /accounts/{account_id}/urlscanner/v2/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdUrlscannerV2Bulk("test")

  test "GET /accounts/{account_id}/urlscanner/v2/dom/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2DomScanId("test", "test")

  test "GET /accounts/{account_id}/urlscanner/v2/har/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2HarScanId("test", "test")

  test "GET /accounts/{account_id}/urlscanner/v2/responses/{response_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2ResponsesResponseId("test", "test")

  test "GET /accounts/{account_id}/urlscanner/v2/result/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2ResultScanId("test", "test")

  test "GET /accounts/{account_id}/urlscanner/v2/screenshots/{scan_id}.png":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2ScreenshotsScanIdPng("test", "test", {})

  test "GET /accounts/{account_id}/urlscanner/v2/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerV2Search("test", 1, "test")

