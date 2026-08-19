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

suite "ssl_verification serialization":
  test "round-trips TlsCertificatesAndHostnamesValidationMethod3":
    let obj = newTlsCertificatesAndHostnamesValidationMethod3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesValidationMethod3)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesSslValidationMethodResponseCollection":
    let obj = newTlsCertificatesAndHostnamesSslValidationMethodResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesSslValidationMethodResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesSslVerificationResponseCollection":
    let obj = newTlsCertificatesAndHostnamesSslVerificationResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesSslVerificationResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "ssl_verification endpoints":
  test "GET /zones/{zone_id}/ssl/verification":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslVerification("test", {})

  test "PATCH /zones/{zone_id}/ssl/verification/{certificate_pack_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSslVerificationCertificatePackId("test", "test", newTlsCertificatesAndHostnamesValidationMethod3())

