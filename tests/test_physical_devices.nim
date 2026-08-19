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

suite "physical_devices serialization":
  test "round-trips TeamsDevicesEmptyBody":
    let obj = newTeamsDevicesEmptyBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesEmptyBody)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesPhysicalDevice":
    let obj = newTeamsDevicesPhysicalDevice()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesPhysicalDevice)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesCursorResultInfo":
    let obj = newTeamsDevicesCursorResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesCursorResultInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesPhysicalDevicesResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesPhysicalDevicesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesPhysicalDevicesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDevicesRegistrationsResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDevicesRegistrationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDevicesRegistrationsResponse)) == openjson.toJson(obj)

suite "physical_devices endpoints":
  test "GET /accounts/{account_id}/devices/physical-devices":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPhysicalDevices("test", "test", {}, {}, "test", "test", "test", 1, "test", {}, @["test"], "test", "test")

  test "GET /accounts/{account_id}/devices/physical-devices/{device_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesPhysicalDevicesDeviceId("test", "test", "test")

  test "DELETE /accounts/{account_id}/devices/physical-devices/{device_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesPhysicalDevicesDeviceId("test", "test")

  test "POST /accounts/{account_id}/devices/physical-devices/{device_id}/revoke":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevoke("test", "test")

  test "DELETE /accounts/{account_id}/devices/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesRegistrations("test", @["test"])

