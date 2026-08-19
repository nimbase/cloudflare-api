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

suite "registrations serialization":
  test "round-trips TeamsDevicesEmptyBody":
    let obj = newTeamsDevicesEmptyBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesEmptyBody)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesRegistration":
    let obj = newTeamsDevicesRegistration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesRegistration)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesCursorResultInfo":
    let obj = newTeamsDevicesCursorResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesCursorResultInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesRegistrationsResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesRegistrationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesRegistrationsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesRegistrationsRevokeResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesRegistrationsRevokeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesRegistrationsRevokeResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse)) == openjson.toJson(obj)

suite "registrations endpoints":
  test "GET /accounts/{account_id}/devices/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesRegistrations("test", @["test"], "test", "test", {}, 1, "test", {}, {}, "test", @["test"], "test", "test", "test")

  test "POST /accounts/{account_id}/devices/registrations/revoke":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesRegistrationsRevoke("test", @["test"])

  test "POST /accounts/{account_id}/devices/registrations/unrevoke":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesRegistrationsUnrevoke("test", @["test"])

  test "GET /accounts/{account_id}/devices/registrations/{registration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesRegistrationsRegistrationId("test", "test", "test")

  test "DELETE /accounts/{account_id}/devices/registrations/{registration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesRegistrationsRegistrationId("test", "test")

