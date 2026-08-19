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

suite "saved_queries serialization":
  test "round-trips WorkersObservabilityQuery":
    let obj = newWorkersObservabilityQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityQuery)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityFilterNode":
    let obj = newWorkersObservabilityFilterNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityFilterNode)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityQueriesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityQueriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityQueriesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityQueriesResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityQueriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityQueriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)) == openjson.toJson(obj)

suite "saved_queries endpoints":
  test "GET /accounts/{account_id}/workers/observability/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityQueries(1.0, 1.0, {}, {})

  test "GET /accounts/{account_id}/workers/observability/queries/{queryId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityQueriesQueryId("test")

  test "DELETE /accounts/{account_id}/workers/observability/queries/{queryId}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersObservabilityQueriesQueryId("test")

