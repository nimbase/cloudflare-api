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

suite "schema_validation_settings serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldPerOperationSettingChangeBase":
    let obj = newApiShieldPerOperationSettingChangeBase()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPerOperationSettingChangeBase)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseSingle":
    let obj = newApiShieldApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ApiShieldUuid2":
    let obj = newApiShieldUuid2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldUuid2)) == openjson.toJson(obj)

  test "round-trips ApiShieldGlobalSettings":
    let obj = newApiShieldGlobalSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldGlobalSettings)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips ApiShieldPerOperationSetting":
    let obj = newApiShieldPerOperationSetting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPerOperationSetting)) == openjson.toJson(obj)

  test "round-trips ApiShieldGlobalSettingChangeBase":
    let obj = newApiShieldGlobalSettingChangeBase()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldGlobalSettingChangeBase)) == openjson.toJson(obj)

suite "schema_validation_settings endpoints":
  test "GET /zones/{zone_id}/schema_validation/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSettings()

  test "PUT /zones/{zone_id}/schema_validation/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSchemaValidationSettings()

  test "PATCH /zones/{zone_id}/schema_validation/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSchemaValidationSettings(newApiShieldGlobalSettingChangeBase())

  test "GET /zones/{zone_id}/schema_validation/settings/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSettingsOperations(1, 1)

  test "PATCH /zones/{zone_id}/schema_validation/settings/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSchemaValidationSettingsOperations()

  test "GET /zones/{zone_id}/schema_validation/settings/operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSettingsOperationsOperationId()

  test "PUT /zones/{zone_id}/schema_validation/settings/operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSchemaValidationSettingsOperationsOperationId()

  test "DELETE /zones/{zone_id}/schema_validation/settings/operations/{operation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSchemaValidationSettingsOperationsOperationId()

