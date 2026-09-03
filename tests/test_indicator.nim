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

suite "indicator serialization":
  test "round-trips CloudforceOneEventsHydratedEntity":
    let obj = newCloudforceOneEventsHydratedEntity()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEventsHydratedEntity)) == openjson.toJson(obj)

  test "round-trips CloudforceOneEventsRelationshipEdge":
    let obj = newCloudforceOneEventsRelationshipEdge()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneEventsRelationshipEdge)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse)) == openjson.toJson(obj)

suite "indicator endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicators("test", "test", 1.0, 1.0, "test", "test", @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsTags("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators/{indicator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorId("test", "test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators/{indicator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorId("test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators/{indicator_id}/relationships":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationships("test", "test", "test", @["test"], @["test"], "test", 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/indicators/{indicator_id}/relationships/{rel_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuid("test", "test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/indicators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsIndicators("test", @["test"], 1.0, 1.0, @["test"], "test", "test", @["test"], @["test"], @["test"], "test", "test", 1.0, true, true, {}, {}, "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/indicators/aggregate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsIndicatorsAggregate("test", "test", {}, "test", @["test"], openjson.newJObject(), openjson.newJObject(), "test", "test", 1.0)

