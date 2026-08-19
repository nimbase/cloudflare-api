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

suite "zone_holds serialization":
  test "round-trips ZonesApiResponseCommonFailure2":
    let obj = newZonesApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips ZonesApiResponseSingle2":
    let obj = newZonesApiResponseSingle2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZonesApiResponseSingle2)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdHoldZoneNameResponse":
    let obj = cloudflare.GetZonesZoneIdHoldZoneNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdHoldZoneNameResponse)) == openjson.toJson(obj)

suite "zone_holds endpoints":
  test "GET /zones/{zone_id}/hold":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdHold("test")

  test "POST /zones/{zone_id}/hold":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdHold("test", true)

  test "DELETE /zones/{zone_id}/hold":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdHold("test", "test")

  test "GET /zones/{zone_id}/hold/{zone_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdHoldZoneName("test", "test")

