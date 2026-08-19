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

suite "worker_script serialization":
  test "round-trips WorkersScriptAndVersionSettingsItem":
    let obj = newWorkersScriptAndVersionSettingsItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptAndVersionSettingsItem)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersCompletedUploadAssetsResponse":
    let obj = newWorkersCompletedUploadAssetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCompletedUploadAssetsResponse)) == openjson.toJson(obj)

  test "round-trips WorkersScriptResponseUploadSingle":
    let obj = newWorkersScriptResponseUploadSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseUploadSingle)) == openjson.toJson(obj)

  test "round-trips WorkersCreateAssetsUploadSessionResponse":
    let obj = newWorkersCreateAssetsUploadSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCreateAssetsUploadSessionResponse)) == openjson.toJson(obj)

  test "round-trips WorkersUserLimits":
    let obj = newWorkersUserLimits()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersUserLimits)) == openjson.toJson(obj)

  test "round-trips WorkersScriptResponseSingle":
    let obj = newWorkersScriptResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseSingle)) == openjson.toJson(obj)

  test "round-trips WorkersSecretPatchResponse":
    let obj = newWorkersSecretPatchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecretPatchResponse)) == openjson.toJson(obj)

  test "round-trips WorkersSecret":
    let obj = newWorkersSecret()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecret)) == openjson.toJson(obj)

  test "round-trips WorkersScriptResponseCollection":
    let obj = newWorkersScriptResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseCollection)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersScriptSettingsItem":
    let obj = newWorkersScriptSettingsItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptSettingsItem)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseNullResult":
    let obj = newWorkersApiResponseNullResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseNullResult)) == openjson.toJson(obj)

  test "round-trips WorkersUploadAssetsResponse":
    let obj = newWorkersUploadAssetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersUploadAssetsResponse)) == openjson.toJson(obj)

  test "round-trips WorkersScriptSettingsResponse":
    let obj = newWorkersScriptSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptSettingsResponse)) == openjson.toJson(obj)

  test "round-trips WorkersSecretPatchRequest":
    let obj = newWorkersSecretPatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecretPatchRequest)) == openjson.toJson(obj)

  test "round-trips WorkersSubdomain":
    let obj = newWorkersSubdomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSubdomain)) == openjson.toJson(obj)

  test "round-trips WorkersMultipartScript":
    let obj = newWorkersMultipartScript()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersMultipartScript)) == openjson.toJson(obj)

  test "round-trips WorkersCreateAssetsUploadSessionObject":
    let obj = newWorkersCreateAssetsUploadSessionObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCreateAssetsUploadSessionObject)) == openjson.toJson(obj)

  test "round-trips WorkersUsageModelResponse":
    let obj = newWorkersUsageModelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersUsageModelResponse)) == openjson.toJson(obj)

  test "round-trips WorkersScriptAndVersionSettingsResponse":
    let obj = newWorkersScriptAndVersionSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptAndVersionSettingsResponse)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "worker_script endpoints":
  test "POST /accounts/{account_id}/workers/assets/upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersAssetsUpload("test", {})

  test "GET /accounts/{account_id}/workers/scripts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScripts("test", "test")

  test "GET /accounts/{account_id}/workers/scripts-search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsSearch("test", "test", "test", {}, 1, 1)

  test "GET /accounts/{account_id}/workers/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptName("test", "test")

  test "PUT /accounts/{account_id}/workers/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersScriptsScriptName("test", "test", {})

  test "DELETE /accounts/{account_id}/workers/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersScriptsScriptName("test", "test", true)

  test "POST /accounts/{account_id}/workers/scripts/{script_name}/assets-upload-session":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersScriptsScriptNameAssetsUploadSession("test", "test", newWorkersCreateAssetsUploadSessionObject())

  test "PUT /accounts/{account_id}/workers/scripts/{script_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersScriptsScriptNameContent("test", "test")

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/content/v2":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameContentV2("test", "test")

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/script-settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameScriptSettings("test", "test")

  test "PATCH /accounts/{account_id}/workers/scripts/{script_name}/script-settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersScriptsScriptNameScriptSettings("test", "test", newWorkersScriptSettingsItem())

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameSecrets("test", "test")

  test "PUT /accounts/{account_id}/workers/scripts/{script_name}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersScriptsScriptNameSecrets("test", "test", newWorkersSecret())

  test "PATCH /accounts/{account_id}/workers/scripts/{script_name}/secrets-bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersScriptsScriptNameSecretsBulk("test", "test", newWorkersSecretPatchRequest())

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/secrets/{secret_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameSecretsSecretName("test", "test", "test", true)

  test "DELETE /accounts/{account_id}/workers/scripts/{script_name}/secrets/{secret_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersScriptsScriptNameSecretsSecretName("test", "test", "test", true)

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameSettings("test", "test")

  test "PATCH /accounts/{account_id}/workers/scripts/{script_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersScriptsScriptNameSettings("test", "test")

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/subdomain":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameSubdomain("test", "test")

  test "DELETE /accounts/{account_id}/workers/scripts/{script_name}/subdomain":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersScriptsScriptNameSubdomain("test", "test")

  test "GET /accounts/{account_id}/workers/scripts/{script_name}/usage-model":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameUsageModel("test", "test")

