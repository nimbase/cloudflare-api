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

suite "access_mtls_authentication serialization":
  test "round-trips AccessIdResponse3":
    let obj = newAccessIdResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse3)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection5":
    let obj = newAccessResponseCollection5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection5)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse6":
    let obj = newAccessSingleResponse6()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse6)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollectionHostnames":
    let obj = newAccessResponseCollectionHostnames()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollectionHostnames)) == openjson.toJson(obj)

  test "round-trips AccessSettings":
    let obj = newAccessSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSettings)) == openjson.toJson(obj)

suite "access_mtls_authentication endpoints":
  test "GET /accounts/{account_id}/access/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessCertificates("test", 1, 1)

  test "GET /accounts/{account_id}/access/certificates/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessCertificatesSettings("test")

  test "GET /accounts/{account_id}/access/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessCertificatesCertificateId("test", "test")

  test "DELETE /accounts/{account_id}/access/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessCertificatesCertificateId("test", "test")

