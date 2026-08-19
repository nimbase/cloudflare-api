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

suite "dlp_custom_prompt_topics serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

  test "round-trips DlpCustomPromptTopic":
    let obj = newDlpCustomPromptTopic()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCustomPromptTopic)) == openjson.toJson(obj)

suite "dlp_custom_prompt_topics endpoints":
  test "GET /accounts/{account_id}/dlp/custom_prompt_topics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpCustomPromptTopics("test")

  test "GET /accounts/{account_id}/dlp/custom_prompt_topics/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpCustomPromptTopicsEntryId("test", "test")

  test "DELETE /accounts/{account_id}/dlp/custom_prompt_topics/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpCustomPromptTopicsEntryId("test", "test")

