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

suite "triggers serialization":
  test "round-trips BuildsCreateTriggerRequest":
    let obj = newBuildsCreateTriggerRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateTriggerRequest)) == openjson.toJson(obj)

  test "round-trips BuildsInsertBuildResponse":
    let obj = newBuildsInsertBuildResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsInsertBuildResponse)) == openjson.toJson(obj)

  test "round-trips BuildsUpdateTriggerRequest":
    let obj = newBuildsUpdateTriggerRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsUpdateTriggerRequest)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCreateBuildRequest":
    let obj = newBuildsCreateBuildRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateBuildRequest)) == openjson.toJson(obj)

  test "round-trips BuildsTriggerResponse":
    let obj = newBuildsTriggerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsTriggerResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "triggers endpoints":
  test "POST /accounts/{account_id}/builds/triggers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsTriggers("test", newBuildsCreateTriggerRequest())

  test "DELETE /accounts/{account_id}/builds/triggers/{trigger_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsTriggersTriggerUuid("test", "test")

  test "PATCH /accounts/{account_id}/builds/triggers/{trigger_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBuildsTriggersTriggerUuid("test", "test", newBuildsUpdateTriggerRequest())

  test "POST /accounts/{account_id}/builds/triggers/{trigger_uuid}/builds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsTriggersTriggerUuidBuilds("test", "test", newBuildsCreateBuildRequest())

  test "POST /accounts/{account_id}/builds/triggers/{trigger_uuid}/purge_build_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsTriggersTriggerUuidPurgeBuildCache("test", "test")

