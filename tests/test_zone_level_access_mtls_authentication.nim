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

suite "zone_level_access_mtls_authentication serialization":
  test "round-trips AccessResponseCollectionHostnames2":
    let obj = newAccessResponseCollectionHostnames2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollectionHostnames2)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse3":
    let obj = newAccessIdResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse3)) == openjson.toJson(obj)

  test "round-trips AccessSettings2":
    let obj = newAccessSettings2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSettings2)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse20":
    let obj = newAccessSingleResponse20()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse20)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection21":
    let obj = newAccessResponseCollection21()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection21)) == openjson.toJson(obj)

suite "zone_level_access_mtls_authentication endpoints":
  test "GET /zones/{zone_id}/access/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessCertificates("test")

  test "GET /zones/{zone_id}/access/certificates/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessCertificatesSettings("test")

  test "GET /zones/{zone_id}/access/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessCertificatesCertificateId("test", "test")

  test "DELETE /zones/{zone_id}/access/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessCertificatesCertificateId("test", "test")

