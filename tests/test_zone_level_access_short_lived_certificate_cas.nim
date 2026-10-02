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

suite "zone_level_access_short_lived_certificate_cas serialization":
  test "round-trips AccessSingleResponse20":
    let obj = newAccessSingleResponse20()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse20)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse5":
    let obj = newAccessIdResponse5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse5)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection21":
    let obj = newAccessResponseCollection21()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection21)) == openjson.toJson(obj)

suite "zone_level_access_short_lived_certificate_cas endpoints":
  test "GET /zones/{zone_id}/access/apps/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessAppsCa("test")

  test "GET /zones/{zone_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessAppsAppIdCa("test", "test")

  test "POST /zones/{zone_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdAccessAppsAppIdCa("test", "test")

  test "DELETE /zones/{zone_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessAppsAppIdCa("test", "test")

