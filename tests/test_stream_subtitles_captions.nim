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

suite "stream_subtitles_captions serialization":
  test "round-trips StreamLanguageResponseCollection":
    let obj = newStreamLanguageResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamLanguageResponseCollection)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommon":
    let obj = newStreamApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips StreamCaptionBasicUpload":
    let obj = newStreamCaptionBasicUpload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamCaptionBasicUpload)) == openjson.toJson(obj)

  test "round-trips StreamLanguageResponseSingle":
    let obj = newStreamLanguageResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamLanguageResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "stream_subtitles_captions endpoints":
  test "GET /accounts/{account_id}/stream/{identifier}/captions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierCaptions("test", "test")

  test "GET /accounts/{account_id}/stream/{identifier}/captions/{language}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierCaptionsLanguage("test", "test", "test")

  test "PUT /accounts/{account_id}/stream/{identifier}/captions/{language}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStreamIdentifierCaptionsLanguage("test", "test", "test")

  test "DELETE /accounts/{account_id}/stream/{identifier}/captions/{language}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamIdentifierCaptionsLanguage("test", "test", "test")

  test "POST /accounts/{account_id}/stream/{identifier}/captions/{language}/generate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamIdentifierCaptionsLanguageGenerate("test", "test", "test")

  test "GET /accounts/{account_id}/stream/{identifier}/captions/{language}/vtt":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamIdentifierCaptionsLanguageVtt("test", "test", "test")

