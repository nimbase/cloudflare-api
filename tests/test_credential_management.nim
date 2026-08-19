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

suite "credential_management serialization":
  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogCredentialRequest":
    let obj = newR2DataCatalogCatalogCredentialRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogCredentialRequest)) == openjson.toJson(obj)

suite "credential_management endpoints":
  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/credential":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameCredential("test", "test", newR2DataCatalogCatalogCredentialRequest())

