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

suite "autorag_jobs serialization":
  test "round-trips GetAccountsAccountIdAutoragRagsIdJobsResponse":
    let obj = cloudflare.GetAccountsAccountIdAutoragRagsIdJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAutoragRagsIdJobsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse":
    let obj = cloudflare.GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse)) == openjson.toJson(obj)

suite "autorag_jobs endpoints":
  test "GET /accounts/{account_id}/autorag/rags/{id}/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAutoragRagsIdJobs("test", "test", 1, 1)

  test "GET /accounts/{account_id}/autorag/rags/{id}/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAutoragRagsIdJobsJobId("test", "test", "test")

  test "GET /accounts/{account_id}/autorag/rags/{id}/jobs/{job_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAutoragRagsIdJobsJobIdLogs("test", "test", "test", 1, 1)

