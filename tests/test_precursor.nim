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

suite "precursor serialization":
  test "round-trips PrecursorPrecursorConfig":
    let obj = newPrecursorPrecursorConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PrecursorPrecursorConfig)) == openjson.toJson(obj)

  test "round-trips PrecursorPrecursorConfigResponseBody":
    let obj = newPrecursorPrecursorConfigResponseBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PrecursorPrecursorConfigResponseBody)) == openjson.toJson(obj)

  test "round-trips PrecursorApiResponseCommonFailure":
    let obj = newPrecursorApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PrecursorApiResponseCommonFailure)) == openjson.toJson(obj)

suite "precursor endpoints":
  test "GET /zones/{zone_id}/precursor":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPrecursor("test")

  test "PUT /zones/{zone_id}/precursor":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdPrecursor("test", newPrecursorPrecursorConfig())

