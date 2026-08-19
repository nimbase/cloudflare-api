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

suite "api_shield_labels serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldBulkPutLabelsOnOperationRequest":
    let obj = newApiShieldBulkPutLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldBulkPutLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldPostLabelsOnOperationRequest":
    let obj = newApiShieldPostLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPostLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldFullLabel":
    let obj = newApiShieldFullLabel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldFullLabel)) == openjson.toJson(obj)

  test "round-trips ApiShieldPutLabelRequest":
    let obj = newApiShieldPutLabelRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPutLabelRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldPatchLabelRequest":
    let obj = newApiShieldPatchLabelRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPatchLabelRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldDeleteLabelsOnOperationRequest":
    let obj = newApiShieldDeleteLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldDeleteLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldReplaceOperationsAttachedToLabelRequest":
    let obj = newApiShieldReplaceOperationsAttachedToLabelRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldReplaceOperationsAttachedToLabelRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldBulkDeleteLabelsOnOperationRequest":
    let obj = newApiShieldBulkDeleteLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldBulkDeleteLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldLabelRequest":
    let obj = newApiShieldLabelRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldLabelRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldPutLabelsOnOperationRequest":
    let obj = newApiShieldPutLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPutLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldBulkPostLabelsOnOperationRequest":
    let obj = newApiShieldBulkPostLabelsOnOperationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldBulkPostLabelsOnOperationRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldFullManagedLabel":
    let obj = newApiShieldFullManagedLabel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldFullManagedLabel)) == openjson.toJson(obj)

  test "round-trips ApiShieldLabel":
    let obj = newApiShieldLabel()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldLabel)) == openjson.toJson(obj)

  test "round-trips ApiShieldOperationWithLabelsOnly":
    let obj = newApiShieldOperationWithLabelsOnly()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOperationWithLabelsOnly)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

suite "api_shield_labels endpoints":
  test "GET /zones/{zone_id}/api_gateway/labels/managed/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayLabelsManagedName(true)

  test "PUT /zones/{zone_id}/api_gateway/labels/managed/{name}/resources/operation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayLabelsManagedNameResourcesOperation(newApiShieldReplaceOperationsAttachedToLabelRequest())

  test "POST /zones/{zone_id}/api_gateway/labels/user":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayLabelsUser()

  test "DELETE /zones/{zone_id}/api_gateway/labels/user":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayLabelsUser()

  test "GET /zones/{zone_id}/api_gateway/labels/user/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayLabelsUserName(true)

  test "PUT /zones/{zone_id}/api_gateway/labels/user/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayLabelsUserName(newApiShieldPutLabelRequest())

  test "DELETE /zones/{zone_id}/api_gateway/labels/user/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayLabelsUserName()

  test "PATCH /zones/{zone_id}/api_gateway/labels/user/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdApiGatewayLabelsUserName(newApiShieldPatchLabelRequest())

  test "PUT /zones/{zone_id}/api_gateway/labels/user/{name}/resources/operation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayLabelsUserNameResourcesOperation(newApiShieldReplaceOperationsAttachedToLabelRequest())

  test "POST /zones/{zone_id}/api_gateway/operations/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayOperationsLabels(newApiShieldBulkPostLabelsOnOperationRequest())

  test "PUT /zones/{zone_id}/api_gateway/operations/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayOperationsLabels(newApiShieldBulkPutLabelsOnOperationRequest())

  test "DELETE /zones/{zone_id}/api_gateway/operations/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayOperationsLabels(newApiShieldBulkDeleteLabelsOnOperationRequest())

  test "POST /zones/{zone_id}/api_gateway/operations/{operation_id}/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayOperationsOperationIdLabels(newApiShieldPostLabelsOnOperationRequest())

  test "PUT /zones/{zone_id}/api_gateway/operations/{operation_id}/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayOperationsOperationIdLabels(newApiShieldPutLabelsOnOperationRequest())

  test "DELETE /zones/{zone_id}/api_gateway/operations/{operation_id}/labels":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayOperationsOperationIdLabels(newApiShieldDeleteLabelsOnOperationRequest())

