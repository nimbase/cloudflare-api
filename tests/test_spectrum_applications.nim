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

suite "spectrum_applications serialization":
  test "round-trips SpectrumConfigApiResponseCommonFailure":
    let obj = newSpectrumConfigApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SpectrumConfigAppConfigSingle":
    let obj = newSpectrumConfigAppConfigSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigAppConfigSingle)) == openjson.toJson(obj)

  test "round-trips SpectrumConfigAppConfigCollection":
    let obj = newSpectrumConfigAppConfigCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigAppConfigCollection)) == openjson.toJson(obj)

  test "round-trips SpectrumConfigUpdateAppConfig":
    let obj = newSpectrumConfigUpdateAppConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigUpdateAppConfig)) == openjson.toJson(obj)

  test "round-trips SpectrumConfigProtocolCollection":
    let obj = newSpectrumConfigProtocolCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigProtocolCollection)) == openjson.toJson(obj)

  test "round-trips SpectrumConfigApiResponseSingleId":
    let obj = newSpectrumConfigApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumConfigApiResponseSingleId)) == openjson.toJson(obj)

suite "spectrum_applications endpoints":
  test "GET /zones/{zone_id}/spectrum/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpectrumApps("test", 1.0, 1.0, {}, {})

  test "POST /zones/{zone_id}/spectrum/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSpectrumApps("test", newSpectrumConfigUpdateAppConfig())

  test "GET /zones/{zone_id}/spectrum/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpectrumAppsAppId("test", "test")

  test "PUT /zones/{zone_id}/spectrum/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSpectrumAppsAppId("test", "test", newSpectrumConfigUpdateAppConfig())

  test "DELETE /zones/{zone_id}/spectrum/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSpectrumAppsAppId("test", "test")

  test "GET /zones/{zone_id}/spectrum/protocols":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpectrumProtocols("test")

