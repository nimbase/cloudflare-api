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

suite "builds serialization":
  test "round-trips BuildsLatestBuildsResponse":
    let obj = newBuildsLatestBuildsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsLatestBuildsResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCanceledBuildResponse":
    let obj = newBuildsCanceledBuildResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCanceledBuildResponse)) == openjson.toJson(obj)

  test "round-trips BuildsBuildsByVersionResponse":
    let obj = newBuildsBuildsByVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsBuildsByVersionResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsBuildResponse":
    let obj = newBuildsBuildResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsBuildResponse)) == openjson.toJson(obj)

  test "round-trips BuildsBuildLogsResponse":
    let obj = newBuildsBuildLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsBuildLogsResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "builds endpoints":
  test "GET /accounts/{account_id}/builds/builds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsBuilds("test", "test")

  test "GET /accounts/{account_id}/builds/builds/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsBuildsLatest("test", "test")

  test "GET /accounts/{account_id}/builds/builds/{build_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsBuildsBuildUuid("test", "test")

  test "PUT /accounts/{account_id}/builds/builds/{build_uuid}/cancel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBuildsBuildsBuildUuidCancel("test", "test")

  test "GET /accounts/{account_id}/builds/builds/{build_uuid}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsBuildsBuildUuidLogs("test", "test", "test")

