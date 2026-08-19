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

suite "meetings serialization":
  test "round-trips RealtimekitGenericSuccessResponse":
    let obj = newRealtimekitGenericSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericSuccessResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitPagingResponse":
    let obj = newRealtimekitPagingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPagingResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitGenericErrorResponse":
    let obj = newRealtimekitGenericErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericErrorResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitRecordingConfig":
    let obj = newRealtimekitRecordingConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitRecordingConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitMeeting":
    let obj = newRealtimekitMeeting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitMeeting)) == openjson.toJson(obj)

  test "round-trips RealtimekitAIConfig":
    let obj = newRealtimekitAIConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitAIConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitParticipant":
    let obj = newRealtimekitParticipant()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitParticipant)) == openjson.toJson(obj)

suite "meetings endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetings("test", "test", 1.0, 1.0, "test", "test", "test", {})

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingId("test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/participants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipants("test", "test", 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/participants/{participant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId("test", "test")

  test "DELETE /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/participants/{participant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId("test", "test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/participants/{participant_id}/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdToken("test", "test", "test", "test")

