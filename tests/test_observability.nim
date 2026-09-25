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

suite "observability serialization":
  test "round-trips GetZonesZoneIdObservabilityTracingRulesResponse":
    let obj = cloudflare.GetZonesZoneIdObservabilityTracingRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdObservabilityTracingRulesResponse)) == openjson.toJson(obj)

  test "round-trips PutZonesZoneIdObservabilityTracingRulesResponse":
    let obj = cloudflare.PutZonesZoneIdObservabilityTracingRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutZonesZoneIdObservabilityTracingRulesResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdObservabilityTracingRulesResponse":
    let obj = cloudflare.DeleteZonesZoneIdObservabilityTracingRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdObservabilityTracingRulesResponse)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdObservabilityTracingSettingsResponse":
    let obj = cloudflare.GetZonesZoneIdObservabilityTracingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdObservabilityTracingSettingsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdObservabilityTracingSettingsResponse":
    let obj = cloudflare.DeleteZonesZoneIdObservabilityTracingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdObservabilityTracingSettingsResponse)) == openjson.toJson(obj)

  test "round-trips PatchZonesZoneIdObservabilityTracingSettingsResponse":
    let obj = cloudflare.PatchZonesZoneIdObservabilityTracingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchZonesZoneIdObservabilityTracingSettingsResponse)) == openjson.toJson(obj)

suite "observability endpoints":
  test "GET /zones/{zone_id}/observability/tracing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdObservabilityTracingRules("test")

  test "DELETE /zones/{zone_id}/observability/tracing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdObservabilityTracingRules("test")

  test "GET /zones/{zone_id}/observability/tracing/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdObservabilityTracingSettings("test")

  test "DELETE /zones/{zone_id}/observability/tracing/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdObservabilityTracingSettings("test")

