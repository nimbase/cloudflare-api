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

suite "durable_objects_namespace serialization":
  test "round-trips WorkersNamespace":
    let obj = newWorkersNamespace()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersNamespace)) == openjson.toJson(obj)

  test "round-trips WorkersObject":
    let obj = newWorkersObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObject)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "durable_objects_namespace endpoints":
  test "GET /accounts/{account_id}/workers/durable_objects/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDurableObjectsNamespaces("test", 1, 1)

  test "GET /accounts/{account_id}/workers/durable_objects/namespaces/{id}/objects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDurableObjectsNamespacesIdObjects("test", "test", 1.0, "test")

