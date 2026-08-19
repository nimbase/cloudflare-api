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

suite "worker_deployments serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersDeployment":
    let obj = newWorkersDeployment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersDeployment)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

suite "worker_deployments endpoints":
  test "GET /accounts/{account_id}/workers/scripts/{script_name}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameDeployments("test", "test")

  test "POST /accounts/{account_id}/workers/scripts/{script_name}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersScriptsScriptNameDeployments("test", "test", true, newWorkersDeployment())

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameDeploymentsDeploymentId("test", "test", "test")

  test "DELETE /accounts/{account_id}/workers/scripts/{script_name}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersScriptsScriptNameDeploymentsDeploymentId("test", "test", "test")

