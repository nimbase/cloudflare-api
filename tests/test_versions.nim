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

suite "versions serialization":
  test "round-trips WorkersVersion":
    let obj = newWorkersVersion()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersVersion)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "versions endpoints":
  test "GET /accounts/{account_id}/workers/workers/{worker_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdVersions("test", "test", 1, 1)

  test "POST /accounts/{account_id}/workers/workers/{worker_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersWorkersWorkerIdVersions("test", "test", true, newWorkersVersion())

  test "PATCH /accounts/{account_id}/workers/workers/{worker_id}/versions/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersWorkersWorkerIdVersionsLatest("test", "test", true)

  test "GET /accounts/{account_id}/workers/workers/{worker_id}/versions/{version_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionId("test", "test", "test", {})

  test "DELETE /accounts/{account_id}/workers/workers/{worker_id}/versions/{version_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionId("test", "test", "test")

