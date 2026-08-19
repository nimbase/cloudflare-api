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

suite "log_explorer_datasets serialization":
  test "round-trips LexDatasetDetailResponse":
    let obj = newLexDatasetDetailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexDatasetDetailResponse)) == openjson.toJson(obj)

  test "round-trips LexUpdateDatasetRequest":
    let obj = newLexUpdateDatasetRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexUpdateDatasetRequest)) == openjson.toJson(obj)

  test "round-trips LexAvailableDestinationListResponse":
    let obj = newLexAvailableDestinationListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexAvailableDestinationListResponse)) == openjson.toJson(obj)

  test "round-trips LexCreateDatasetRequest":
    let obj = newLexCreateDatasetRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexCreateDatasetRequest)) == openjson.toJson(obj)

  test "round-trips LexErrorResponse2":
    let obj = newLexErrorResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexErrorResponse2)) == openjson.toJson(obj)

  test "round-trips LexDatasetSummaryListResponse":
    let obj = newLexDatasetSummaryListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LexDatasetSummaryListResponse)) == openjson.toJson(obj)

suite "log_explorer_datasets endpoints":
  test "GET /accounts/{account_id}/logs/explorer/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsExplorerDatasets("test", true)

  test "POST /accounts/{account_id}/logs/explorer/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLogsExplorerDatasets("test", newLexCreateDatasetRequest())

  test "GET /accounts/{account_id}/logs/explorer/datasets/available":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsExplorerDatasetsAvailable("test")

  test "GET /accounts/{account_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsExplorerDatasetsDatasetId("test", "test")

  test "PUT /accounts/{account_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdLogsExplorerDatasetsDatasetId("test", "test", newLexUpdateDatasetRequest())

  test "DELETE /accounts/{account_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLogsExplorerDatasetsDatasetId("test", "test")

  test "GET /zones/{zone_id}/logs/explorer/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsExplorerDatasets("test")

  test "POST /zones/{zone_id}/logs/explorer/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdLogsExplorerDatasets("test", newLexCreateDatasetRequest())

  test "GET /zones/{zone_id}/logs/explorer/datasets/available":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsExplorerDatasetsAvailable("test")

  test "GET /zones/{zone_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsExplorerDatasetsDatasetId("test", "test")

  test "PUT /zones/{zone_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdLogsExplorerDatasetsDatasetId("test", "test", newLexUpdateDatasetRequest())

  test "DELETE /zones/{zone_id}/logs/explorer/datasets/{dataset_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdLogsExplorerDatasetsDatasetId("test", "test")

