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

suite "access_authentication_logs serialization":
  test "round-trips AccessResponseCollection11":
    let obj = newAccessResponseCollection11()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection11)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

suite "access_authentication_logs endpoints":
  test "GET /accounts/{account_id}/access/logs/access_requests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessLogsAccessRequests("test", 1, {}, "test", "test", 1, 1, "test", true, "test", {}, {}, {}, {}, {}, {}, {}, {}, {}, "test")

