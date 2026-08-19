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

suite "category serialization":
  test "round-trips AlexandriaGetCategoryResponse":
    let obj = newAlexandriaGetCategoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaGetCategoryResponse)) == openjson.toJson(obj)

  test "round-trips AlexandriaGetCategoriesResponse":
    let obj = newAlexandriaGetCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaGetCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips AlexandriaApiResponseCommonFailure":
    let obj = newAlexandriaApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)) == openjson.toJson(obj)

suite "category endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsCategories("test", @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/categories/catalog":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsCategoriesCatalog("test")

  test "GET /accounts/{account_id}/cloudforce-one/events/categories/{category_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsCategoriesCategoryId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/categories/{category_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryId("test", "test")

  test "GET /accounts/{account_id}/resource-library/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdResourceLibraryCategories("test", 1, 1)

  test "GET /accounts/{account_id}/resource-library/categories/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdResourceLibraryCategoriesId("test", 1)

