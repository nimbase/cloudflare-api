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

suite "devices_resilience serialization":
  test "round-trips TeamsDevicesIdentifier":
    let obj = newTeamsDevicesIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdentifier)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesGlobalWarpOverrideResponse":
    let obj = newTeamsDevicesGlobalWarpOverrideResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesGlobalWarpOverrideResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesGlobalWarpOverrideRequest":
    let obj = newTeamsDevicesGlobalWarpOverrideRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesGlobalWarpOverrideRequest)) == openjson.toJson(obj)

suite "devices_resilience endpoints":
  test "GET /accounts/{account_id}/devices/resilience/disconnect":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesResilienceDisconnect(newTeamsDevicesIdentifier())

  test "POST /accounts/{account_id}/devices/resilience/disconnect":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesResilienceDisconnect(newTeamsDevicesIdentifier(), newTeamsDevicesGlobalWarpOverrideRequest())

