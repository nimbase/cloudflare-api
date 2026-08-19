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

suite "stream_video_clipping serialization":
  test "round-trips StreamClipResponseSingle":
    let obj = newStreamClipResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamClipResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamVideoClipStandard":
    let obj = newStreamVideoClipStandard()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamVideoClipStandard)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_video_clipping endpoints":
  test "POST /accounts/{account_id}/stream/clip":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamClip("test", newStreamVideoClipStandard())

