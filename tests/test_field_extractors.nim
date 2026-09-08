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

suite "field_extractors serialization":
  test "round-trips FieldExtractorsErrorResponse":
    let obj = newFieldExtractorsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FieldExtractorsErrorResponse)) == openjson.toJson(obj)

  test "round-trips FieldExtractorsSuccessResponse":
    let obj = newFieldExtractorsSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FieldExtractorsSuccessResponse)) == openjson.toJson(obj)

  test "round-trips FieldExtractorsDeleteResponse":
    let obj = newFieldExtractorsDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FieldExtractorsDeleteResponse)) == openjson.toJson(obj)

suite "field_extractors endpoints":
  test "GET /accounts/{account_id}/field_extractors/{extractor}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFieldExtractorsExtractor("test", "test")

  test "DELETE /accounts/{account_id}/field_extractors/{extractor}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdFieldExtractorsExtractor("test", "test")

