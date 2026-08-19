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

suite "workers serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips BuildsWorkerResponse":
    let obj = newBuildsWorkerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsWorkerResponse)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersErrorWorkerNotFound":
    let obj = newWorkersErrorWorkerNotFound()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersErrorWorkerNotFound)) == openjson.toJson(obj)

  test "round-trips WorkersErrorInternalServer":
    let obj = newWorkersErrorInternalServer()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersErrorInternalServer)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsUpdateWorkerRequest":
    let obj = newBuildsUpdateWorkerRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsUpdateWorkerRequest)) == openjson.toJson(obj)

  test "round-trips BuildsBuildResponse":
    let obj = newBuildsBuildResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsBuildResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCreateWorkerRequest":
    let obj = newBuildsCreateWorkerRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateWorkerRequest)) == openjson.toJson(obj)

  test "round-trips BuildsTriggerResponse":
    let obj = newBuildsTriggerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsTriggerResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

  test "round-trips WorkersWorker":
    let obj = newWorkersWorker()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersWorker)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips WorkersErrorAuth":
    let obj = newWorkersErrorAuth()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersErrorAuth)) == openjson.toJson(obj)

  test "round-trips BuildsPaginationInfo":
    let obj = newBuildsPaginationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsPaginationInfo)) == openjson.toJson(obj)

suite "workers endpoints":
  test "POST /accounts/{account_id}/builds/workers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsWorkers("test", newBuildsCreateWorkerRequest())

  test "GET /accounts/{account_id}/builds/workers/{external_script_id}/builds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsWorkersExternalScriptIdBuilds("test", "test", 1, 1)

  test "GET /accounts/{account_id}/builds/workers/{external_script_id}/triggers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsWorkersExternalScriptIdTriggers("test", "test")

  test "GET /accounts/{account_id}/builds/workers/{script_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsWorkersScriptTag("test", "test")

  test "DELETE /accounts/{account_id}/builds/workers/{script_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsWorkersScriptTag("test", "test")

  test "PATCH /accounts/{account_id}/builds/workers/{script_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBuildsWorkersScriptTag("test", "test", newBuildsUpdateWorkerRequest())

  test "GET /accounts/{account_id}/workers/workers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkers("test", 1, 1, {}, {})

  test "POST /accounts/{account_id}/workers/workers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersWorkers("test")

  test "GET /accounts/{account_id}/workers/workers/{worker_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerId("test", "test")

  test "PUT /accounts/{account_id}/workers/workers/{worker_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersWorkersWorkerId("test", "test")

  test "DELETE /accounts/{account_id}/workers/workers/{worker_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersWorkersWorkerId("test", "test")

  test "PATCH /accounts/{account_id}/workers/workers/{worker_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersWorkersWorkerId("test", "test")

