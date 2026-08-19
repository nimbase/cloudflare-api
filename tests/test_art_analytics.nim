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

suite "art_analytics serialization":
  test "round-trips ArtTimeseriesResponse":
    let obj = newArtTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips ArtQueryTimeseries":
    let obj = newArtQueryTimeseries()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtQueryTimeseries)) == openjson.toJson(obj)

  test "round-trips ArtSummaryResponse":
    let obj = newArtSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtSummaryResponse)) == openjson.toJson(obj)

  test "round-trips ArtQueryTopN":
    let obj = newArtQueryTopN()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtQueryTopN)) == openjson.toJson(obj)

  test "round-trips ArtTopNResponse":
    let obj = newArtTopNResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtTopNResponse)) == openjson.toJson(obj)

  test "round-trips ArtErrorResponse":
    let obj = newArtErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtErrorResponse)) == openjson.toJson(obj)

  test "round-trips ArtQuerySummary":
    let obj = newArtQuerySummary()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtQuerySummary)) == openjson.toJson(obj)

suite "art_analytics endpoints":
  test "POST /accounts/{account_id}/analytics/query/{dataset}/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDatasetSummary("test", "test", newArtQuerySummary())

  test "POST /accounts/{account_id}/analytics/query/{dataset}/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDatasetTimeseries("test", "test", newArtQueryTimeseries())

  test "POST /accounts/{account_id}/analytics/query/{dataset}/top-n":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDatasetTopN("test", "test", newArtQueryTopN())

