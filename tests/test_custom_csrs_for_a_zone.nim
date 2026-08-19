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

suite "custom_csrs_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseCollection":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseIdOnly":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseIdOnly()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCustomCsrResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomCsrCreateRequest":
    let obj = newTlsCertificatesAndHostnamesCustomCsrCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomCsrCreateRequest)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_csrs_for_a_zone endpoints":
  test "GET /zones/{zone_id}/custom_csrs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomCsrs("test", 1.0, 1.0)

  test "POST /zones/{zone_id}/custom_csrs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdCustomCsrs("test", newTlsCertificatesAndHostnamesCustomCsrCreateRequest())

  test "GET /zones/{zone_id}/custom_csrs/{custom_csr_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomCsrsCustomCsrId("test", "test")

  test "DELETE /zones/{zone_id}/custom_csrs/{custom_csr_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCustomCsrsCustomCsrId("test", "test")

