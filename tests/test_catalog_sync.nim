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

suite "catalog_sync serialization":
  test "round-trips McnDeleteCatalogSyncResponse":
    let obj = newMcnDeleteCatalogSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnDeleteCatalogSyncResponse)) == openjson.toJson(obj)

  test "round-trips McnRefreshCatalogSyncResponse":
    let obj = newMcnRefreshCatalogSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnRefreshCatalogSyncResponse)) == openjson.toJson(obj)

  test "round-trips McnReadAccountCatalogSyncsResponse":
    let obj = newMcnReadAccountCatalogSyncsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountCatalogSyncsResponse)) == openjson.toJson(obj)

  test "round-trips McnCreateCatalogSyncRequest":
    let obj = newMcnCreateCatalogSyncRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateCatalogSyncRequest)) == openjson.toJson(obj)

  test "round-trips McnCreateCatalogSyncResponse":
    let obj = newMcnCreateCatalogSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateCatalogSyncResponse)) == openjson.toJson(obj)

  test "round-trips McnUpdateCatalogSyncResponse":
    let obj = newMcnUpdateCatalogSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateCatalogSyncResponse)) == openjson.toJson(obj)

  test "round-trips McnUpdateCatalogSyncRequest":
    let obj = newMcnUpdateCatalogSyncRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateCatalogSyncRequest)) == openjson.toJson(obj)

  test "round-trips McnCatalogSyncsPrebuiltPoliciesResponse":
    let obj = newMcnCatalogSyncsPrebuiltPoliciesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCatalogSyncsPrebuiltPoliciesResponse)) == openjson.toJson(obj)

  test "round-trips McnReadAccountCatalogSyncResponse":
    let obj = newMcnReadAccountCatalogSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountCatalogSyncResponse)) == openjson.toJson(obj)

  test "round-trips McnBadResponse":
    let obj = newMcnBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnBadResponse)) == openjson.toJson(obj)

suite "catalog_sync endpoints":
  test "GET /accounts/{account_id}/magic/cloud/catalog-syncs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudCatalogSyncs("test")

  test "POST /accounts/{account_id}/magic/cloud/catalog-syncs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudCatalogSyncs("test", newMcnCreateCatalogSyncRequest())

  test "GET /accounts/{account_id}/magic/cloud/catalog-syncs/{sync_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudCatalogSyncsSyncId("test", "test")

  test "PUT /accounts/{account_id}/magic/cloud/catalog-syncs/{sync_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCloudCatalogSyncsSyncId("test", "test", newMcnUpdateCatalogSyncRequest())

  test "DELETE /accounts/{account_id}/magic/cloud/catalog-syncs/{sync_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicCloudCatalogSyncsSyncId("test", "test", true)

  test "PATCH /accounts/{account_id}/magic/cloud/catalog-syncs/{sync_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicCloudCatalogSyncsSyncId("test", "test", newMcnUpdateCatalogSyncRequest())

  test "POST /accounts/{account_id}/magic/cloud/catalog-syncs/{sync_id}/refresh":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudCatalogSyncsSyncIdRefresh("test", "test")

