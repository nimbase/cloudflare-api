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

suite "observatory serialization":
  test "round-trips ObservatoryTrendResponse":
    let obj = newObservatoryTrendResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryTrendResponse)) == openjson.toJson(obj)

  test "round-trips ObservatoryPagesResponseCollection":
    let obj = newObservatoryPagesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryPagesResponseCollection)) == openjson.toJson(obj)

  test "round-trips ObservatoryCreateScheduleResponse":
    let obj = newObservatoryCreateScheduleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryCreateScheduleResponse)) == openjson.toJson(obj)

  test "round-trips ObservatoryAvailabilitiesResponse":
    let obj = newObservatoryAvailabilitiesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryAvailabilitiesResponse)) == openjson.toJson(obj)

  test "round-trips ObservatoryScheduleResponseSingle":
    let obj = newObservatoryScheduleResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryScheduleResponseSingle)) == openjson.toJson(obj)

  test "round-trips ObservatoryCountResponse":
    let obj = newObservatoryCountResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryCountResponse)) == openjson.toJson(obj)

  test "round-trips ObservatoryApiResponseCommonFailure":
    let obj = newObservatoryApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ObservatoryPageTestResponseCollection":
    let obj = newObservatoryPageTestResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryPageTestResponseCollection)) == openjson.toJson(obj)

  test "round-trips ObservatoryPageTestResponseSingle":
    let obj = newObservatoryPageTestResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ObservatoryPageTestResponseSingle)) == openjson.toJson(obj)

suite "observatory endpoints":
  test "GET /zones/{zone_id}/speed_api/availabilities":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpeedApiAvailabilities("test")

  test "GET /zones/{zone_id}/speed_api/pages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpeedApiPages("test")

  test "GET /zones/{zone_id}/speed_api/pages/{url}/tests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpeedApiPagesUrlTests("test", "test", 1, 1, openjson.newJObject())

  test "DELETE /zones/{zone_id}/speed_api/pages/{url}/tests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSpeedApiPagesUrlTests("test", "test", openjson.newJObject())

  test "GET /zones/{zone_id}/speed_api/pages/{url}/tests/{test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpeedApiPagesUrlTestsTestId("test", "test", "test")

  test "GET /zones/{zone_id}/speed_api/schedule/{url}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpeedApiScheduleUrl("test", "test", openjson.newJObject())

  test "DELETE /zones/{zone_id}/speed_api/schedule/{url}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSpeedApiScheduleUrl("test", "test", openjson.newJObject())

