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

suite "ai_search_tokens serialization":
  test "round-trips GetAccountsAccountIdAiSearchTokensResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchTokensResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchTokensResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchTokensResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchTokensIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchTokensIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchTokensIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchTokensIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchTokensIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchTokensIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchTokensIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchTokensIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchTokensIdResponse)) == openjson.toJson(obj)

suite "ai_search_tokens endpoints":
  test "GET /accounts/{account_id}/ai-search/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchTokens("test", 1, 1, "test")

  test "GET /accounts/{account_id}/ai-search/tokens/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchTokensId("test", "test")

  test "DELETE /accounts/{account_id}/ai-search/tokens/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchTokensId("test", "test")

