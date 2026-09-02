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

suite "live_streams serialization":
  test "round-trips GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse)) == openjson.toJson(obj)

suite "live_streams endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/analytics/livestreams/daywise":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywise("test", "test", 1, 1, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/analytics/livestreams/overall":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverall("test", "test", 1, 1, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/livestreams":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdLivestreams(true, 1, 1, {}, "test", "test", {})

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/livestreams/sessions/{livestream-session-id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionId("test", "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/livestreams/{livestream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamId("test", "test", 1, 1, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/livestreams/{livestream_id}/active-livestream-session":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSession("test", "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/active-livestream":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestream("test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/active-livestream/stop":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStop("test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/meetings/{meeting_id}/livestream":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestream(1, 1, "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/sessions/{session_id}/livestream-sessions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessions("test", "test", 1.0, 1.0, "test")

