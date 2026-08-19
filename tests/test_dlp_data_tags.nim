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

suite "dlp_data_tags serialization":
  test "round-trips DlpDataTagUpdate":
    let obj = newDlpDataTagUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataTagUpdate)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpDataTag":
    let obj = newDlpDataTag()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataTag)) == openjson.toJson(obj)

  test "round-trips DlpNewDataTag":
    let obj = newDlpNewDataTag()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewDataTag)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_data_tags endpoints":
  test "GET /accounts/{account_id}/dlp/data_tag_categories/{category_id}/data_tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTags("test", "test")

  test "POST /accounts/{account_id}/dlp/data_tag_categories/{category_id}/data_tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTags("test", "test", newDlpNewDataTag())

  test "GET /accounts/{account_id}/dlp/data_tag_categories/{category_id}/data_tags/{tag_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId("test", "test", "test")

  test "PUT /accounts/{account_id}/dlp/data_tag_categories/{category_id}/data_tags/{tag_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId("test", "test", "test", newDlpDataTagUpdate())

  test "DELETE /accounts/{account_id}/dlp/data_tag_categories/{category_id}/data_tags/{tag_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId("test", "test", "test")

