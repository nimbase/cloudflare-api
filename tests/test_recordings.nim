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

suite "recordings serialization":
  test "round-trips RealtimekitGenericSuccessResponse":
    let obj = newRealtimekitGenericSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericSuccessResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitVideoConfig":
    let obj = newRealtimekitVideoConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitVideoConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitPagingResponse":
    let obj = newRealtimekitPagingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPagingResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitStartReason":
    let obj = newRealtimekitStartReason()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitStartReason)) == openjson.toJson(obj)

  test "round-trips RealtimekitGenericErrorResponse":
    let obj = newRealtimekitGenericErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitGenericErrorResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitRealtimekitBucketConfig":
    let obj = newRealtimekitRealtimekitBucketConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitRealtimekitBucketConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitLivestreamingConfig":
    let obj = newRealtimekitLivestreamingConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitLivestreamingConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitStorageConfig":
    let obj = newRealtimekitStorageConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitStorageConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitMeeting":
    let obj = newRealtimekitMeeting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitMeeting)) == openjson.toJson(obj)

  test "round-trips RealtimekitRecording":
    let obj = newRealtimekitRecording()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitRecording)) == openjson.toJson(obj)

  test "round-trips RealtimekitAudioConfig":
    let obj = newRealtimekitAudioConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitAudioConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitInteractiveConfig":
    let obj = newRealtimekitInteractiveConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitInteractiveConfig)) == openjson.toJson(obj)

  test "round-trips RealtimekitStopReason":
    let obj = newRealtimekitStopReason()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitStopReason)) == openjson.toJson(obj)

suite "recordings endpoints":
  test "GET /accounts/{account_id}/realtime/kit/{app_id}/recordings/active-recording/{meeting_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdRecordingsActiveRecordingMeetingId("test", "test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/recordings/{recording_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdRecordingsRecordingId("test", "test", "test")

