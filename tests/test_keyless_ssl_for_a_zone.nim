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

suite "keyless_ssl_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesKeylessTunnel":
    let obj = newTlsCertificatesAndHostnamesKeylessTunnel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesKeylessTunnel)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesKeylessResponseCollection":
    let obj = newTlsCertificatesAndHostnamesKeylessResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesKeylessResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesKeylessResponseSingleId":
    let obj = newTlsCertificatesAndHostnamesKeylessResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesKeylessResponseSingleId)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesKeylessResponseSingle":
    let obj = newTlsCertificatesAndHostnamesKeylessResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesKeylessResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "keyless_ssl_for_a_zone endpoints":
  test "GET /zones/{zone_id}/keyless_certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdKeylessCertificates("test")

  test "GET /zones/{zone_id}/keyless_certificates/{keyless_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdKeylessCertificatesKeylessCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/keyless_certificates/{keyless_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdKeylessCertificatesKeylessCertificateId("test", "test")

