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

suite "worker_cron_trigger serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersSchedule":
    let obj = newWorkersSchedule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersSchedule)) == openjson.toJson(obj)

suite "worker_cron_trigger endpoints":
  test "GET /accounts/{account_id}/workers/scripts/{script_name}/schedules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersScriptsScriptNameSchedules("test", "test")

  test "PUT /accounts/{account_id}/workers/scripts/{script_name}/schedules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersScriptsScriptNameSchedules("test", "test")

