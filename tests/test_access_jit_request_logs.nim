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

suite "access_jit_request_logs serialization":
  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection12":
    let obj = newAccessResponseCollection12()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection12)) == openjson.toJson(obj)

  test "round-trips AccessResponseSingle":
    let obj = newAccessResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseSingle)) == openjson.toJson(obj)

suite "access_jit_request_logs endpoints":
  test "GET /accounts/{account_id}/access/logs/jit_requests/{knock_request_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessLogsJitRequestsKnockRequestId("test", "test")

