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
  test "round-trips RulesetsManagedTransformsPatch":
    let obj = newRulesetsManagedTransformsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsManagedTransformsPatch)) == openjson.toJson(obj)

  test "round-trips RulesetsResponse":
    let obj = newRulesetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsResponse)) == openjson.toJson(obj)

  test "round-trips RulesetsManagedTransforms":
    let obj = newRulesetsManagedTransforms()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsManagedTransforms)) == openjson.toJson(obj)

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
    discard waitFor client.patchZonesZoneIdManagedHeaders("test", newRulesetsManagedTransformsPatch())

