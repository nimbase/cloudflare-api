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

suite "override_codes serialization":
  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesOverrideCode":
    let obj = newTeamsDevicesOverrideCode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesOverrideCode)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesOverrideCodeCreateRequest":
    let obj = newTeamsDevicesOverrideCodeCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesOverrideCodeCreateRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesV4ErrorResponse":
    let obj = newTeamsDevicesV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesOverrideCodesResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesOverrideCodesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesOverrideCodesResponse)) == openjson.toJson(obj)

suite "override_codes endpoints":
  test "POST /accounts/{account_id}/devices/override_codes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesOverrideCodes("test", newTeamsDevicesOverrideCodeCreateRequest())

