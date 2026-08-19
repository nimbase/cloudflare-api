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

suite "table_management serialization":
  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogTableListResponse":
    let obj = newR2DataCatalogTableListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogTableListResponse)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogGetTableResponse":
    let obj = newR2DataCatalogGetTableResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogGetTableResponse)) == openjson.toJson(obj)

suite "table_management endpoints":
  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}/namespaces/{namespace}/tables":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTables("test", "test", "test", "test", 1, true, true)

  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}/namespaces/{namespace}/tables/{table_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableName("test", "test", "test", "test")

