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

suite "per_hostname_authenticated_origin_pull serialization":
  test "round-trips TlsCertificatesAndHostnamesCertificateResponseSingle4":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseSingle4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseSingle4)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificateResponseCollection4":
    let obj = newTlsCertificatesAndHostnamesCertificateResponseCollection4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificateResponseCollection4)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesHostnameAssocResponseCollection":
    let obj = newTlsCertificatesAndHostnamesHostnameAssocResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesHostnameAssocResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesHostnameAopSingleResponse":
    let obj = newTlsCertificatesAndHostnamesHostnameAopSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesHostnameAopSingleResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesHostnameAopResponseCollection":
    let obj = newTlsCertificatesAndHostnamesHostnameAopResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesHostnameAopResponseCollection)) == openjson.toJson(obj)

suite "per_hostname_authenticated_origin_pull endpoints":
  test "GET /zones/{zone_id}/origin_tls_client_auth/hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthHostnames("test", 1.0, 1.0, {})

  test "GET /zones/{zone_id}/origin_tls_client_auth/hostnames/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthHostnamesCertificates("test")

  test "GET /zones/{zone_id}/origin_tls_client_auth/hostnames/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthHostnamesCertificatesCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/origin_tls_client_auth/hostnames/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdOriginTlsClientAuthHostnamesCertificatesCertificateId("test", "test")

  test "GET /zones/{zone_id}/origin_tls_client_auth/hostnames/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdOriginTlsClientAuthHostnamesHostname("test", "test")

