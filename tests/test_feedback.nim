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

suite "feedback serialization":
  test "round-trips BotManagementApiResponseCommonFailure":
    let obj = newBotManagementApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BotManagementFeedbackReport":
    let obj = newBotManagementFeedbackReport()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementFeedbackReport)) == openjson.toJson(obj)

suite "feedback endpoints":
  test "GET /zones/{zone_id}/bot_management/feedback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdBotManagementFeedback("test")

  test "POST /zones/{zone_id}/bot_management/feedback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdBotManagementFeedback("test", newBotManagementFeedbackReport())

