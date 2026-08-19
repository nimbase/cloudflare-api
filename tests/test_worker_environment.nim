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

suite "worker_environment serialization":
  test "round-trips WorkersScriptResponseSingle":
    let obj = newWorkersScriptResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptResponseSingle)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersScriptSettingsResponse":
    let obj = newWorkersScriptSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersScriptSettingsResponse)) == openjson.toJson(obj)

suite "worker_environment endpoints":
  test "GET /accounts/{account_id}/workers/services/{service_name}/environments/{environment_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameContent("test", "test", "test")

  test "PUT /accounts/{account_id}/workers/services/{service_name}/environments/{environment_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameContent("test", "test", "test")

  test "GET /accounts/{account_id}/workers/services/{service_name}/environments/{environment_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameSettings("test", "test", "test")

  test "PATCH /accounts/{account_id}/workers/services/{service_name}/environments/{environment_name}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameSettings("test", "test", "test", newWorkersScriptSettingsResponse())

