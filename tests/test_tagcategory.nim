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

suite "tagcategory serialization":
  test "round-trips CloudforceOneEventsFieldDefinition":
    let obj = newCloudforceOneEventsFieldDefinition()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEventsFieldDefinition)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)) == openjson.toJson(obj)

suite "tagcategory endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/tags/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTagsCategories("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/tags/categories/{category_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuid("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/tags/categories/{category_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuid("test", "test")

