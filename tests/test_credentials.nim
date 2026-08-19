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

suite "credentials serialization":
  test "round-trips VulnScannerPatchCredentialRequest":
    let obj = newVulnScannerPatchCredentialRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerPatchCredentialRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerCredential":
    let obj = newVulnScannerCredential()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCredential)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommon":
    let obj = newVulnScannerApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCommonFailure":
    let obj = newVulnScannerApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips VulnScannerApiResponseCollection":
    let obj = newVulnScannerApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips VulnScannerEmptyResponse":
    let obj = newVulnScannerEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerEmptyResponse)) == openjson.toJson(obj)

  test "round-trips VulnScannerUpdateCredentialRequest":
    let obj = newVulnScannerUpdateCredentialRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerUpdateCredentialRequest)) == openjson.toJson(obj)

  test "round-trips VulnScannerCreateCredentialRequest":
    let obj = newVulnScannerCreateCredentialRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VulnScannerCreateCredentialRequest)) == openjson.toJson(obj)

suite "credentials endpoints":
  test "GET /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentials(1, 1)

  test "POST /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentials(newVulnScannerCreateCredentialRequest())

  test "GET /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId()

  test "PUT /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId(newVulnScannerUpdateCredentialRequest())

  test "DELETE /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId()

  test "PATCH /accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId(newVulnScannerPatchCredentialRequest())

