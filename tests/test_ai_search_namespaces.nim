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

suite "ai_search_namespaces serialization":
  test "round-trips GetAccountsAccountIdAiSearchNamespacesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAiSearchNamespacesNameResponse":
    let obj = cloudflare.PutAccountsAccountIdAiSearchNamespacesNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAiSearchNamespacesNameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiSearchNamespacesNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiSearchNamespacesNameResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)) == openjson.toJson(obj)

suite "ai_search_namespaces endpoints":
  test "GET /accounts/{account_id}/ai-search/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespaces("test", 1, 1, "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesName("test", "test")

  test "DELETE /accounts/{account_id}/ai-search/namespaces/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiSearchNamespacesName("test", "test")

