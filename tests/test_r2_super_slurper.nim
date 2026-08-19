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

suite "r2_super_slurper serialization":
  test "round-trips R2SlurperJobProgressResponse":
    let obj = newR2SlurperJobProgressResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperJobProgressResponse)) == openjson.toJson(obj)

  test "round-trips R2SlurperSourceJobSchema":
    let obj = newR2SlurperSourceJobSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperSourceJobSchema)) == openjson.toJson(obj)

  test "round-trips R2SlurperJobLogResponse":
    let obj = newR2SlurperJobLogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperJobLogResponse)) == openjson.toJson(obj)

  test "round-trips R2SlurperConnectivityResponse":
    let obj = newR2SlurperConnectivityResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperConnectivityResponse)) == openjson.toJson(obj)

  test "round-trips R2SlurperR2TargetSchema":
    let obj = newR2SlurperR2TargetSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperR2TargetSchema)) == openjson.toJson(obj)

  test "round-trips R2SlurperJobResponse":
    let obj = newR2SlurperJobResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperJobResponse)) == openjson.toJson(obj)

  test "round-trips R2SlurperCreateJobRequest":
    let obj = newR2SlurperCreateJobRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperCreateJobRequest)) == openjson.toJson(obj)

  test "round-trips R2SlurperApiV4Success":
    let obj = newR2SlurperApiV4Success()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperApiV4Success)) == openjson.toJson(obj)

  test "round-trips R2SlurperApiV4Failure":
    let obj = newR2SlurperApiV4Failure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2SlurperApiV4Failure)) == openjson.toJson(obj)

suite "r2_super_slurper endpoints":
  test "GET /accounts/{account_id}/slurper/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSlurperJobs("test", 1, 1)

  test "POST /accounts/{account_id}/slurper/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSlurperJobs("test", newR2SlurperCreateJobRequest())

  test "PUT /accounts/{account_id}/slurper/jobs/abortAll":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperJobsAbortAll("test")

  test "GET /accounts/{account_id}/slurper/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSlurperJobsJobId("test", "test")

  test "DELETE /accounts/{account_id}/slurper/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSlurperJobsJobId("test", "test")

  test "PUT /accounts/{account_id}/slurper/jobs/{job_id}/abort":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperJobsJobIdAbort("test", "test")

  test "GET /accounts/{account_id}/slurper/jobs/{job_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSlurperJobsJobIdLogs("test", "test", 1, 1)

  test "PUT /accounts/{account_id}/slurper/jobs/{job_id}/pause":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperJobsJobIdPause("test", "test")

  test "GET /accounts/{account_id}/slurper/jobs/{job_id}/progress":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSlurperJobsJobIdProgress("test", "test")

  test "PUT /accounts/{account_id}/slurper/jobs/{job_id}/resume":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperJobsJobIdResume("test", "test")

  test "PUT /accounts/{account_id}/slurper/source/connectivity-precheck":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperSourceConnectivityPrecheck("test", newR2SlurperSourceJobSchema())

  test "PUT /accounts/{account_id}/slurper/target/connectivity-precheck":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSlurperTargetConnectivityPrecheck("test", newR2SlurperR2TargetSchema())

