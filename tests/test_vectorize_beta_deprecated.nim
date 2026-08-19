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

suite "vectorize_beta_deprecated serialization":
  test "round-trips VectorizeIndexDeleteVectorsByIdRequest":
    let obj = newVectorizeIndexDeleteVectorsByIdRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexDeleteVectorsByIdRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateIndexRequest":
    let obj = newVectorizeCreateIndexRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateIndexRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexQueryRequest":
    let obj = newVectorizeIndexQueryRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexQueryRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexQueryResponse":
    let obj = newVectorizeIndexQueryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexQueryResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexUpsertResponse":
    let obj = newVectorizeIndexUpsertResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexUpsertResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeUpdateIndexRequest":
    let obj = newVectorizeUpdateIndexRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeUpdateIndexRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseSingle":
    let obj = newVectorizeApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexDeleteVectorsByIdResponse":
    let obj = newVectorizeIndexDeleteVectorsByIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexDeleteVectorsByIdResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexGetVectorsByIdRequest":
    let obj = newVectorizeIndexGetVectorsByIdRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexGetVectorsByIdRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateIndexResponse":
    let obj = newVectorizeCreateIndexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateIndexResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexInsertResponse":
    let obj = newVectorizeIndexInsertResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexInsertResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseCommon":
    let obj = newVectorizeApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseCommonFailure":
    let obj = newVectorizeApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseCommonFailure)) == openjson.toJson(obj)

suite "vectorize_beta_deprecated endpoints":
  test "GET /accounts/{account_id}/vectorize/indexes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeIndexes("test")

  test "POST /accounts/{account_id}/vectorize/indexes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexes("test", newVectorizeCreateIndexRequest())

  test "GET /accounts/{account_id}/vectorize/indexes/{index_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeIndexesIndexName("test", "test")

  test "PUT /accounts/{account_id}/vectorize/indexes/{index_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdVectorizeIndexesIndexName("test", "test", newVectorizeUpdateIndexRequest())

  test "DELETE /accounts/{account_id}/vectorize/indexes/{index_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVectorizeIndexesIndexName("test", "test")

  test "POST /accounts/{account_id}/vectorize/indexes/{index_name}/delete-by-ids":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexesIndexNameDeleteByIds("test", "test", newVectorizeIndexDeleteVectorsByIdRequest())

  test "POST /accounts/{account_id}/vectorize/indexes/{index_name}/get-by-ids":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexesIndexNameGetByIds("test", "test", newVectorizeIndexGetVectorsByIdRequest())

  test "POST /accounts/{account_id}/vectorize/indexes/{index_name}/insert":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexesIndexNameInsert("test", "test")

  test "POST /accounts/{account_id}/vectorize/indexes/{index_name}/query":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexesIndexNameQuery("test", "test", newVectorizeIndexQueryRequest())

  test "POST /accounts/{account_id}/vectorize/indexes/{index_name}/upsert":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeIndexesIndexNameUpsert("test", "test")

