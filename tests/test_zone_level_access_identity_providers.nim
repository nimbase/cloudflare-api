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

suite "zone_level_access_identity_providers serialization":
  test "round-trips AccessIdentityProviders2":
    let obj = newAccessIdentityProviders2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdentityProviders2)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection17":
    let obj = newAccessResponseCollection17()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection17)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse16":
    let obj = newAccessSingleResponse16()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse16)) == openjson.toJson(obj)

suite "zone_level_access_identity_providers endpoints":
  test "GET /zones/{zone_id}/access/identity_providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessIdentityProviders("test")

  test "POST /zones/{zone_id}/access/identity_providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdAccessIdentityProviders("test", newAccessIdentityProviders2())

  test "GET /zones/{zone_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAccessIdentityProvidersIdentityProviderId("test", "test")

  test "PUT /zones/{zone_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdAccessIdentityProvidersIdentityProviderId("test", "test", newAccessIdentityProviders2())

  test "DELETE /zones/{zone_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAccessIdentityProvidersIdentityProviderId("test", "test")

