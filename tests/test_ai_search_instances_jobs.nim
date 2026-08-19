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

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse)) == openjson.toJson(obj)

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

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobs("test", "test", 1, 1, "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobId("test", "test", "test", "test")

  test "GET /accounts/{account_id}/ai-search/namespaces/{name}/instances/{id}/jobs/{job_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogs("test", "test", "test", 1, 1, "test")

