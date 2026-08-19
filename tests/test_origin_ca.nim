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

suite "origin_ca serialization":
  test "round-trips TlsCertificatesAndHostnamesCertificateResponseCollection2":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseCollection2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseCollection2)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseSingle2":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseSingle2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseSingle2)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateRevokeResponse":
    let obj = newTlsCertificatesAndHostnamesCertificateRevokeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateRevokeResponse)) == openjson.toJson(obj)

suite "origin_ca endpoints":
  test "GET /certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCertificates("test", 1.0, 1.0, 1, 1)

  test "GET /certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCertificatesCertificateId("test")

  test "DELETE /certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteCertificatesCertificateId("test")

