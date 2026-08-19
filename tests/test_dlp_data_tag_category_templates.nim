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

suite "dlp_data_tag_category_templates serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpDataTagCategoryTemplate":
    let obj = newDlpDataTagCategoryTemplate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataTagCategoryTemplate)) == openjson.toJson(obj)

suite "dlp_data_tag_category_templates endpoints":
  test "GET /accounts/{account_id}/dlp/data_tag_category_templates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategoryTemplates("test")

  test "GET /accounts/{account_id}/dlp/data_tag_category_templates/{template_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataTagCategoryTemplatesTemplateId("test", "test")

