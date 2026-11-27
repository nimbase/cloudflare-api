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
  test "round-trips UrlNormalizationResponse":
    let obj = newUrlNormalizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UrlNormalizationResponse)) == openjson.toJson(obj)

  test "round-trips UrlNormalizationMessage":
    let obj = newUrlNormalizationMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UrlNormalizationMessage)) == openjson.toJson(obj)

  test "round-trips UrlNormalizationUrlNormalization":
    let obj = newUrlNormalizationUrlNormalization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.UrlNormalizationUrlNormalization)) == openjson.toJson(obj)

suite "url_normalization endpoints":
  test "GET /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdUrlNormalization("test")

  test "PUT /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdUrlNormalization("test", newUrlNormalizationUrlNormalization())

  test "DELETE /zones/{zone_id}/url_normalization":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdUrlNormalization("test")

