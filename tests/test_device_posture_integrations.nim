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

suite "device_posture_integrations serialization":
  test "round-trips TeamsDevicesSchemasIdResponse":
    let obj = newTeamsDevicesSchemasIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSchemasIdResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesIdentifier":
    let obj = newTeamsDevicesIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdentifier)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSchemasSingleResponse":
    let obj = newTeamsDevicesSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesConfigRequest":
    let obj = newTeamsDevicesConfigRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesConfigRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSchemasResponseCollection":
    let obj = newTeamsDevicesSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSchemasResponseCollection)) == openjson.toJson(obj)

suite "device_posture_integrations endpoints":
  test "GET /accounts/{account_id}/devices/posture/integration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPostureIntegration(newTeamsDevicesIdentifier())

  test "GET /accounts/{account_id}/devices/posture/integration/{integration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPostureIntegrationIntegrationId("test", newTeamsDevicesIdentifier())

  test "DELETE /accounts/{account_id}/devices/posture/integration/{integration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesPostureIntegrationIntegrationId("test", newTeamsDevicesIdentifier())

