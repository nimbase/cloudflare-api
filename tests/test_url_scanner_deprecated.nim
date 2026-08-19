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

suite "url_scanner_deprecated serialization":
  test "round-trips GetAccountsAccountIdUrlscannerScanResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerScanResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerScanResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdUrlscannerScanResponse":
    let obj = cloudflare.PostAccountsAccountIdUrlscannerScanResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdUrlscannerScanResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdUrlscannerScanScanIdResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerScanScanIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerScanScanIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdUrlscannerScanScanIdHarResponse":
    let obj = cloudflare.GetAccountsAccountIdUrlscannerScanScanIdHarResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdUrlscannerScanScanIdHarResponse)) == openjson.toJson(obj)

suite "url_scanner_deprecated endpoints":
  test "GET /accounts/{account_id}/urlscanner/response/{response_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerResponseResponseId("test", "test")

  test "GET /accounts/{account_id}/urlscanner/scan":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerScan("test", "test", 1, "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", "test", true, true)

  test "GET /accounts/{account_id}/urlscanner/scan/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerScanScanId("test", "test", true)

  test "GET /accounts/{account_id}/urlscanner/scan/{scan_id}/har":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerScanScanIdHar("test", "test")

  test "GET /accounts/{account_id}/urlscanner/scan/{scan_id}/screenshot":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdUrlscannerScanScanIdScreenshot("test", "test", {})

