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

suite "deploy_hooks serialization":
  test "round-trips BuildsDeployHookResponse":
    let obj = newBuildsDeployHookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsDeployHookResponse)) == openjson.toJson(obj)

  test "round-trips BuildsDetailedDeployHookResponse":
    let obj = newBuildsDetailedDeployHookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsDetailedDeployHookResponse)) == openjson.toJson(obj)

  test "round-trips BuildsTriggerDeployHookResponse":
    let obj = newBuildsTriggerDeployHookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsTriggerDeployHookResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCreateDeployHookRequest":
    let obj = newBuildsCreateDeployHookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateDeployHookRequest)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "deploy_hooks endpoints":
  test "GET /accounts/{account_id}/builds/workers/{script_name}/deploy_hooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsWorkersScriptNameDeployHooks("test", "test")

  test "POST /accounts/{account_id}/builds/workers/{script_name}/deploy_hooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsWorkersScriptNameDeployHooks("test", "test", newBuildsCreateDeployHookRequest())

  test "GET /accounts/{account_id}/builds/workers/{script_name}/deploy_hooks/{deploy_hook_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid("test", "test", "test")

  test "PUT /accounts/{account_id}/builds/workers/{script_name}/deploy_hooks/{deploy_hook_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid("test", "test", "test", newBuildsCreateDeployHookRequest())

  test "DELETE /accounts/{account_id}/builds/workers/{script_name}/deploy_hooks/{deploy_hook_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid("test", "test", "test")

  test "POST /workers/builds/deploy_hooks/{deploy_hook_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postWorkersBuildsDeployHooksDeployHookUuid("test")

