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

suite "access_bookmark_applications_deprecated serialization":
  test "round-trips AccessResponseCollection14":
    let obj = newAccessResponseCollection14()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection14)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse13":
    let obj = newAccessSingleResponse13()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse13)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

suite "access_bookmark_applications_deprecated endpoints":
  test "GET /accounts/{account_id}/access/bookmarks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessBookmarks("test")

  test "GET /accounts/{account_id}/access/bookmarks/{bookmark_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessBookmarksBookmarkId("test", "test")

  test "POST /accounts/{account_id}/access/bookmarks/{bookmark_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessBookmarksBookmarkId("test", "test")

  test "PUT /accounts/{account_id}/access/bookmarks/{bookmark_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessBookmarksBookmarkId("test", "test")

  test "DELETE /accounts/{account_id}/access/bookmarks/{bookmark_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessBookmarksBookmarkId("test", "test")

