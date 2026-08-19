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

suite "logpush_transformers serialization":
  test "round-trips LogpushTransformerVersionResponseCollection":
    let obj = newLogpushTransformerVersionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerVersionResponseCollection)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerCreateRequest":
    let obj = newLogpushTransformerCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerCreateRequest)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerDeleteResponse":
    let obj = newLogpushTransformerDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerDeleteResponse)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerContentResponse":
    let obj = newLogpushTransformerContentResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerContentResponse)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerPreviewRequest":
    let obj = newLogpushTransformerPreviewRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerPreviewRequest)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerUpdateRequest":
    let obj = newLogpushTransformerUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerUpdateRequest)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerResponseCollection":
    let obj = newLogpushTransformerResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerResponseCollection)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerResponseSingle":
    let obj = newLogpushTransformerResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerResponseSingle)) == openjson.toJson(obj)

  test "round-trips LogpushApiResponseCommonFailure":
    let obj = newLogpushApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LogpushTransformerPreviewResponse":
    let obj = newLogpushTransformerPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushTransformerPreviewResponse)) == openjson.toJson(obj)

suite "logpush_transformers endpoints":
  test "GET /accounts/{account_id}/logpush/transformers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushTransformers("test")

  test "POST /accounts/{account_id}/logpush/transformers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLogpushTransformers("test", newLogpushTransformerCreateRequest())

  test "POST /accounts/{account_id}/logpush/transformers/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLogpushTransformersPreview("test", newLogpushTransformerPreviewRequest())

  test "GET /accounts/{account_id}/logpush/transformers/{transformer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushTransformersTransformerId("test", 1)

  test "PUT /accounts/{account_id}/logpush/transformers/{transformer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdLogpushTransformersTransformerId("test", 1, newLogpushTransformerUpdateRequest())

  test "DELETE /accounts/{account_id}/logpush/transformers/{transformer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLogpushTransformersTransformerId("test", 1)

  test "GET /accounts/{account_id}/logpush/transformers/{transformer_id}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushTransformersTransformerIdContent("test", 1, 1)

  test "GET /accounts/{account_id}/logpush/transformers/{transformer_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogpushTransformersTransformerIdVersions("test", 1, 1)

