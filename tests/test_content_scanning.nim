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

suite "content_scanning serialization":
  test "round-trips WafProductApiBundleCustomScanId":
    let obj = newWafProductApiBundleCustomScanId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleCustomScanId)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleApiResponseCommonFailure2":
    let obj = newWafProductApiBundleApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleApiResponseCommon2":
    let obj = newWafProductApiBundleApiResponseCommon2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleApiResponseCommon2)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseCustomScanCollection":
    let obj = newWafProductApiBundleResponseCustomScanCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseCustomScanCollection)) == openjson.toJson(obj)

  test "round-trips WafProductApiBundleResponseStatus2":
    let obj = newWafProductApiBundleResponseStatus2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WafProductApiBundleResponseStatus2)) == openjson.toJson(obj)

suite "content_scanning endpoints":
  test "POST /zones/{zone_id}/content-upload-scan/disable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdContentUploadScanDisable("test")

  test "POST /zones/{zone_id}/content-upload-scan/enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdContentUploadScanEnable("test")

  test "GET /zones/{zone_id}/content-upload-scan/payloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdContentUploadScanPayloads("test")

  test "POST /zones/{zone_id}/content-upload-scan/payloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdContentUploadScanPayloads("test")

  test "DELETE /zones/{zone_id}/content-upload-scan/payloads/{expression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdContentUploadScanPayloadsExpressionId("test", newWafProductApiBundleCustomScanId())

  test "GET /zones/{zone_id}/content-upload-scan/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdContentUploadScanSettings("test")

