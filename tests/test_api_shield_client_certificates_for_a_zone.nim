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

suite "api_shield_client_certificates_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesHostnameAssociationsResponse":
    let obj = newTlsCertificatesAndHostnamesHostnameAssociationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesHostnameAssociationsResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesClientCertificateResponseCollection":
    let obj = newTlsCertificatesAndHostnamesClientCertificateResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesClientCertificateResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesHostnameAssociation":
    let obj = newTlsCertificatesAndHostnamesHostnameAssociation()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesHostnameAssociation)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesClientCertificateResponseSingle":
    let obj = newTlsCertificatesAndHostnamesClientCertificateResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesClientCertificateResponseSingle)) == openjson.toJson(obj)

suite "api_shield_client_certificates_for_a_zone endpoints":
  test "GET /zones/{zone_id}/certificate_authorities/hostname_associations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCertificateAuthoritiesHostnameAssociations("test", "test")

  test "PUT /zones/{zone_id}/certificate_authorities/hostname_associations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdCertificateAuthoritiesHostnameAssociations("test", newTlsCertificatesAndHostnamesHostnameAssociation())

  test "GET /zones/{zone_id}/client_certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdClientCertificates("test", {}, 1.0, 1.0, 1, 1)

  test "GET /zones/{zone_id}/client_certificates/{client_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdClientCertificatesClientCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/client_certificates/{client_certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdClientCertificatesClientCertificateId("test", "test")

