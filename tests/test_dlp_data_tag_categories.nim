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

suite "dlp_data_tag_categories serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpNewDataTagCategory":
    let obj = newDlpNewDataTagCategory()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewDataTagCategory)) == openjson.toJson(obj)

  test "round-trips DlpDataTagCategory":
    let obj = newDlpDataTagCategory()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataTagCategory)) == openjson.toJson(obj)

  test "round-trips DlpDataTagCategoryUpdate":
    let obj = newDlpDataTagCategoryUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataTagCategoryUpdate)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_data_tag_categories endpoints":
  test "GET /accounts/{account_id}/dlp/data_tag_categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategories("test")

  test "POST /accounts/{account_id}/dlp/data_tag_categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpDataTagCategories("test", newDlpNewDataTagCategory())

  test "GET /accounts/{account_id}/dlp/data_tag_categories/{category_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategoriesCategoryId("test", "test")

  test "PUT /accounts/{account_id}/dlp/data_tag_categories/{category_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpDataTagCategoriesCategoryId("test", "test", newDlpDataTagCategoryUpdate())

  test "DELETE /accounts/{account_id}/dlp/data_tag_categories/{category_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpDataTagCategoriesCategoryId("test", "test")

