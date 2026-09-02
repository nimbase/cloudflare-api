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

suite "scans serialization":
  test "round-trips VulnScannerDeleteScanResponse":
    let obj = newVulnScannerDeleteScanResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerDeleteScanResponse)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommon":
    let obj = newVulnScannerApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips CloudforceOnePortScanApiScanConfig":
    let obj = newCloudforceOnePortScanApiScanConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOnePortScanApiScanConfig)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommonFailure":
    let obj = newVulnScannerApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCollection":
    let obj = newVulnScannerApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips CloudforceOnePortScanApiApiResponseCommon":
    let obj = newCloudforceOnePortScanApiApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOnePortScanApiApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VulnScannerScan":
    let obj = newVulnScannerScan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerScan)) == openjson.toJson(obj)

  test "round-trips CloudforceOnePortScanApiPort":
    let obj = newCloudforceOnePortScanApiPort()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOnePortScanApiPort)) == openjson.toJson(obj)

  test "round-trips VulnScannerCreateScanRequest":
    let obj = newVulnScannerCreateScanRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCreateScanRequest)) == openjson.toJson(obj)

  test "round-trips CloudforceOnePortScanApiApiResponseCommonFailure":
    let obj = newCloudforceOnePortScanApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOnePortScanApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneBannerConfigIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneBannerConfigIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneBannerConfigIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse)) == openjson.toJson(obj)

suite "scans endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/banner/{config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneBannerConfigId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/scans/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneScansConfig("test")

  test "DELETE /accounts/{account_id}/cloudforce-one/scans/config/{config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneScansConfigConfigId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/scans/results/{config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneScansResultsConfigId("test", "test")

  test "GET /accounts/{account_id}/vuln_scanner/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerScans(1, 1)

  test "POST /accounts/{account_id}/vuln_scanner/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVulnScannerScans(newVulnScannerCreateScanRequest())

  test "GET /accounts/{account_id}/vuln_scanner/scans/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerScansScanId()

  test "DELETE /accounts/{account_id}/vuln_scanner/scans/{scan_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVulnScannerScansScanId()

