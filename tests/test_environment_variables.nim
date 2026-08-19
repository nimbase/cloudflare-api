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

suite "environment_variables serialization":
  test "round-trips BuildsEnvironmentVariablesRequest":
    let obj = newBuildsEnvironmentVariablesRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsEnvironmentVariablesRequest)) == openjson.toJson(obj)

  test "round-trips BuildsEnvironmentVariablesResponse":
    let obj = newBuildsEnvironmentVariablesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsEnvironmentVariablesResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "environment_variables endpoints":
  test "GET /accounts/{account_id}/builds/triggers/{trigger_uuid}/environment_variables":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariables("test", "test")

  test "PATCH /accounts/{account_id}/builds/triggers/{trigger_uuid}/environment_variables":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariables("test", "test", newBuildsEnvironmentVariablesRequest())

  test "DELETE /accounts/{account_id}/builds/triggers/{trigger_uuid}/environment_variables/{environment_variable_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariablesEnvironmentVariableKey("test", "test", "test")

