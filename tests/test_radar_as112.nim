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

suite "radar_as112 serialization":
  test "round-trips GetRadarAs112SummaryDnssecResponse":
    let obj = cloudflare.GetRadarAs112SummaryDnssecResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryDnssecResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryEdnsResponse":
    let obj = cloudflare.GetRadarAs112SummaryEdnsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryEdnsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryIpVersionResponse":
    let obj = cloudflare.GetRadarAs112SummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryProtocolResponse":
    let obj = cloudflare.GetRadarAs112SummaryProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryQueryTypeResponse":
    let obj = cloudflare.GetRadarAs112SummaryQueryTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryQueryTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryResponseCodesResponse":
    let obj = cloudflare.GetRadarAs112SummaryResponseCodesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryResponseCodesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112SummaryDimensionResponse":
    let obj = cloudflare.GetRadarAs112SummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112SummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsDnssecResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsDnssecResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsDnssecResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsEdnsResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsEdnsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsEdnsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsProtocolResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsQueryTypeResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsQueryTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsQueryTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsResponseCodesResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsResponseCodesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsResponseCodesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarAs112TimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TopLocationsResponse":
    let obj = cloudflare.GetRadarAs112TopLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TopLocationsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TopLocationsDnssecDnssecResponse":
    let obj = cloudflare.GetRadarAs112TopLocationsDnssecDnssecResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TopLocationsDnssecDnssecResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TopLocationsEdnsEdnsResponse":
    let obj = cloudflare.GetRadarAs112TopLocationsEdnsEdnsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TopLocationsEdnsEdnsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAs112TopLocationsIpVersionIpVersionResponse":
    let obj = cloudflare.GetRadarAs112TopLocationsIpVersionIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAs112TopLocationsIpVersionIpVersionResponse)) == openjson.toJson(obj)

suite "radar_as112 endpoints":
  test "GET /radar/as112/top/locations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAs112TopLocations(1, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

