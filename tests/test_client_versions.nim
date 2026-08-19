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

suite "client_versions serialization":
  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesClientVersion":
    let obj = newTeamsDevicesClientVersion()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesClientVersion)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesPaginationInfo":
    let obj = newTeamsDevicesPaginationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesPaginationInfo)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesTargetEnvironmentInfo":
    let obj = newTeamsDevicesTargetEnvironmentInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesTargetEnvironmentInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesClientVersionsResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesClientVersionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesClientVersionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse)) == openjson.toJson(obj)

suite "client_versions endpoints":
  test "GET /accounts/{account_id}/devices/client-versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesClientVersions("test", "test", {}, 1, 1)

  test "GET /accounts/{account_id}/devices/client-versions/target-environments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesClientVersionsTargetEnvironments("test")

