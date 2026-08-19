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

suite "workers_for_platforms serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersScriptResponseUploadSingle":
    let obj = newWorkersScriptResponseUploadSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseUploadSingle)) == openjson.toJson(obj)

  test "round-trips WorkersCreateAssetsUploadSessionResponse":
    let obj = newWorkersCreateAssetsUploadSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCreateAssetsUploadSessionResponse)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceScriptDeleteBulkResponse":
    let obj = newWorkersNamespaceScriptDeleteBulkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceScriptDeleteBulkResponse)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceScriptAndVersionSettingsItem":
    let obj = newWorkersNamespaceScriptAndVersionSettingsItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceScriptAndVersionSettingsItem)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceListResponse":
    let obj = newWorkersNamespaceListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceListResponse)) == openjson.toJson(obj)

  test "round-trips WorkersScriptResponseSingle":
    let obj = newWorkersScriptResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseSingle)) == openjson.toJson(obj)

  test "round-trips WorkersSecretPatchResponse":
    let obj = newWorkersSecretPatchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecretPatchResponse)) == openjson.toJson(obj)

  test "round-trips WorkersSecret":
    let obj = newWorkersSecret()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecret)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseNullResult":
    let obj = newWorkersApiResponseNullResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseNullResult)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceSingleResponse":
    let obj = newWorkersNamespaceSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceSingleResponse)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceScriptResponseSingle":
    let obj = newWorkersNamespaceScriptResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceScriptResponseSingle)) == openjson.toJson(obj)

  test "round-trips WorkersSecretPatchRequest":
    let obj = newWorkersSecretPatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSecretPatchRequest)) == openjson.toJson(obj)

  test "round-trips WorkersNamespaceScriptResponse":
    let obj = newWorkersNamespaceScriptResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespaceScriptResponse)) == openjson.toJson(obj)

  test "round-trips WorkersMultipartScript":
    let obj = newWorkersMultipartScript()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersMultipartScript)) == openjson.toJson(obj)

  test "round-trips WorkersCreateAssetsUploadSessionObject":
    let obj = newWorkersCreateAssetsUploadSessionObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersCreateAssetsUploadSessionObject)) == openjson.toJson(obj)

suite "workers_for_platforms endpoints":
  test "GET /accounts/{account_id}/workers/dispatch/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespaces("test")

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace("test", "test")

  test "DELETE /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace("test", "test")

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScripts("test", "test", "test")

  test "DELETE /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScripts("test", "test", "test", 1)

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName("test", "test", "test", {})

  test "DELETE /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName("test", "test", "test", true)

  test "POST /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/assets-upload-session":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameAssetsUploadSession("test", "test", "test", newWorkersCreateAssetsUploadSessionObject())

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/bindings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameBindings("test", "test", "test")

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameContent("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameContent("test", "test", "test")

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecrets("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecrets("test", "test", "test", newWorkersSecret())

  test "PATCH /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/secrets-bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsBulk("test", "test", "test", newWorkersSecretPatchRequest())

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/secrets/{secret_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsSecretName("test", "test", "test", "test", true)

  test "DELETE /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/secrets/{secret_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsSecretName("test", "test", "test", "test", true)

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSettings("test", "test", "test")

  test "PATCH /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSettings("test", "test", "test")

  test "GET /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTags("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/tags/{tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTagsTag("test", "test", "test", "test")

  test "DELETE /accounts/{account_id}/workers/dispatch/namespaces/{dispatch_namespace}/scripts/{script_name}/tags/{tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTagsTag("test", "test", "test", "test")

