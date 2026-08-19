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

suite "url_normalization serialization":
  test "round-trips RulesetsUrlNormalization":
    let obj = newRulesetsUrlNormalization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsUrlNormalization)) == openjson.toJson(obj)

  test "round-trips RulesetsResponse":
    let obj = newRulesetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RulesetsResponse)) == openjson.toJson(obj)

suite "url_normalization endpoints":
  test "GET /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdUrlNormalization("test")

  test "PUT /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdUrlNormalization("test", newRulesetsUrlNormalization())

  test "DELETE /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdUrlNormalization("test")

