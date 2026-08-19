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

suite "log_explorer_queries serialization":
  test "round-trips LexQueryResponse":
    let obj = newLexQueryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexQueryResponse)) == openjson.toJson(obj)

  test "round-trips LexErrorResponse":
    let obj = newLexErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexErrorResponse)) == openjson.toJson(obj)

suite "log_explorer_queries endpoints":
  test "GET /accounts/{account_id}/logs/explorer/query/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsExplorerQuerySql("test", "test")

  test "POST /accounts/{account_id}/logs/explorer/query/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLogsExplorerQuerySql("test")

  test "GET /zones/{zone_id}/logs/explorer/query/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsExplorerQuerySql("test", "test")

  test "POST /zones/{zone_id}/logs/explorer/query/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdLogsExplorerQuerySql("test")

