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

suite "event serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsAggregateResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsAggregateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsAggregateResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsGraphqlResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsGraphqlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsGraphqlResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsEventIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsEventIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsEventIdResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsEventIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsEventIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsEventIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse)) == openjson.toJson(obj)

suite "event endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEvents("test", "test", @["test"], 1.0, 1.0, "test", {}, @["test"], true, {}, {})

  test "GET /accounts/{account_id}/cloudforce-one/events/aggregate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsAggregate("test", "test", @["test"], "test", "test", true, 1.0)

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventId("test", "test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/events/graphql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneEventsGraphql("test")

  test "GET /accounts/{account_id}/cloudforce-one/events/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsQueries("test")

  test "GET /accounts/{account_id}/cloudforce-one/events/queries/{query_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsQueriesQueryId("test", 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/events/queries/{query_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsQueriesQueryId("test", 1)

  test "GET /accounts/{account_id}/cloudforce-one/events/raw/{dataset_id}/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsRawDatasetIdEventId("test", "test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/{dataset_id}/delete":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetIdDelete("test", "test", @["test"])

  test "GET /accounts/{account_id}/cloudforce-one/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsEventId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/{event_id}/raw/{raw_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsEventIdRawRawId("test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/{event_id}/relationships":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsEventIdRelationships("test", "test", {}, 1.0, openjson.newJObject(), @["test"], "test", true, 1.0, 1.0)

  test "POST /accounts/{account_id}/cloudforce-one/v2/events/graphql":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2EventsGraphql("test")

