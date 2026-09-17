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

suite "analytics_sql serialization":
  test "round-trips AnalyticsSqlSqlQueryResponse":
    let obj = newAnalyticsSqlSqlQueryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AnalyticsSqlSqlQueryResponse)) == openjson.toJson(obj)

  test "round-trips AnalyticsSqlIntrospectionResponse":
    let obj = newAnalyticsSqlIntrospectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AnalyticsSqlIntrospectionResponse)) == openjson.toJson(obj)

  test "round-trips AnalyticsSqlSqlQueryRequest":
    let obj = newAnalyticsSqlSqlQueryRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AnalyticsSqlSqlQueryRequest)) == openjson.toJson(obj)

  test "round-trips AnalyticsSqlApiErrorResponse":
    let obj = newAnalyticsSqlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AnalyticsSqlApiErrorResponse)) == openjson.toJson(obj)

suite "analytics_sql endpoints":
  test "GET /analytics/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAnalyticsSql("test")

  test "POST /analytics/sql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAnalyticsSql(newAnalyticsSqlSqlQueryRequest())

  test "GET /analytics/sql/introspection":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAnalyticsSqlIntrospection("test", true, "test")

