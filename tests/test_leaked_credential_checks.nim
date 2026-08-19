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

suite "leaked_credential_checks serialization":
  test "round-trips WafProductApiBundleResponseCustomDetectionCollection":
    let obj = newWafProductApiBundleResponseCustomDetectionCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseCustomDetectionCollection)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseStatus":
    let obj = newWafProductApiBundleResponseStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseStatus)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleStatus":
    let obj = newWafProductApiBundleStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleStatus)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleApiResponseCommonFailure":
    let obj = newWafProductApiBundleApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleCustomDetection":
    let obj = newWafProductApiBundleCustomDetection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleCustomDetection)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleApiResponseCommon":
    let obj = newWafProductApiBundleApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseCustomDetection":
    let obj = newWafProductApiBundleResponseCustomDetection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseCustomDetection)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleDetectionId":
    let obj = newWafProductApiBundleDetectionId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleDetectionId)) == openjson.toJson(obj)

suite "leaked_credential_checks endpoints":
  test "GET /zones/{zone_id}/leaked-credential-checks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLeakedCredentialChecks("test")

  test "POST /zones/{zone_id}/leaked-credential-checks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdLeakedCredentialChecks("test", newWafProductApiBundleStatus())

  test "GET /zones/{zone_id}/leaked-credential-checks/detections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLeakedCredentialChecksDetections("test")

  test "POST /zones/{zone_id}/leaked-credential-checks/detections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdLeakedCredentialChecksDetections("test", newWafProductApiBundleCustomDetection())

  test "GET /zones/{zone_id}/leaked-credential-checks/detections/{detection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLeakedCredentialChecksDetectionsDetectionId("test", newWafProductApiBundleDetectionId())

  test "PUT /zones/{zone_id}/leaked-credential-checks/detections/{detection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdLeakedCredentialChecksDetectionsDetectionId("test", newWafProductApiBundleDetectionId(), newWafProductApiBundleCustomDetection())

  test "DELETE /zones/{zone_id}/leaked-credential-checks/detections/{detection_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdLeakedCredentialChecksDetectionsDetectionId("test", newWafProductApiBundleDetectionId())

