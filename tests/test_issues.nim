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

suite "issues serialization":
  test "round-trips WorkersObservabilityIssueOccurrence":
    let obj = newWorkersObservabilityIssueOccurrence()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityIssueOccurrence)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse":
    let obj = cloudflare.PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse)) == openjson.toJson(obj)

suite "issues endpoints":
  test "GET /accounts/{account_id}/workers/observability/issues":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssues(1, 1, orderAsc, orderById, "test", "test", statusActive)

  test "GET /accounts/{account_id}/workers/observability/issues/automations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssuesAutomations("test")

  test "GET /accounts/{account_id}/workers/observability/issues/automations/{automationId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationId("test")

  test "DELETE /accounts/{account_id}/workers/observability/issues/automations/{automationId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationId("test")

  test "GET /accounts/{account_id}/workers/observability/issues/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssuesSummary("test")

  test "GET /accounts/{account_id}/workers/observability/issues/{issueId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssuesIssueId("test")

  test "GET /accounts/{account_id}/workers/observability/issues/{issueId}/occurrences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrences("test", "test", 1)

