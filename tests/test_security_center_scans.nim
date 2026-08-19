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

suite "security_center_scans serialization":
  test "round-trips SecurityCenterNewScanResponse":
    let obj = newSecurityCenterNewScanResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterNewScanResponse)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseCommonFailure":
    let obj = newSecurityCenterApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseCommon":
    let obj = newSecurityCenterApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SecurityCenterScansListResponse":
    let obj = newSecurityCenterScansListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterScansListResponse)) == openjson.toJson(obj)

  test "round-trips SecurityCenterNewScanRequest":
    let obj = newSecurityCenterNewScanRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterNewScanRequest)) == openjson.toJson(obj)

suite "security_center_scans endpoints":
  test "GET /accounts/{account_id}/security-center/insights/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecurityCenterInsightsScans("test")

  test "POST /accounts/{account_id}/security-center/insights/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSecurityCenterInsightsScans("test", newSecurityCenterNewScanRequest())

  test "GET /zones/{zone_id}/security-center/insights/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecurityCenterInsightsScans("test")

  test "POST /zones/{zone_id}/security-center/insights/scans":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecurityCenterInsightsScans("test", newSecurityCenterNewScanRequest())

