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

suite "health_checks serialization":
  test "round-trips SmartshieldResponseCollection":
    let obj = newSmartshieldResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldResponseCollection)) == openjson.toJson(obj)

  test "round-trips SmartshieldQueryHealthcheck":
    let obj = newSmartshieldQueryHealthcheck()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldQueryHealthcheck)) == openjson.toJson(obj)

  test "round-trips HealthchecksIdResponse":
    let obj = newHealthchecksIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HealthchecksIdResponse)) == openjson.toJson(obj)

  test "round-trips HealthchecksResponseCollection":
    let obj = newHealthchecksResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HealthchecksResponseCollection)) == openjson.toJson(obj)

  test "round-trips HealthchecksSingleResponse":
    let obj = newHealthchecksSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HealthchecksSingleResponse)) == openjson.toJson(obj)

  test "round-trips SmartshieldSingleHcIdResponse":
    let obj = newSmartshieldSingleHcIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldSingleHcIdResponse)) == openjson.toJson(obj)

  test "round-trips SmartshieldSingleHcResponse":
    let obj = newSmartshieldSingleHcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldSingleHcResponse)) == openjson.toJson(obj)

  test "round-trips HealthchecksApiResponseCommonFailure":
    let obj = newHealthchecksApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HealthchecksApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips HealthchecksQueryHealthcheck":
    let obj = newHealthchecksQueryHealthcheck()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HealthchecksQueryHealthcheck)) == openjson.toJson(obj)

  test "round-trips SmartshieldApiResponseCommonFailure":
    let obj = newSmartshieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SmartshieldApiResponseCommonFailure)) == openjson.toJson(obj)

suite "health_checks endpoints":
  test "GET /zones/{zone_id}/healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdHealthchecks("test", 1.0, 1.0)

  test "POST /zones/{zone_id}/healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdHealthchecks("test", newHealthchecksQueryHealthcheck())

  test "POST /zones/{zone_id}/healthchecks/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdHealthchecksPreview("test", newHealthchecksQueryHealthcheck())

  test "GET /zones/{zone_id}/healthchecks/preview/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdHealthchecksPreviewHealthcheckId("test", "test")

  test "DELETE /zones/{zone_id}/healthchecks/preview/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdHealthchecksPreviewHealthcheckId("test", "test")

  test "GET /zones/{zone_id}/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdHealthchecksHealthcheckId("test", "test")

  test "PUT /zones/{zone_id}/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdHealthchecksHealthcheckId("test", "test", newHealthchecksQueryHealthcheck())

  test "DELETE /zones/{zone_id}/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdHealthchecksHealthcheckId("test", "test")

  test "PATCH /zones/{zone_id}/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdHealthchecksHealthcheckId("test", "test", newHealthchecksQueryHealthcheck())

  test "GET /zones/{zone_id}/smart_shield/healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSmartShieldHealthchecks("test", 1.0, 1.0)

  test "POST /zones/{zone_id}/smart_shield/healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSmartShieldHealthchecks("test", newSmartshieldQueryHealthcheck())

  test "GET /zones/{zone_id}/smart_shield/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSmartShieldHealthchecksHealthcheckId("test", "test")

  test "PUT /zones/{zone_id}/smart_shield/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSmartShieldHealthchecksHealthcheckId("test", "test", newSmartshieldSingleHcResponse())

  test "DELETE /zones/{zone_id}/smart_shield/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSmartShieldHealthchecksHealthcheckId("test", "test")

  test "PATCH /zones/{zone_id}/smart_shield/healthchecks/{healthcheck_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSmartShieldHealthchecksHealthcheckId("test", "test", newSmartshieldQueryHealthcheck())

