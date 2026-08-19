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

suite "warp_teams_device_api_other serialization":
  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesOverrideCodes":
    let obj = newTeamsDevicesOverrideCodes()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesOverrideCodes)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse)) == openjson.toJson(obj)

suite "warp_teams_device_api_other endpoints":
  test "GET /accounts/{account_id}/devices/registrations/{registration_id}/override_codes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodes("test", "test")

