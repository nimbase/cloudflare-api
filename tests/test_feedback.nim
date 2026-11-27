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
  test "round-trips FeedbackFeedbackReceipt":
    let obj = newFeedbackFeedbackReceipt()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackFeedbackReceipt)) == openjson.toJson(obj)

  test "round-trips BotManagementApiResponseCommonFailure":
    let obj = newBotManagementApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FeedbackFeedbackDiagnosis":
    let obj = newFeedbackFeedbackDiagnosis()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackFeedbackDiagnosis)) == openjson.toJson(obj)

  test "round-trips BotManagementFeedbackReport":
    let obj = newBotManagementFeedbackReport()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotManagementFeedbackReport)) == openjson.toJson(obj)

  test "round-trips FeedbackFeedbackError":
    let obj = newFeedbackFeedbackError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackFeedbackError)) == openjson.toJson(obj)

  test "round-trips FeedbackFeedbackSubmission":
    let obj = newFeedbackFeedbackSubmission()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackFeedbackSubmission)) == openjson.toJson(obj)

  test "round-trips FeedbackApiResponseCommonFailure":
    let obj = newFeedbackApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FeedbackApiResponseCommon":
    let obj = newFeedbackApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FeedbackApiResponseCommon)) == openjson.toJson(obj)

suite "feedback endpoints":
  test "GET /feedback/diagnosis":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFeedbackDiagnosis()

  test "POST /feedback/send":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postFeedbackSend(newFeedbackFeedbackSubmission())

  test "GET /zones/{zone_id}/bot_management/feedback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdBotManagementFeedback("test")

  test "POST /zones/{zone_id}/bot_management/feedback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdBotManagementFeedback("test", newBotManagementFeedbackReport())

