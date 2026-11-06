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

suite "ohttp_gateway serialization":
  test "round-trips OhttpGatewayDeleteApiSuccessResponse":
    let obj = newOhttpGatewayDeleteApiSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OhttpGatewayDeleteApiSuccessResponse)) == openjson.toJson(obj)

  test "round-trips OhttpGatewayGetApiSuccessResponse":
    let obj = newOhttpGatewayGetApiSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OhttpGatewayGetApiSuccessResponse)) == openjson.toJson(obj)

  test "round-trips OhttpGatewayCreateApiSuccessResponse":
    let obj = newOhttpGatewayCreateApiSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OhttpGatewayCreateApiSuccessResponse)) == openjson.toJson(obj)

  test "round-trips OhttpGatewayApiResponseFailure":
    let obj = newOhttpGatewayApiResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OhttpGatewayApiResponseFailure)) == openjson.toJson(obj)

suite "ohttp_gateway endpoints":
  test "GET /zones/{zone_id}/settings/ohttp-gateway":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSettingsOhttpGateway("test")

  test "PUT /zones/{zone_id}/settings/ohttp-gateway":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSettingsOhttpGateway("test")

  test "DELETE /zones/{zone_id}/settings/ohttp-gateway":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSettingsOhttpGateway("test")

