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

suite "certificate_packs serialization":
  test "round-trips TlsCertificatesAndHostnamesDeleteAdvancedCertificatePackResponseSingle":
    let obj = newTlsCertificatesAndHostnamesDeleteAdvancedCertificatePackResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesDeleteAdvancedCertificatePackResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificatePackQuotaResponse":
    let obj = newTlsCertificatesAndHostnamesCertificatePackQuotaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificatePackQuotaResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle":
    let obj = newTlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificatePackResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCertificatePackResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificatePackResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCertificatePackResponseCollection":
    let obj = newTlsCertificatesAndHostnamesCertificatePackResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCertificatePackResponseCollection)) == openjson.toJson(obj)

suite "certificate_packs endpoints":
  test "GET /zones/{zone_id}/ssl/certificate_packs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslCertificatePacks("test", 1.0, 1.0, {}, {})

  test "GET /zones/{zone_id}/ssl/certificate_packs/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslCertificatePacksQuota("test")

  test "GET /zones/{zone_id}/ssl/certificate_packs/{certificate_pack_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslCertificatePacksCertificatePackId("test", "test")

  test "DELETE /zones/{zone_id}/ssl/certificate_packs/{certificate_pack_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSslCertificatePacksCertificatePackId("test", "test")

