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

suite "zone_environments serialization":
  test "round-trips KaminoEnvironmentsResponse":
    let obj = newKaminoEnvironmentsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.KaminoEnvironmentsResponse)) == openjson.toJson(obj)

  test "round-trips KaminoErrorResponse":
    let obj = newKaminoErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.KaminoErrorResponse)) == openjson.toJson(obj)

  test "round-trips KaminoEnvironmentsRequest":
    let obj = newKaminoEnvironmentsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.KaminoEnvironmentsRequest)) == openjson.toJson(obj)

suite "zone_environments endpoints":
  test "GET /zones/{zone_id}/environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEnvironments()

  test "POST /zones/{zone_id}/environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEnvironments(newKaminoEnvironmentsRequest())

  test "PUT /zones/{zone_id}/environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdEnvironments(newKaminoEnvironmentsRequest())

  test "PATCH /zones/{zone_id}/environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdEnvironments(newKaminoEnvironmentsRequest())

  test "DELETE /zones/{zone_id}/environments/{environment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEnvironmentsEnvironmentId()

  test "POST /zones/{zone_id}/environments/{environment_id}/rollback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEnvironmentsEnvironmentIdRollback()

