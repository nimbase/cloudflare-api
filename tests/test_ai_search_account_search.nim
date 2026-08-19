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

suite "ai_search_account_search serialization":
  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameSearchResponse)) == openjson.toJson(obj)

suite "ai_search_account_search endpoints":
  test "module has no sampleable endpoints":
    check true

