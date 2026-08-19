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

suite "maintenance_configuration serialization":
  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogMaintenanceConfigResponse":
    let obj = newR2DataCatalogCatalogMaintenanceConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogMaintenanceConfigResponse)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogMaintenanceUpdateRequest":
    let obj = newR2DataCatalogCatalogMaintenanceUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogMaintenanceUpdateRequest)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogCatalogMaintenanceConfig":
    let obj = newR2DataCatalogCatalogMaintenanceConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogCatalogMaintenanceConfig)) == openjson.toJson(obj)

suite "maintenance_configuration endpoints":
  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}/maintenance-configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketNameMaintenanceConfigs("test", "test")

  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/maintenance-configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameMaintenanceConfigs("test", "test", newR2DataCatalogCatalogMaintenanceUpdateRequest())

