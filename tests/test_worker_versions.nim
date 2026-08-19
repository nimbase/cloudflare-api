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

suite "worker_versions serialization":
  test "round-trips WorkersVersionsUploadResponse":
    let obj = newWorkersVersionsUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersVersionsUploadResponse)) == openjson.toJson(obj)

  test "round-trips WorkersCacheOptions":
    let obj = newWorkersCacheOptions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCacheOptions)) == openjson.toJson(obj)

  test "round-trips WorkersVersionsSingleResponse":
    let obj = newWorkersVersionsSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersVersionsSingleResponse)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersExportsConfigMap":
    let obj = newWorkersExportsConfigMap()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersExportsConfigMap)) == openjson.toJson(obj)

  test "round-trips WorkersVersionsListResponse":
    let obj = newWorkersVersionsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersVersionsListResponse)) == openjson.toJson(obj)

suite "worker_versions endpoints":
  test "GET /accounts/{account_id}/workers/scripts/{script_name}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameVersions("test", "test", true, 1, 1)

  test "POST /accounts/{account_id}/workers/scripts/{script_name}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersScriptsScriptNameVersions("test", "test", {})

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/versions/{version_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameVersionsVersionId("test", "test", "test")

