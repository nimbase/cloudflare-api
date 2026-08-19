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

suite "custom_pages_for_an_account serialization":
  test "round-trips CustomPagesPreviewTokenResult":
    let obj = newCustomPagesPreviewTokenResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesPreviewTokenResult)) == openjson.toJson(obj)

  test "round-trips CustomPagesCustomPageResult":
    let obj = newCustomPagesCustomPageResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesCustomPageResult)) == openjson.toJson(obj)

  test "round-trips CustomPagesPreviewRequest":
    let obj = newCustomPagesPreviewRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesPreviewRequest)) == openjson.toJson(obj)

  test "round-trips CustomPagesCustomPageResultList":
    let obj = newCustomPagesCustomPageResultList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesCustomPageResultList)) == openjson.toJson(obj)

  test "round-trips CustomPagesApiResponseCommonFailure":
    let obj = newCustomPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomPagesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_pages_for_an_account endpoints":
  test "GET /accounts/{account_identifier}/custom_pages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdentifierCustomPages("test")

  test "POST /accounts/{account_identifier}/custom_pages/preview_tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdentifierCustomPagesPreviewTokens("test", newCustomPagesPreviewRequest())

