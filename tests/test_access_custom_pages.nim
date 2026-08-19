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

suite "access_custom_pages serialization":
  test "round-trips AccessSingleResponseWithoutHtml":
    let obj = newAccessSingleResponseWithoutHtml()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponseWithoutHtml)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection10":
    let obj = newAccessResponseCollection10()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection10)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse3":
    let obj = newAccessIdResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse3)) == openjson.toJson(obj)

  test "round-trips AccessCustomPage":
    let obj = newAccessCustomPage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCustomPage)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessCustomPageValidate":
    let obj = newAccessCustomPageValidate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCustomPageValidate)) == openjson.toJson(obj)

  test "round-trips AccessValidateResponse":
    let obj = newAccessValidateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessValidateResponse)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse11":
    let obj = newAccessSingleResponse11()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse11)) == openjson.toJson(obj)

suite "access_custom_pages endpoints":
  test "GET /accounts/{account_id}/access/custom_pages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessCustomPages("test", 1, 1)

  test "POST /accounts/{account_id}/access/custom_pages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessCustomPages("test", newAccessCustomPage())

  test "POST /accounts/{account_id}/access/custom_pages/validate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessCustomPagesValidate("test", newAccessCustomPageValidate())

  test "GET /accounts/{account_id}/access/custom_pages/{custom_page_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessCustomPagesCustomPageId("test", "test")

  test "PUT /accounts/{account_id}/access/custom_pages/{custom_page_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessCustomPagesCustomPageId("test", "test", newAccessCustomPage())

  test "DELETE /accounts/{account_id}/access/custom_pages/{custom_page_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessCustomPagesCustomPageId("test", "test")

