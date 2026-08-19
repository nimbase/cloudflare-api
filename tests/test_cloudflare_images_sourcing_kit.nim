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

suite "cloudflare_images_sourcing_kit serialization":
  test "round-trips ImagesSourcingkitMigrationCreateResponse":
    let obj = newImagesSourcingkitMigrationCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationCreateResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitMigrationLogListResponse":
    let obj = newImagesSourcingkitMigrationLogListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationLogListResponse)) == openjson.toJson(obj)

  test "round-trips ImagesDeletedResponse":
    let obj = newImagesDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesDeletedResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceCreateResponse":
    let obj = newImagesSourcingkitSourceCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceCreateResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitMigrationSingleResponse":
    let obj = newImagesSourcingkitMigrationSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationSingleResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceUpdateRequest":
    let obj = newImagesSourcingkitSourceUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceUpdateRequest)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceSingleResponse":
    let obj = newImagesSourcingkitSourceSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceSingleResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitMigrationListResponse":
    let obj = newImagesSourcingkitMigrationListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationListResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitConnectivityCheckResponse":
    let obj = newImagesSourcingkitConnectivityCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitConnectivityCheckResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceUpdateResponse":
    let obj = newImagesSourcingkitSourceUpdateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceUpdateResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitConnectivityPrecheckRequest":
    let obj = newImagesSourcingkitConnectivityPrecheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitConnectivityPrecheckRequest)) == openjson.toJson(obj)

  test "round-trips ImagesApiResponseCommonFailure":
    let obj = newImagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceListResponse":
    let obj = newImagesSourcingkitSourceListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceListResponse)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitSourceCreateRequest":
    let obj = newImagesSourcingkitSourceCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitSourceCreateRequest)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitMigrationCreateRequest":
    let obj = newImagesSourcingkitMigrationCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationCreateRequest)) == openjson.toJson(obj)

  test "round-trips ImagesSourcingkitMigrationProgressResponse":
    let obj = newImagesSourcingkitMigrationProgressResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesSourcingkitMigrationProgressResponse)) == openjson.toJson(obj)

suite "cloudflare_images_sourcing_kit endpoints":
  test "GET /accounts/{account_id}/images/v2/sourcingkit/migrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitMigrations("test", 1, 1)

  test "POST /accounts/{account_id}/images/v2/sourcingkit/migrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV2SourcingkitMigrations("test", newImagesSourcingkitMigrationCreateRequest())

  test "GET /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationId("test", "test")

  test "DELETE /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdImagesV2SourcingkitMigrationsMigrationId("test", "test")

  test "GET /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}/lifecycle":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycle("test", "test")

  test "PATCH /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}/lifecycle/abort":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycleAbort("test", "test")

  test "PATCH /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}/lifecycle/start":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycleStart("test", "test")

  test "GET /accounts/{account_id}/images/v2/sourcingkit/migrations/{migration_id}/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLogs("test", "test", 1, 1)

  test "GET /accounts/{account_id}/images/v2/sourcingkit/sources":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitSources("test", 1, 1, "test")

  test "POST /accounts/{account_id}/images/v2/sourcingkit/sources":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV2SourcingkitSources("test", newImagesSourcingkitSourceCreateRequest())

  test "POST /accounts/{account_id}/images/v2/sourcingkit/sources/connectivity-precheck":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV2SourcingkitSourcesConnectivityPrecheck("test", newImagesSourcingkitConnectivityPrecheckRequest())

  test "GET /accounts/{account_id}/images/v2/sourcingkit/sources/{source_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitSourcesSourceId("test", "test")

  test "DELETE /accounts/{account_id}/images/v2/sourcingkit/sources/{source_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdImagesV2SourcingkitSourcesSourceId("test", "test")

  test "PATCH /accounts/{account_id}/images/v2/sourcingkit/sources/{source_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV2SourcingkitSourcesSourceId("test", "test", newImagesSourcingkitSourceUpdateRequest())

  test "GET /accounts/{account_id}/images/v2/sourcingkit/sources/{source_id}/connectivity":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2SourcingkitSourcesSourceIdConnectivity("test", "test")

