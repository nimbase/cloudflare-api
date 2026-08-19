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

suite "api_shield_schema_validation_2_0 serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldSchemaUploadResponse":
    let obj = newApiShieldOldSchemaUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldSchemaUploadResponse)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldZoneSchemaValidationSettingsPatch":
    let obj = newApiShieldOldZoneSchemaValidationSettingsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldZoneSchemaValidationSettingsPatch)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldOperationSchemaValidationSettings":
    let obj = newApiShieldOldOperationSchemaValidationSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldOperationSchemaValidationSettings)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldResponseUserSchemasHosts":
    let obj = newApiShieldOldResponseUserSchemasHosts()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldResponseUserSchemasHosts)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseSingle":
    let obj = newApiShieldApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldZoneSchemaValidationSettingsPut":
    let obj = newApiShieldOldZoneSchemaValidationSettingsPut()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldZoneSchemaValidationSettingsPut)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldZoneSchemaValidationSettings":
    let obj = newApiShieldOldZoneSchemaValidationSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldZoneSchemaValidationSettings)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldOperationSchemaValidationSettingsMultipleRequest":
    let obj = newApiShieldOldOperationSchemaValidationSettingsMultipleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldOperationSchemaValidationSettingsMultipleRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldSchemaUploadFailure":
    let obj = newApiShieldOldSchemaUploadFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldSchemaUploadFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldPublicSchema":
    let obj = newApiShieldOldPublicSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldPublicSchema)) == openjson.toJson(obj)

  test "round-trips ApiShieldOldOperationSchemaValidationSettingsModifyRequest":
    let obj = newApiShieldOldOperationSchemaValidationSettingsModifyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldOldOperationSchemaValidationSettingsModifyRequest)) == openjson.toJson(obj)

suite "api_shield_schema_validation_2_0 endpoints":
  test "PATCH /zones/{zone_id}/api_gateway/operations/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdApiGatewayOperationsSchemaValidation(newApiShieldOldOperationSchemaValidationSettingsMultipleRequest())

  test "GET /zones/{zone_id}/api_gateway/operations/{operation_id}/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayOperationsOperationIdSchemaValidation()

  test "PUT /zones/{zone_id}/api_gateway/operations/{operation_id}/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewayOperationsOperationIdSchemaValidation(newApiShieldOldOperationSchemaValidationSettingsModifyRequest())

  test "GET /zones/{zone_id}/api_gateway/settings/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewaySettingsSchemaValidation()

  test "PUT /zones/{zone_id}/api_gateway/settings/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdApiGatewaySettingsSchemaValidation(newApiShieldOldZoneSchemaValidationSettingsPut())

  test "PATCH /zones/{zone_id}/api_gateway/settings/schema_validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdApiGatewaySettingsSchemaValidation(newApiShieldOldZoneSchemaValidationSettingsPatch())

  test "GET /zones/{zone_id}/api_gateway/user_schemas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayUserSchemas(1, 1, true, true)

  test "POST /zones/{zone_id}/api_gateway/user_schemas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayUserSchemas()

  test "GET /zones/{zone_id}/api_gateway/user_schemas/hosts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayUserSchemasHosts()

  test "GET /zones/{zone_id}/api_gateway/user_schemas/{schema_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdApiGatewayUserSchemasSchemaId(true)

  test "DELETE /zones/{zone_id}/api_gateway/user_schemas/{schema_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdApiGatewayUserSchemasSchemaId()

