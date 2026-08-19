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

suite "credential_sets serialization":
  test "round-trips VulnScannerCredentialSet":
    let obj = newVulnScannerCredentialSet()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCredentialSet)) == openjson.toJson(obj)

  test "round-trips VulnScannerCreateCredentialSetRequest":
    let obj = newVulnScannerCreateCredentialSetRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCreateCredentialSetRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommon":
    let obj = newVulnScannerApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VulnScannerUpdateCredentialSetRequest":
    let obj = newVulnScannerUpdateCredentialSetRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerUpdateCredentialSetRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommonFailure":
    let obj = newVulnScannerApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips VulnScannerPatchCredentialSetRequest":
    let obj = newVulnScannerPatchCredentialSetRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerPatchCredentialSetRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCollection":
    let obj = newVulnScannerApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips VulnScannerEmptyResponse":
    let obj = newVulnScannerEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerEmptyResponse)) == openjson.toJson(obj)

suite "credential_sets endpoints":
  test "GET /accounts/{account_id}/vuln_scanner/credential_sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerCredentialSets(1, 1)

  test "POST /accounts/{account_id}/vuln_scanner/credential_sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVulnScannerCredentialSets(newVulnScannerCreateCredentialSetRequest())

  test "GET /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerCredentialSetsCredentialSetId()

  test "PUT /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdVulnScannerCredentialSetsCredentialSetId(newVulnScannerUpdateCredentialSetRequest())

  test "DELETE /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVulnScannerCredentialSetsCredentialSetId()

  test "PATCH /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdVulnScannerCredentialSetsCredentialSetId(newVulnScannerPatchCredentialSetRequest())

