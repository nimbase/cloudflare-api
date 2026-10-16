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

suite "ai_search_instances_jobs serialization":
  test "round-trips GetAccountsAccountIdAiSearchInstancesIdJobsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchInstancesIdJobsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse)) == openjson.toJson(obj)

suite "ai_search_instances_jobs endpoints":
  test "GET /accounts/{account_id}/ai-search/instances/{id}/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstancesIdJobs("test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-search/instances/{id}/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstancesIdJobsJobId("test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/instances/{id}/jobs/{job_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchInstancesIdJobsJobIdLogs("test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobs("test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobId("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{namespace}/instances/{id}/jobs/{job_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogs("test", "test", "test", "test", 1, 1)

