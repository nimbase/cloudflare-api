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

suite "r2_account serialization":
  test "round-trips R2V4Response":
    let obj = newR2V4Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4Response)) == openjson.toJson(obj)

  test "round-trips R2V4ResponseFailure":
    let obj = newR2V4ResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4ResponseFailure)) == openjson.toJson(obj)

  test "round-trips R2AccountLevelMetrics":
    let obj = newR2AccountLevelMetrics()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2AccountLevelMetrics)) == openjson.toJson(obj)

suite "r2_account endpoints":
  test "GET /accounts/{account_id}/r2/metrics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2Metrics("test")

