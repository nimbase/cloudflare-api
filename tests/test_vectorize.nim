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

suite "vectorize serialization":
  test "round-trips VectorizeIndexInsertV2Response":
    let obj = newVectorizeIndexInsertV2Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexInsertV2Response)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateMetadataIndexResponse":
    let obj = newVectorizeCreateMetadataIndexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateMetadataIndexResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeDeleteMetadataIndexResponse":
    let obj = newVectorizeDeleteMetadataIndexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeDeleteMetadataIndexResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateMetadataIndexRequest":
    let obj = newVectorizeCreateMetadataIndexRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateMetadataIndexRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexDeleteVectorsByIdRequest":
    let obj = newVectorizeIndexDeleteVectorsByIdRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexDeleteVectorsByIdRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexListVectorsResponse":
    let obj = newVectorizeIndexListVectorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexListVectorsResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateIndexRequest":
    let obj = newVectorizeCreateIndexRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateIndexRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexInfoResponse":
    let obj = newVectorizeIndexInfoResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexInfoResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeDeleteMetadataIndexRequest":
    let obj = newVectorizeDeleteMetadataIndexRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeDeleteMetadataIndexRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexQueryV2Request":
    let obj = newVectorizeIndexQueryV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexQueryV2Request)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseSingle":
    let obj = newVectorizeApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexGetVectorsByIdRequest":
    let obj = newVectorizeIndexGetVectorsByIdRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexGetVectorsByIdRequest)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexQueryV2Response":
    let obj = newVectorizeIndexQueryV2Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexQueryV2Response)) == openjson.toJson(obj)

  test "round-trips VectorizeCreateIndexResponse":
    let obj = newVectorizeCreateIndexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeCreateIndexResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexUpsertV2Response":
    let obj = newVectorizeIndexUpsertV2Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexUpsertV2Response)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseCommon":
    let obj = newVectorizeApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips VectorizeListMetadataIndexResponse":
    let obj = newVectorizeListMetadataIndexResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeListMetadataIndexResponse)) == openjson.toJson(obj)

  test "round-trips VectorizeApiResponseCommonFailure":
    let obj = newVectorizeApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips VectorizeIndexDeleteVectorsByIdV2Response":
    let obj = newVectorizeIndexDeleteVectorsByIdV2Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.VectorizeIndexDeleteVectorsByIdV2Response)) == openjson.toJson(obj)

suite "vectorize endpoints":
  test "GET /accounts/{account_id}/vectorize/v2/indexes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeV2Indexes("test")

  test "POST /accounts/{account_id}/vectorize/v2/indexes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2Indexes("test", newVectorizeCreateIndexRequest())

  test "GET /accounts/{account_id}/vectorize/v2/indexes/{index_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeV2IndexesIndexName("test", "test")

  test "DELETE /accounts/{account_id}/vectorize/v2/indexes/{index_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdVectorizeV2IndexesIndexName("test", "test")

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/delete_by_ids":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameDeleteByIds("test", "test", newVectorizeIndexDeleteVectorsByIdRequest())

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/get_by_ids":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameGetByIds("test", "test", newVectorizeIndexGetVectorsByIdRequest())

  test "GET /accounts/{account_id}/vectorize/v2/indexes/{index_name}/info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeV2IndexesIndexNameInfo("test", "test")

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/insert":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameInsert("test", "test", {})

  test "GET /accounts/{account_id}/vectorize/v2/indexes/{index_name}/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeV2IndexesIndexNameList("test", "test", 1, "test")

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/metadata_index/create":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexCreate("test", "test", newVectorizeCreateMetadataIndexRequest())

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/metadata_index/delete":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexDelete("test", "test", newVectorizeDeleteMetadataIndexRequest())

  test "GET /accounts/{account_id}/vectorize/v2/indexes/{index_name}/metadata_index/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexList("test", "test")

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/query":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameQuery("test", "test", newVectorizeIndexQueryV2Request())

  test "POST /accounts/{account_id}/vectorize/v2/indexes/{index_name}/upsert":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdVectorizeV2IndexesIndexNameUpsert("test", "test", {})

