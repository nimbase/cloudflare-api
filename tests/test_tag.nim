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

suite "tag serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTagsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse)) == openjson.toJson(obj)

suite "tag endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/tags/{tag_uuid}/indicators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicators("test", "test", "test", 1.0, 1.0, "test", @["test"], @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTags("test", 1.0, 1.0, "test", "test", @["test"], {})

  test "DELETE /accounts/{account_id}/cloudforce-one/events/tags/{tag_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsTagsTagUuid("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/tags/{tag_uuid}/indicators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicators("test", "test", @["test"], 1.0, 1.0, "test", @["test"], @["test"])

