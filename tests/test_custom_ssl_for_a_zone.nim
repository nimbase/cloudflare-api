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

suite "custom_ssl_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesGeoRestrictions":
    let obj = newTlsCertificatesAndHostnamesGeoRestrictions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesGeoRestrictions)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseIdOnly":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseIdOnly()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseIdOnly)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseCollection":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_ssl_for_a_zone endpoints":
  test "GET /zones/{zone_id}/custom_certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomCertificates("test", 1.0, 1.0, {}, {})

  test "GET /zones/{zone_id}/custom_certificates/{custom_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomCertificatesCustomCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/custom_certificates/{custom_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCustomCertificatesCustomCertificateId("test", "test")

