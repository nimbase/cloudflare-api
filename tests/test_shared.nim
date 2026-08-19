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

suite "shared serialization":
  test "round-trips WorkersObservabilityFilterNode":
    let obj = newWorkersObservabilityFilterNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityFilterNode)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityQueryResults":
    let obj = newWorkersObservabilityQueryResults()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityQueryResults)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilitySharedQueryResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilitySharedQueryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilitySharedQueryResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse)) == openjson.toJson(obj)

suite "shared endpoints":
  test "GET /accounts/{account_id}/workers/observability/shared/query/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilitySharedQueryId("test", {})

