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

suite "api_shield_endpoint_management serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldObjectWithOperationId":
    let obj = newApiShieldObjectWithOperationId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldObjectWithOperationId)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldBasicOperation":
    let obj = newApiShieldBasicOperation()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldBasicOperation)) == openjson.toJson(obj)

  test "round-trips ApiShieldSingleOperationResponse":
    let obj = newApiShieldSingleOperationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSingleOperationResponse)) == openjson.toJson(obj)

  test "round-trips ApiShieldSchemaResponseWithThresholds":
    let obj = newApiShieldSchemaResponseWithThresholds()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSchemaResponseWithThresholds)) == openjson.toJson(obj)

  test "round-trips ApiShieldMultipleOperationResponsePaginated":
    let obj = newApiShieldMultipleOperationResponsePaginated()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldMultipleOperationResponsePaginated)) == openjson.toJson(obj)

  test "round-trips ApiShieldMultipleOperationResponse":
    let obj = newApiShieldMultipleOperationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldMultipleOperationResponse)) == openjson.toJson(obj)

suite "api_shield_endpoint_management endpoints":
  test "POST /zones/{zone_id}/api_gateway/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayOperations()

  test "DELETE /zones/{zone_id}/api_gateway/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayOperations()

  test "POST /zones/{zone_id}/api_gateway/operations/item":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayOperationsItem(newApiShieldBasicOperation())

  test "DELETE /zones/{zone_id}/api_gateway/operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayOperationsOperationId()

