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

suite "previews serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersPreview":
    let obj = newWorkersPreview()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersPreview)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "previews endpoints":
  test "GET /accounts/{account_id}/workers/workers/{worker_id}/previews":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdPreviews("test", "test", 1, 1, orderByDeployedOn, orderAsc, "test", "test")

  test "POST /accounts/{account_id}/workers/workers/{worker_id}/previews":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersWorkersWorkerIdPreviews("test", "test", true, true)

  test "GET /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId("test", "test", "test", true, true)

  test "DELETE /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId("test", "test", "test", true)

  test "PATCH /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId("test", "test", "test")

