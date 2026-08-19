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

suite "target_environments serialization":
  test "round-trips VulnScannerTargetEnvironment":
    let obj = newVulnScannerTargetEnvironment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerTargetEnvironment)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommon":
    let obj = newVulnScannerApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommonFailure":
    let obj = newVulnScannerApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCollection":
    let obj = newVulnScannerApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips VulnScannerPatchTargetEnvironmentRequest":
    let obj = newVulnScannerPatchTargetEnvironmentRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerPatchTargetEnvironmentRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerEmptyResponse":
    let obj = newVulnScannerEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerEmptyResponse)) == openjson.toJson(obj)

  test "round-trips VulnScannerUpdateTargetEnvironmentRequest":
    let obj = newVulnScannerUpdateTargetEnvironmentRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerUpdateTargetEnvironmentRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerCreateTargetEnvironmentRequest":
    let obj = newVulnScannerCreateTargetEnvironmentRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCreateTargetEnvironmentRequest)) == openjson.toJson(obj)

suite "target_environments endpoints":
  test "GET /accounts/{account_id}/vuln_scanner/target_environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerTargetEnvironments(1, 1)

  test "POST /accounts/{account_id}/vuln_scanner/target_environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVulnScannerTargetEnvironments(newVulnScannerCreateTargetEnvironmentRequest())

  test "GET /accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId()

  test "PUT /accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId(newVulnScannerUpdateTargetEnvironmentRequest())

  test "DELETE /accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId()

  test "PATCH /accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId(newVulnScannerPatchTargetEnvironmentRequest())

