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

suite "remediations serialization":
  test "round-trips PostureApiRemediationJobsCreateRequest":
    let obj = newPostureApiRemediationJobsCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiRemediationJobsCreateRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiPaginatedRemediationJobList":
    let obj = newPostureApiPaginatedRemediationJobList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedRemediationJobList)) == openjson.toJson(obj)

  test "round-trips PostureApiCreateRemediationJobResponse":
    let obj = newPostureApiCreateRemediationJobResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiCreateRemediationJobResponse)) == openjson.toJson(obj)

suite "remediations endpoints":
  test "POST /accounts/{account_id}/data-security/posture/remediations/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureRemediationsJobs("test", newPostureApiRemediationJobsCreateRequest())

