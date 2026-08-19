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

suite "data_security serialization":
  test "round-trips ArtDataSecurityFindingsSummaryQuery":
    let obj = newArtDataSecurityFindingsSummaryQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtDataSecurityFindingsSummaryQuery)) == openjson.toJson(obj)

  test "round-trips ArtSummaryResponse":
    let obj = newArtSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtSummaryResponse)) == openjson.toJson(obj)

  test "round-trips ArtDataSecurityFindingsTimeseriesResponse":
    let obj = newArtDataSecurityFindingsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtDataSecurityFindingsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips ArtDataSecurityContentFindingsTopNQuery":
    let obj = newArtDataSecurityContentFindingsTopNQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtDataSecurityContentFindingsTopNQuery)) == openjson.toJson(obj)

  test "round-trips ArtTopNResponse":
    let obj = newArtTopNResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtTopNResponse)) == openjson.toJson(obj)

  test "round-trips ArtErrorResponse":
    let obj = newArtErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtErrorResponse)) == openjson.toJson(obj)

  test "round-trips ArtDataSecurityFindingsTimeseriesQuery":
    let obj = newArtDataSecurityFindingsTimeseriesQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ArtDataSecurityFindingsTimeseriesQuery)) == openjson.toJson(obj)

suite "data_security endpoints":
  test "POST /accounts/{account_id}/analytics/query/data-security/content-findings/top-n":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDataSecurityContentFindingsTopN("test", newArtDataSecurityContentFindingsTopNQuery())

  test "POST /accounts/{account_id}/analytics/query/data-security/findings/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDataSecurityFindingsSummary("test", newArtDataSecurityFindingsSummaryQuery())

  test "POST /accounts/{account_id}/analytics/query/data-security/findings/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAnalyticsQueryDataSecurityFindingsTimeseries("test", newArtDataSecurityFindingsTimeseriesQuery())

