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

suite "bot_settings serialization":
  test "round-trips BotManagementApiResponseCommonFailure":
    let obj = newBotManagementApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BotManagementBotManagementResponseBody":
    let obj = newBotManagementBotManagementResponseBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementBotManagementResponseBody)) == openjson.toJson(obj)

  test "round-trips BotManagementConfigSingle":
    let obj = newBotManagementConfigSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementConfigSingle)) == openjson.toJson(obj)

suite "bot_settings endpoints":
  test "GET /zones/{zone_id}/bot_management":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdBotManagement("test")

  test "PUT /zones/{zone_id}/bot_management":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdBotManagement("test", newBotManagementConfigSingle())

