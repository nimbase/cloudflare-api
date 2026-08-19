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

suite "zone_level_access_groups serialization":
  test "round-trips AccessSingleResponse17":
    let obj = newAccessSingleResponse17()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse17)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection18":
    let obj = newAccessResponseCollection18()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection18)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

suite "zone_level_access_groups endpoints":
  test "GET /zones/{zone_id}/access/groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessGroups("test")

  test "GET /zones/{zone_id}/access/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessGroupsGroupId("test", "test")

  test "DELETE /zones/{zone_id}/access/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessGroupsGroupId("test", "test")

