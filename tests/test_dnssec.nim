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

suite "dnssec serialization":
  test "round-trips DnssecDnssecZskResponseCollection":
    let obj = newDnssecDnssecZskResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnssecDnssecZskResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnssecApiResponseCommonFailure":
    let obj = newDnssecApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnssecApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnssecDnssecResponseSingle":
    let obj = newDnssecDnssecResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnssecDnssecResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnssecDeleteDnssecResponseSingle":
    let obj = newDnssecDeleteDnssecResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnssecDeleteDnssecResponseSingle)) == openjson.toJson(obj)

suite "dnssec endpoints":
  test "GET /zones/{zone_id}/dnssec":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnssec("test")

  test "DELETE /zones/{zone_id}/dnssec":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdDnssec("test")

  test "GET /zones/{zone_id}/dnssec/zsk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnssecZsk("test")

