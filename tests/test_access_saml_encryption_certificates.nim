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

suite "access_saml_encryption_certificates serialization":
  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessCertificateSetResponse":
    let obj = newAccessCertificateSetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCertificateSetResponse)) == openjson.toJson(obj)

  test "round-trips AccessCertificateSetListResponse":
    let obj = newAccessCertificateSetListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCertificateSetListResponse)) == openjson.toJson(obj)

suite "access_saml_encryption_certificates endpoints":
  test "GET /accounts/{account_id}/access/saml_certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessSamlCertificates("test", 1, 1, "test")

  test "GET /accounts/{account_id}/access/saml_certificates/{saml_cert_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessSamlCertificatesSamlCertSetId("test", "test")

  test "GET /accounts/{account_id}/access/saml_certificates/{saml_cert_set_id}/pem":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessSamlCertificatesSamlCertSetIdPem("test", "test")

  test "POST /accounts/{account_id}/access/saml_certificates/{saml_cert_set_id}/rotate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessSamlCertificatesSamlCertSetIdRotate("test", "test")

