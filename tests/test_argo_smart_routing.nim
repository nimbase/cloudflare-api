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

suite "argo_smart_routing serialization":
  test "round-trips ArgoConfigApiResponseCommonFailure":
    let obj = newArgoConfigApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArgoConfigApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ArgoConfigApiResponseSingle":
    let obj = newArgoConfigApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArgoConfigApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ArgoConfigPatch":
    let obj = newArgoConfigPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArgoConfigPatch)) == openjson.toJson(obj)

suite "argo_smart_routing endpoints":
  test "GET /zones/{zone_id}/argo/smart_routing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdArgoSmartRouting("test")

  test "PATCH /zones/{zone_id}/argo/smart_routing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdArgoSmartRouting("test", newArgoConfigPatch())

