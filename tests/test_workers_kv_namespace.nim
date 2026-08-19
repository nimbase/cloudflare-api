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

suite "workers_kv_namespace serialization":
  test "round-trips WorkersKvApiResponseCommonNoResult":
    let obj = newWorkersKvApiResponseCommonNoResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvApiResponseCommonNoResult)) == openjson.toJson(obj)

  test "round-trips WorkersKvCursorResultInfo":
    let obj = newWorkersKvCursorResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvCursorResultInfo)) == openjson.toJson(obj)

  test "round-trips WorkersKvApiResponseCollection":
    let obj = newWorkersKvApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips WorkersKvValue":
    let obj = newWorkersKvValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvValue)) == openjson.toJson(obj)

  test "round-trips WorkersKvKey":
    let obj = newWorkersKvKey()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvKey)) == openjson.toJson(obj)

  test "round-trips WorkersKvNamespace":
    let obj = newWorkersKvNamespace()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvNamespace)) == openjson.toJson(obj)

  test "round-trips WorkersKvCreateRenameNamespaceBody":
    let obj = newWorkersKvCreateRenameNamespaceBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvCreateRenameNamespaceBody)) == openjson.toJson(obj)

  test "round-trips WorkersKvApiResponseCommon":
    let obj = newWorkersKvApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersKvBulkResult":
    let obj = newWorkersKvBulkResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvBulkResult)) == openjson.toJson(obj)

  test "round-trips WorkersKvMetadata":
    let obj = newWorkersKvMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvMetadata)) == openjson.toJson(obj)

  test "round-trips WorkersKvListMetadata":
    let obj = newWorkersKvListMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvListMetadata)) == openjson.toJson(obj)

  test "round-trips WorkersKvApiResponseCommonFailure":
    let obj = newWorkersKvApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersKvApiResponseCommonFailure)) == openjson.toJson(obj)

suite "workers_kv_namespace endpoints":
  test "GET /accounts/{account_id}/storage/kv/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStorageKvNamespaces("test", 1.0, 1.0, {}, {})

  test "POST /accounts/{account_id}/storage/kv/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStorageKvNamespaces("test", newWorkersKvCreateRenameNamespaceBody())

  test "GET /accounts/{account_id}/storage/kv/namespaces/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStorageKvNamespacesNamespaceId("test", "test")

  test "PUT /accounts/{account_id}/storage/kv/namespaces/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStorageKvNamespacesNamespaceId("test", "test", newWorkersKvCreateRenameNamespaceBody())

  test "DELETE /accounts/{account_id}/storage/kv/namespaces/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStorageKvNamespacesNamespaceId("test", "test")

  test "GET /accounts/{account_id}/storage/kv/namespaces/{namespace_id}/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStorageKvNamespacesNamespaceIdKeys("test", "test", 1.0, "test", "test")

  test "GET /accounts/{account_id}/storage/kv/namespaces/{namespace_id}/metadata/{key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStorageKvNamespacesNamespaceIdMetadataKeyName("test", "test", "test")

  test "GET /accounts/{account_id}/storage/kv/namespaces/{namespace_id}/values/{key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName("test", "test", "test")

  test "PUT /accounts/{account_id}/storage/kv/namespaces/{namespace_id}/values/{key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName("test", "test", "test", 1.0, 1.0)

  test "DELETE /accounts/{account_id}/storage/kv/namespaces/{namespace_id}/values/{key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName("test", "test", "test")

