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

suite "dataset serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)) == openjson.toJson(obj)

suite "dataset endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDataset("test", true)

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/datasets/preferences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetsPreferences("test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/datasets/preferences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetsPreferences("test", scopeUser)

