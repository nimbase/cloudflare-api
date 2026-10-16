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

suite "asset_schemas serialization":
  test "round-trips PostureApiAssetSchemaListResponse":
    let obj = newPostureApiAssetSchemaListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiAssetSchemaListResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiAssetSchemaResponse":
    let obj = newPostureApiAssetSchemaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiAssetSchemaResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiErrorResponse":
    let obj = newPostureApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiErrorResponse)) == openjson.toJson(obj)

suite "asset_schemas endpoints":
  test "GET /accounts/{account_id}/data-security/posture/asset_schemas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureAssetSchemas("test", vendorANTHROPIC)

  test "GET /accounts/{account_id}/data-security/posture/asset_schemas/{asset_class}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureAssetSchemasAssetClass("test", "test")

