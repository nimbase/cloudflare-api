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

suite "agents serialization":
  test "round-trips WorkersObservabilityAgentSessionRun":
    let obj = newWorkersObservabilityAgentSessionRun()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityAgentSessionRun)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityAgentSession":
    let obj = newWorkersObservabilityAgentSession()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityAgentSession)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse)) == openjson.toJson(obj)

suite "agents endpoints":
  test "GET /accounts/{account_id}/workers/observability/agents/sessions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityAgentsSessions("test", "test", 1, 1, "test", 1)

  test "GET /accounts/{account_id}/workers/observability/agents/sessions/{conversationId}/runs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRuns("test", "test", "test", 1, 1, "test", 1)

