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

suite "namespace_management serialization":
  test "round-trips R2DataCatalogNamespaceListResponse":
    let obj = newR2DataCatalogNamespaceListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogNamespaceListResponse)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

suite "namespace_management endpoints":
  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketNameNamespaces("test", "test", "test", 1, "test", true, true)

