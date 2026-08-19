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

suite "zaraz serialization":
  test "round-trips ZarazZarazWorkflowResponse":
    let obj = newZarazZarazWorkflowResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazWorkflowResponse)) == openjson.toJson(obj)

  test "round-trips ZarazZarazConfigResponse":
    let obj = newZarazZarazConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazConfigResponse)) == openjson.toJson(obj)

  test "round-trips ZarazZarazConfigHistoryResponse":
    let obj = newZarazZarazConfigHistoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazConfigHistoryResponse)) == openjson.toJson(obj)

  test "round-trips ZarazZarazConfigBody":
    let obj = newZarazZarazConfigBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazConfigBody)) == openjson.toJson(obj)

  test "round-trips ZarazZarazConfigReturn":
    let obj = newZarazZarazConfigReturn()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazConfigReturn)) == openjson.toJson(obj)

  test "round-trips ZarazApiResponseCommon":
    let obj = newZarazApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ZarazApiResponseCommonFailure":
    let obj = newZarazApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZarazZarazHistoryResponse":
    let obj = newZarazZarazHistoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZarazZarazHistoryResponse)) == openjson.toJson(obj)

suite "zaraz endpoints":
  test "GET /zones/{zone_id}/settings/zaraz/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazConfig("test")

  test "PUT /zones/{zone_id}/settings/zaraz/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSettingsZarazConfig("test", newZarazZarazConfigBody())

  test "GET /zones/{zone_id}/settings/zaraz/default":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazDefault("test")

  test "GET /zones/{zone_id}/settings/zaraz/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazExport("test")

  test "GET /zones/{zone_id}/settings/zaraz/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazHistory("test", 1, 1, {}, {})

  test "PUT /zones/{zone_id}/settings/zaraz/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSettingsZarazHistory("test")

  test "GET /zones/{zone_id}/settings/zaraz/history/configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazHistoryConfigs("test", @["test"])

  test "POST /zones/{zone_id}/settings/zaraz/publish":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSettingsZarazPublish("test")

  test "GET /zones/{zone_id}/settings/zaraz/workflow":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsZarazWorkflow("test")

