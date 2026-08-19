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

suite "sessions serialization":
  test "round-trips RealtimekitChatMessage":
    let obj = newRealtimekitChatMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitChatMessage)) == openjson.toJson(obj)

  test "round-trips RealtimekitTranscript":
    let obj = newRealtimekitTranscript()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitTranscript)) == openjson.toJson(obj)

  test "round-trips RealtimekitActiveSession":
    let obj = newRealtimekitActiveSession()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitActiveSession)) == openjson.toJson(obj)

  test "round-trips RealtimekitTranscriptSummary":
    let obj = newRealtimekitTranscriptSummary()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitTranscriptSummary)) == openjson.toJson(obj)

  test "round-trips RealtimekitPeerParticipantDetails":
    let obj = newRealtimekitPeerParticipantDetails()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPeerParticipantDetails)) == openjson.toJson(obj)

  test "round-trips RealtimekitParticipantsList":
    let obj = newRealtimekitParticipantsList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitParticipantsList)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse)) == openjson.toJson(obj)

suite "sessions endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessions("test", "test", 1.0, 1.0, {}, {}, "test", "test", "test", {}, "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/peer-report/{peer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerId("test", "test", {}, true, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionId("test", "test", true, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/chat":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChat("test", "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/participants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipants("test", "test", "test", 1.0, 1.0, {}, {}, true, {}, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/participants/{participant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantId("test", "test", true, "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummary("test", "test", "test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummary("test", "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/transcript":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscript("test", "test", "test", {})

