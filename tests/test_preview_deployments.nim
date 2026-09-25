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

suite "preview_deployments serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersPreviewDeploymentRequest":
    let obj = newWorkersPreviewDeploymentRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersPreviewDeploymentRequest)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersPreviewDeployment":
    let obj = newWorkersPreviewDeployment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersPreviewDeployment)) == openjson.toJson(obj)

  test "round-trips WorkersPreviewDeploymentConfig":
    let obj = newWorkersPreviewDeploymentConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersPreviewDeploymentConfig)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "preview_deployments endpoints":
  test "GET /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeployments("test", "test", "test", 1, 1)

  test "POST /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeployments("test", "test", "test", true, newWorkersPreviewDeploymentRequest())

  test "PATCH /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}/deployments/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsLatest("test", "test", "test", true, newWorkersPreviewDeploymentRequest())

  test "GET /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentId("test", "test", "test", "test", includeModules)

  test "DELETE /accounts/{account_id}/workers/workers/{worker_id}/previews/{preview_id}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentId("test", "test", "test", "test")

