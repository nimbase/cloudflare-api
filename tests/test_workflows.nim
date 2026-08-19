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

suite "workflows serialization":
  test "round-trips GetAccountsAccountIdTriggersScriptNameResponse":
    let obj = cloudflare.GetAccountsAccountIdTriggersScriptNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdTriggersScriptNameResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdTriggersScriptNameResponse":
    let obj = cloudflare.PutAccountsAccountIdTriggersScriptNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdTriggersScriptNameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdTriggersScriptNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdTriggersScriptNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdTriggersScriptNameResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdTriggersScriptNameResponse":
    let obj = cloudflare.PatchAccountsAccountIdTriggersScriptNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdTriggersScriptNameResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsSettingsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsSettingsResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkflowsSettingsResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkflowsSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkflowsSettingsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdWorkflowsWorkflowNameResponse":
    let obj = cloudflare.PutAccountsAccountIdWorkflowsWorkflowNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdWorkflowsWorkflowNameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkflowsWorkflowNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkflowsWorkflowNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkflowsWorkflowNameResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse)) == openjson.toJson(obj)

suite "workflows endpoints":
  test "GET /accounts/{account_id}/triggers/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTriggersScriptName("test", "test")

  test "PUT /accounts/{account_id}/triggers/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdTriggersScriptName("test", "test")

  test "DELETE /accounts/{account_id}/triggers/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTriggersScriptName("test", "test")

  test "PATCH /accounts/{account_id}/triggers/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdTriggersScriptName("test", "test")

  test "GET /accounts/{account_id}/workflows":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflows(1.0, 1.0, "test", "test")

  test "GET /accounts/{account_id}/workflows/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsSettings("test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowName("test", "test")

  test "DELETE /accounts/{account_id}/workflows/{workflow_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkflowsWorkflowName("test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameInstances("test", 1.0, 1.0, "test", {}, {}, "test", "test", "test")

  test "POST /accounts/{account_id}/workflows/{workflow_name}/instances/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkflowsWorkflowNameInstancesBatch("test", "test")

  test "POST /accounts/{account_id}/workflows/{workflow_name}/instances/batch/terminate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminate("test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/instances/terminate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameInstancesTerminate("test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/instances/{instance_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceId("test", "test", {}, {}, "test")

  test "DELETE /accounts/{account_id}/workflows/{workflow_name}/instances/{instance_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceId("test", "test", "test")

  test "POST /accounts/{account_id}/workflows/{workflow_name}/instances/{instance_id}/events/{event_type}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventType("test", "test", "test", "test")

  test "PATCH /accounts/{account_id}/workflows/{workflow_name}/instances/{instance_id}/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatus("test", "test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/instances/{instance_id}/step":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStep("test", "test", "test", {}, 1, "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameVersions("test", 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/versions/{version_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionId("test", "test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/versions/{version_id}/dag":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDag("test", "test", "test")

  test "GET /accounts/{account_id}/workflows/{workflow_name}/versions/{version_id}/graph":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraph("test", "test", "test")

