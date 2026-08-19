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

suite "device_posture_rules serialization":
  test "round-trips TeamsDevicesIdentifier":
    let obj = newTeamsDevicesIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdentifier)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesInput":
    let obj = newTeamsDevicesInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesInput)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesResponseCollection":
    let obj = newTeamsDevicesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesIdResponse":
    let obj = newTeamsDevicesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSingleResponse":
    let obj = newTeamsDevicesSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSingleResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "device_posture_rules endpoints":
  test "GET /accounts/{account_id}/devices/posture":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPosture(newTeamsDevicesIdentifier())

  test "GET /accounts/{account_id}/devices/posture/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPostureRuleId("test", newTeamsDevicesIdentifier())

  test "DELETE /accounts/{account_id}/devices/posture/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesPostureRuleId("test", newTeamsDevicesIdentifier())

