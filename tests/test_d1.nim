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

suite "d1 serialization":
  test "round-trips D1ReadReplicationDetailsForRequest":
    let obj = newD1ReadReplicationDetailsForRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1ReadReplicationDetailsForRequest)) == openjson.toJson(obj)

  test "round-trips D1ApiResponseCommon":
    let obj = newD1ApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1ApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips D1QueryResultResponse":
    let obj = newD1QueryResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1QueryResultResponse)) == openjson.toJson(obj)

  test "round-trips D1BatchQuery":
    let obj = newD1BatchQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1BatchQuery)) == openjson.toJson(obj)

  test "round-trips D1DatabaseUpdateRequestBody":
    let obj = newD1DatabaseUpdateRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1DatabaseUpdateRequestBody)) == openjson.toJson(obj)

  test "round-trips D1ApiResponseCommonFailure":
    let obj = newD1ApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1ApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips D1TimeTravelRestoreResponse":
    let obj = newD1TimeTravelRestoreResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1TimeTravelRestoreResponse)) == openjson.toJson(obj)

  test "round-trips D1DatabaseDetailsResponse":
    let obj = newD1DatabaseDetailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1DatabaseDetailsResponse)) == openjson.toJson(obj)

  test "round-trips D1DatabaseResponse":
    let obj = newD1DatabaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1DatabaseResponse)) == openjson.toJson(obj)

  test "round-trips D1QueryMeta":
    let obj = newD1QueryMeta()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1QueryMeta)) == openjson.toJson(obj)

  test "round-trips D1RawResultResponse":
    let obj = newD1RawResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1RawResultResponse)) == openjson.toJson(obj)

  test "round-trips D1DatabaseUpdatePartialRequestBody":
    let obj = newD1DatabaseUpdatePartialRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.D1DatabaseUpdatePartialRequestBody)) == openjson.toJson(obj)

suite "d1 endpoints":
  test "GET /accounts/{account_id}/d1/database":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdD1Database("test", "test", 1.0, 1.0)

  test "PUT /accounts/{account_id}/d1/database/{database_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdD1DatabaseDatabaseId("test", "test", newD1DatabaseUpdateRequestBody())

  test "DELETE /accounts/{account_id}/d1/database/{database_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdD1DatabaseDatabaseId("test", "test")

  test "PATCH /accounts/{account_id}/d1/database/{database_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdD1DatabaseDatabaseId("test", "test", newD1DatabaseUpdatePartialRequestBody())

  test "POST /accounts/{account_id}/d1/database/{database_id}/import":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdD1DatabaseDatabaseIdImport("test", "test")

  test "POST /accounts/{account_id}/d1/database/{database_id}/query":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdD1DatabaseDatabaseIdQuery("test", "test", newD1BatchQuery())

  test "POST /accounts/{account_id}/d1/database/{database_id}/raw":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdD1DatabaseDatabaseIdRaw("test", "test", newD1BatchQuery())

  test "GET /accounts/{account_id}/d1/database/{database_id}/time_travel/bookmark":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdD1DatabaseDatabaseIdTimeTravelBookmark("test", "test", "test")

  test "POST /accounts/{account_id}/d1/database/{database_id}/time_travel/restore":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdD1DatabaseDatabaseIdTimeTravelRestore("test", "test", "test", "test")

