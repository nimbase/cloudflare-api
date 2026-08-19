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

suite "logpull serialization":
  test "round-trips GetAccountsAccountIdLogsListResponse":
    let obj = cloudflare.GetAccountsAccountIdLogsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdLogsListResponse)) == openjson.toJson(obj)

suite "logpull endpoints":
  test "GET /accounts/{account_id}/logs/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsList("test", "test", "test", "test", "test", 1)

  test "GET /accounts/{account_id}/logs/retrieve":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsRetrieve("test", "test", "test", "test", "test")

