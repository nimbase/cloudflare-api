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

suite "stream_watermark_profile serialization":
  test "round-trips StreamWatermarkResponseSingle":
    let obj = newStreamWatermarkResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamWatermarkResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamWatermarkBasicUpload":
    let obj = newStreamWatermarkBasicUpload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamWatermarkBasicUpload)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseSingle":
    let obj = newStreamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamWatermarkResponseCollection":
    let obj = newStreamWatermarkResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamWatermarkResponseCollection)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_watermark_profile endpoints":
  test "GET /accounts/{account_id}/stream/watermarks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamWatermarks("test")

  test "GET /accounts/{account_id}/stream/watermarks/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamWatermarksIdentifier("test", "test")

  test "DELETE /accounts/{account_id}/stream/watermarks/{identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamWatermarksIdentifier("test", "test")

