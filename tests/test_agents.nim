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
  test "round-trips WorkersObservabilityAgentWindowInfo":
    let obj = newWorkersObservabilityAgentWindowInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityAgentWindowInfo)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityAgentTraceSummary":
    let obj = newWorkersObservabilityAgentTraceSummary()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityAgentTraceSummary)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityTelemetryEvent":
    let obj = newWorkersObservabilityTelemetryEvent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityTelemetryEvent)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityAgentResultInfo":
    let obj = newWorkersObservabilityAgentResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityAgentResultInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse)) == openjson.toJson(obj)

suite "agents endpoints":
  test "GET /accounts/{account_id}/workers/observability/agents/traces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityAgentsTraces("test", "test", 1, 1, 1, "test")

  test "GET /accounts/{account_id}/workers/observability/agents/traces/{traceId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityAgentsTracesTraceId("test", 1, 1)

  test "GET /accounts/{account_id}/workers/observability/agents/traces/{traceId}/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEvents("test", 1, 1, 1, "test")

