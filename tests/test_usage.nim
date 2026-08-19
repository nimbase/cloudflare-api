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

suite "usage serialization":
  test "round-trips GetAccountsAccountIdWorkersObservabilityUsageResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityUsageResponse)) == openjson.toJson(obj)

suite "usage endpoints":
  test "GET /accounts/{account_id}/workers/observability/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityUsage("test", "test")

