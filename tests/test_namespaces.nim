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

suite "namespaces serialization":
  test "round-trips GetAccountsAccountIdAgentMemoryNamespacesResponse":
    let obj = cloudflare.GetAccountsAccountIdAgentMemoryNamespacesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAgentMemoryNamespacesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAgentMemoryNamespacesResponse":
    let obj = cloudflare.PostAccountsAccountIdAgentMemoryNamespacesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAgentMemoryNamespacesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse":
    let obj = cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse)) == openjson.toJson(obj)

suite "namespaces endpoints":
  test "GET /accounts/{account_id}/agent-memory/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAgentMemoryNamespaces(1, {}, {}, "test")

  test "GET /accounts/{account_id}/agent-memory/namespaces/{namespace_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAgentMemoryNamespacesNamespaceName("test")

  test "DELETE /accounts/{account_id}/agent-memory/namespaces/{namespace_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAgentMemoryNamespacesNamespaceName("test")

