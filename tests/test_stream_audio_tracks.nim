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

suite "stream_audio_tracks serialization":
  test "round-trips StreamEditAudioTrack":
    let obj = newStreamEditAudioTrack()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamEditAudioTrack)) == openjson.toJson(obj)

  test "round-trips StreamCopyAudioTrack":
    let obj = newStreamCopyAudioTrack()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamCopyAudioTrack)) == openjson.toJson(obj)

  test "round-trips StreamAddAudioTrackResponse":
    let obj = newStreamAddAudioTrackResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamAddAudioTrackResponse)) == openjson.toJson(obj)

  test "round-trips StreamDeletedResponse":
    let obj = newStreamDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamDeletedResponse)) == openjson.toJson(obj)

  test "round-trips StreamListAudioTrackResponse":
    let obj = newStreamListAudioTrackResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamListAudioTrackResponse)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_audio_tracks endpoints":
  test "GET /accounts/{account_id}/stream/{identifier}/audio":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierAudio("test", "test")

  test "POST /accounts/{account_id}/stream/{identifier}/audio/copy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamIdentifierAudioCopy("test", "test", newStreamCopyAudioTrack())

  test "DELETE /accounts/{account_id}/stream/{identifier}/audio/{audio_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamIdentifierAudioAudioIdentifier("test", "test", "test")

  test "PATCH /accounts/{account_id}/stream/{identifier}/audio/{audio_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdStreamIdentifierAudioAudioIdentifier("test", "test", "test", newStreamEditAudioTrack())

