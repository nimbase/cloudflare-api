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

suite "managed_transforms serialization":
  test "round-trips ManagedTransformsResponse":
    let obj = newManagedTransformsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ManagedTransformsResponse)) == openjson.toJson(obj)

  test "round-trips ManagedTransformsManagedTransformsPatch":
    let obj = newManagedTransformsManagedTransformsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ManagedTransformsManagedTransformsPatch)) == openjson.toJson(obj)

  test "round-trips ManagedTransformsMessage":
    let obj = newManagedTransformsMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ManagedTransformsMessage)) == openjson.toJson(obj)

  test "round-trips ManagedTransformsManagedTransforms":
    let obj = newManagedTransformsManagedTransforms()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ManagedTransformsManagedTransforms)) == openjson.toJson(obj)

suite "managed_transforms endpoints":
  test "GET /zones/{zone_id}/managed_headers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdManagedHeaders("test")

  test "DELETE /zones/{zone_id}/managed_headers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdManagedHeaders("test")

  test "PATCH /zones/{zone_id}/managed_headers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdManagedHeaders("test", newManagedTransformsManagedTransformsPatch())

