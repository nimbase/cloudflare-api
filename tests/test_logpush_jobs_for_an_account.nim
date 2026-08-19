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

suite "logpush_jobs_for_an_account serialization":
  test "round-trips LogpushLogpushFieldResponseCollection":
    let obj = newLogpushLogpushFieldResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushLogpushFieldResponseCollection)) == openjson.toJson(obj)

  test "round-trips LogpushOutputOptions":
    let obj = newLogpushOutputOptions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushOutputOptions)) == openjson.toJson(obj)

  test "round-trips LogpushLogpushJobResponseSingle":
    let obj = newLogpushLogpushJobResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushLogpushJobResponseSingle)) == openjson.toJson(obj)

  test "round-trips LogpushApiResponseCommon":
    let obj = newLogpushApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips LogpushValidateResponse":
    let obj = newLogpushValidateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushValidateResponse)) == openjson.toJson(obj)

  test "round-trips LogpushDestinationExistsResponse":
    let obj = newLogpushDestinationExistsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushDestinationExistsResponse)) == openjson.toJson(obj)

  test "round-trips LogpushValidateOwnershipResponse":
    let obj = newLogpushValidateOwnershipResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushValidateOwnershipResponse)) == openjson.toJson(obj)

  test "round-trips LogpushApiResponseCommonFailure":
    let obj = newLogpushApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LogpushLogpushJobResponseCollection":
    let obj = newLogpushLogpushJobResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushLogpushJobResponseCollection)) == openjson.toJson(obj)

  test "round-trips LogpushGetOwnershipResponse":
    let obj = newLogpushGetOwnershipResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushGetOwnershipResponse)) == openjson.toJson(obj)

suite "logpush_jobs_for_an_account endpoints":
  test "GET /accounts/{account_id}/logpush/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushJobs("test")

  test "GET /accounts/{account_id}/logpush/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushJobsJobId(1, "test")

  test "DELETE /accounts/{account_id}/logpush/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLogpushJobsJobId(1, "test")

