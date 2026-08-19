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

suite "radar_dns serialization":
  test "round-trips GetRadarDnsSummaryCacheHitResponse":
    let obj = cloudflare.GetRadarDnsSummaryCacheHitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryCacheHitResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryDnssecResponse":
    let obj = cloudflare.GetRadarDnsSummaryDnssecResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryDnssecResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryDnssecAwareResponse":
    let obj = cloudflare.GetRadarDnsSummaryDnssecAwareResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryDnssecAwareResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryDnssecE2eResponse":
    let obj = cloudflare.GetRadarDnsSummaryDnssecE2eResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryDnssecE2eResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryIpVersionResponse":
    let obj = cloudflare.GetRadarDnsSummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryMatchingAnswerResponse":
    let obj = cloudflare.GetRadarDnsSummaryMatchingAnswerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryMatchingAnswerResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryProtocolResponse":
    let obj = cloudflare.GetRadarDnsSummaryProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryQueryTypeResponse":
    let obj = cloudflare.GetRadarDnsSummaryQueryTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryQueryTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryResponseCodeResponse":
    let obj = cloudflare.GetRadarDnsSummaryResponseCodeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryResponseCodeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryResponseTtlResponse":
    let obj = cloudflare.GetRadarDnsSummaryResponseTtlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryResponseTtlResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsSummaryDimensionResponse":
    let obj = cloudflare.GetRadarDnsSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsCacheHitResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsCacheHitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsCacheHitResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsDnssecResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsDnssecResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsDnssecResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsDnssecAwareResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsDnssecAwareResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsDnssecAwareResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsDnssecE2eResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsDnssecE2eResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsDnssecE2eResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsMatchingAnswerResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsMatchingAnswerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsMatchingAnswerResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsProtocolResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsQueryTypeResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsQueryTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsQueryTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsResponseCodeResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsResponseCodeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsResponseCodeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsResponseTtlResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsResponseTtlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsResponseTtlResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarDnsTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTopAsesResponse":
    let obj = cloudflare.GetRadarDnsTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarDnsTopLocationsResponse":
    let obj = cloudflare.GetRadarDnsTopLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDnsTopLocationsResponse)) == openjson.toJson(obj)

suite "radar_dns endpoints":
  test "module has no sampleable endpoints":
    check true

