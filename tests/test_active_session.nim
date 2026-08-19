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

suite "active_session serialization":
  test "round-trips RealtimekitGenericErrorResponse":
    let obj = newRealtimekitGenericErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericErrorResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitActiveSession":
    let obj = newRealtimekitActiveSession()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitActiveSession)) == openjson.toJson(obj)

  test "round-trips RealtimekitSessionParticipant":
    let obj = newRealtimekitSessionParticipant()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitSessionParticipant)) == openjson.toJson(obj)

  test "round-trips RealtimekitPoll":
    let obj = newRealtimekitPoll()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPoll)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse)) == openjson.toJson(obj)

suite "active_session endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/active-session":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSession("test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/active-session/kick-all":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAll("test", "test", "test")

