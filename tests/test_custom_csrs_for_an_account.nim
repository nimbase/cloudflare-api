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

suite "custom_csrs_for_an_account serialization":
  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseSingle2":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseSingle2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseSingle2)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseIdOnly":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseIdOnly()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseCollection2":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseCollection2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseCollection2)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrCreateRequest2":
    let obj = newTlsCertificatesAndHostnamesCustomCsrCreateRequest2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrCreateRequest2)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_csrs_for_an_account endpoints":
  test "GET /accounts/{account_id}/custom_csrs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCustomCsrs("test", 1.0, 1.0, {}, {})

  test "POST /accounts/{account_id}/custom_csrs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCustomCsrs("test", newTlsCertificatesAndHostnamesCustomCsrCreateRequest2())

  test "GET /accounts/{account_id}/custom_csrs/{custom_csr_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCustomCsrsCustomCsrId("test", "test")

  test "DELETE /accounts/{account_id}/custom_csrs/{custom_csr_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCustomCsrsCustomCsrId("test", "test")

