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

suite "zone_level_zero_trust_organization serialization":
  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse15":
    let obj = newAccessSingleResponse15()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse15)) == openjson.toJson(obj)

  test "round-trips AccessEmptyResponse":
    let obj = newAccessEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessEmptyResponse)) == openjson.toJson(obj)

  test "round-trips AccessLoginDesign2":
    let obj = newAccessLoginDesign2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessLoginDesign2)) == openjson.toJson(obj)

  test "round-trips AccessIdentifier4":
    let obj = newAccessIdentifier4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdentifier4)) == openjson.toJson(obj)

suite "zone_level_zero_trust_organization endpoints":
  test "GET /zones/{zone_id}/access/organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessOrganizations(newAccessIdentifier4())

