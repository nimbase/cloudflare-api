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

suite "spectrum_analytics serialization":
  test "round-trips SpectrumAnalyticsQueryResponseAggregate":
    let obj = newSpectrumAnalyticsQueryResponseAggregate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsQueryResponseAggregate)) == openjson.toJson(obj)

  test "round-trips SpectrumAnalyticsUntil":
    let obj = newSpectrumAnalyticsUntil()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsUntil)) == openjson.toJson(obj)

  test "round-trips SpectrumAnalyticsSince":
    let obj = newSpectrumAnalyticsSince()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsSince)) == openjson.toJson(obj)

  test "round-trips SpectrumAnalyticsApiResponseCommonFailure":
    let obj = newSpectrumAnalyticsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SpectrumAnalyticsZonesReportResponse":
    let obj = newSpectrumAnalyticsZonesReportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsZonesReportResponse)) == openjson.toJson(obj)

  test "round-trips SpectrumAnalyticsQueryResponseSingle":
    let obj = newSpectrumAnalyticsQueryResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpectrumAnalyticsQueryResponseSingle)) == openjson.toJson(obj)

suite "spectrum_analytics endpoints":
  test "GET /user/spectrum_analytics/zones/report":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserSpectrumAnalyticsZonesReport(newSpectrumAnalyticsSince(), newSpectrumAnalyticsUntil(), true)

  test "GET /zones/{zone_id}/spectrum/analytics/aggregate/current":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSpectrumAnalyticsAggregateCurrent("test", "test", "test")

