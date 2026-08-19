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

suite "memory serialization":
  test "round-trips DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse":
    let obj = cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse":
    let obj = cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse":
    let obj = cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse":
    let obj = cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse":
    let obj = cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse)) == openjson.toJson(obj)

suite "memory endpoints":
  test "DELETE /accounts/{account_id}/agent-memory/namespaces/{namespace_name}/profiles/{profile_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileName("test", "test")

  test "GET /accounts/{account_id}/agent-memory/namespaces/{namespace_name}/profiles/{profile_name}/memories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemories("test", "test", 1, "test", "test", {})

  test "GET /accounts/{account_id}/agent-memory/namespaces/{namespace_name}/profiles/{profile_name}/memories/{memory_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryId("test", "test", "test")

  test "DELETE /accounts/{account_id}/agent-memory/namespaces/{namespace_name}/profiles/{profile_name}/memories/{memory_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryId("test", "test", "test")

  test "DELETE /accounts/{account_id}/agent-memory/namespaces/{namespace_name}/profiles/{profile_name}/sessions/{session_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionId("test", "test", "test")

