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

suite "table_maintenance_configuration serialization":
  test "round-trips R2DataCatalogApiResponseSingle":
    let obj = newR2DataCatalogApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogTableMaintenanceConfigResponse":
    let obj = newR2DataCatalogTableMaintenanceConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogTableMaintenanceConfigResponse)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogTableMaintenanceUpdateRequest":
    let obj = newR2DataCatalogTableMaintenanceUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogTableMaintenanceUpdateRequest)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogApiResponseCommonFailure":
    let obj = newR2DataCatalogApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips R2DataCatalogTableMaintenanceConfig":
    let obj = newR2DataCatalogTableMaintenanceConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2DataCatalogTableMaintenanceConfig)) == openjson.toJson(obj)

suite "table_maintenance_configuration endpoints":
  test "GET /accounts/{account_id}/r2-catalog/{bucket_name}/namespaces/{namespace}/tables/{table_name}/maintenance-configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceConfigs("test", "test", "test", "test")

  test "POST /accounts/{account_id}/r2-catalog/{bucket_name}/namespaces/{namespace}/tables/{table_name}/maintenance-configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceConfigs("test", "test", "test", "test", newR2DataCatalogTableMaintenanceUpdateRequest())

