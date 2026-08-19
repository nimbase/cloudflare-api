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

suite "custom_origin_trust_store serialization":
  test "round-trips TlsCertificatesAndHostnamesCustomTrustStoreResponseIdOnly":
    let obj = newTlsCertificatesAndHostnamesCustomTrustStoreResponseIdOnly()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomTrustStoreResponseIdOnly)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomTrustStoreResponseCollection":
    let obj = newTlsCertificatesAndHostnamesCustomTrustStoreResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomTrustStoreResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCustomTrustStoreResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_origin_trust_store endpoints":
  test "GET /zones/{zone_id}/acm/custom_trust_store":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAcmCustomTrustStore("test", 1.0, 1.0, 1, 1)

  test "GET /zones/{zone_id}/acm/custom_trust_store/{custom_origin_trust_store_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAcmCustomTrustStoreCustomOriginTrustStoreId("test", "test")

  test "DELETE /zones/{zone_id}/acm/custom_trust_store/{custom_origin_trust_store_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAcmCustomTrustStoreCustomOriginTrustStoreId("test", "test")

