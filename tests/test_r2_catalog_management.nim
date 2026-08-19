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

suite "r2_catalog_management serialization":
  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogActivationResponse":
    let obj = newR2DataCatalogCatalogActivationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogActivationResponse)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalog":
    let obj = newR2DataCatalogCatalog()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalog)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogList":
    let obj = newR2DataCatalogCatalogList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogList)) == openjson.toJson(obj)

suite "r2_catalog_management endpoints":
  test "GET /accounts/{account_id}/r2-catalog":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2Catalog("test")

  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketName("test", "test")

  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/delete":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameDelete("test", "test", true)

  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/disable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameDisable("test", "test")

  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameEnable("test", "test")

