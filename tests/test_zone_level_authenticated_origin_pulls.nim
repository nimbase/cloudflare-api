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

suite "zone_level_authenticated_origin_pulls serialization":
  test "round-trips TlsCertificatesAndHostnamesCertificateResponseCollection3":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseCollection3)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseSingle3":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseSingle3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseSingle3)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesEnabledResponse":
    let obj = newTlsCertificatesAndHostnamesEnabledResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesEnabledResponse)) == openjson.toJson(obj)

suite "zone_level_authenticated_origin_pulls endpoints":
  test "GET /zones/{zone_id}/origin_tls_client_auth":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuth("test")

  test "GET /zones/{zone_id}/origin_tls_client_auth/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthSettings("test")

  test "GET /zones/{zone_id}/origin_tls_client_auth/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/origin_tls_client_auth/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdOriginTlsClientAuthCertificateId("test", "test")

