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

suite "zone serialization":
  test "round-trips CachePurgeApiResponseCommonFailure":
    let obj = newCachePurgeApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CachePurgeApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZonesResultInfo":
    let obj = newZonesResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesResultInfo)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommon":
    let obj = newZonesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ZoneActivationApiResponseSingle":
    let obj = newZoneActivationApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneActivationApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips CachePurgeApiResponseSingleId":
    let obj = newCachePurgeApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CachePurgeApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseCommonFailure":
    let obj = newZonesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseSingleId":
    let obj = newZonesApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips ZonesZone":
    let obj = newZonesZone()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesZone)) == openjson.toJson(obj)

  test "round-trips ZoneActivationApiResponseCommonFailure":
    let obj = newZoneActivationApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZoneActivationApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zone endpoints":
  test "GET /zones/{zone_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneId("test")

  test "DELETE /zones/{zone_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneId("test")

  test "PUT /zones/{zone_id}/activation_check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdActivationCheck("test")

  test "POST /zones/{zone_id}/environments/{environment_id}/purge_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEnvironmentsEnvironmentIdPurgeCache("test", "test")

  test "POST /zones/{zone_id}/purge_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdPurgeCache("test")

