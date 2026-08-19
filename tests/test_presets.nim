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

suite "presets serialization":
  test "round-trips RealtimekitGenericSuccessResponse":
    let obj = newRealtimekitGenericSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericSuccessResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitUpdatePreset":
    let obj = newRealtimekitUpdatePreset()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitUpdatePreset)) == openjson.toJson(obj)

  test "round-trips RealtimekitPagingResponse":
    let obj = newRealtimekitPagingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPagingResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitPresetListItem":
    let obj = newRealtimekitPresetListItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPresetListItem)) == openjson.toJson(obj)

  test "round-trips RealtimekitPreset":
    let obj = newRealtimekitPreset()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPreset)) == openjson.toJson(obj)

suite "presets endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/presets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdPresets("test", "test", 1.0, 1.0, "test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/presets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdPresets("test", "test", newRealtimekitPreset())

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/presets/{preset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdPresetsPresetId("test", "test", "test")

  test "PUT /accounts/{account_id}/realtime/kit/{app_id}/presets/{preset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRealtimeKitAppIdPresetsPresetId("test", "test", "test", newRealtimekitPreset())

  test "DELETE /accounts/{account_id}/realtime/kit/{app_id}/presets/{preset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRealtimeKitAppIdPresetsPresetId("test", "test", "test")

  test "PATCH /accounts/{account_id}/realtime/kit/{app_id}/presets/{preset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRealtimeKitAppIdPresetsPresetId("test", "test", "test", newRealtimekitUpdatePreset())

