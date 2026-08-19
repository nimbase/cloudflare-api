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

suite "target_industry serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse)) == openjson.toJson(obj)

suite "target_industry endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/targetIndustries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustries("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/targetIndustries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTargetIndustries("test", @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/targetIndustries/catalog":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalog("test")

