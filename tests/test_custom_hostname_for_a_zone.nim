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

suite "custom_hostname_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesCustomMetadata":
    let obj = newTlsCertificatesAndHostnamesCustomMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomMetadata)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesSslpost":
    let obj = newTlsCertificatesAndHostnamesSslpost()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesSslpost)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomHostnameResponseCollection":
    let obj = newTlsCertificatesAndHostnamesCustomHostnameResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomHostnameResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomHostnameApiResponseFailure":
    let obj = newTlsCertificatesAndHostnamesCustomHostnameApiResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomHostnameApiResponseFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomHostnameResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCustomHostnameResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomHostnameResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCertAndKey":
    let obj = newTlsCertificatesAndHostnamesCustomCertAndKey()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCertAndKey)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomHostnameQuotaResponse":
    let obj = newTlsCertificatesAndHostnamesCustomHostnameQuotaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomHostnameQuotaResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse)) == openjson.toJson(obj)

suite "custom_hostname_for_a_zone endpoints":
  test "GET /zones/{zone_id}/custom_hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomHostnames("test", "test", "test", "test", "test", "test", 1.0, 1.0, {}, {}, {}, {}, {}, true, "test", {})

  test "GET /zones/{zone_id}/custom_hostnames/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomHostnamesQuota("test")

  test "GET /zones/{zone_id}/custom_hostnames/{custom_hostname_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomHostnamesCustomHostnameId("test", "test")

  test "DELETE /zones/{zone_id}/custom_hostnames/{custom_hostname_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCustomHostnamesCustomHostnameId("test", "test")

  test "PUT /zones/{zone_id}/custom_hostnames/{custom_hostname_id}/certificate_pack/{certificate_pack_id}/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateId("test", "test", "test", "test", newTlsCertificatesAndHostnamesCustomCertAndKey())

  test "DELETE /zones/{zone_id}/custom_hostnames/{custom_hostname_id}/certificate_pack/{certificate_pack_id}/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateId("test", "test", "test", "test")

