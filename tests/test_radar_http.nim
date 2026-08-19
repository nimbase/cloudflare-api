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

suite "radar_http serialization":
  test "round-trips GetRadarHttpSummaryBotClassResponse":
    let obj = cloudflare.GetRadarHttpSummaryBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryDeviceTypeResponse":
    let obj = cloudflare.GetRadarHttpSummaryDeviceTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryDeviceTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryHttpProtocolResponse":
    let obj = cloudflare.GetRadarHttpSummaryHttpProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryHttpProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryHttpVersionResponse":
    let obj = cloudflare.GetRadarHttpSummaryHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryIpVersionResponse":
    let obj = cloudflare.GetRadarHttpSummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryOsResponse":
    let obj = cloudflare.GetRadarHttpSummaryOsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryOsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryPostQuantumResponse":
    let obj = cloudflare.GetRadarHttpSummaryPostQuantumResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryPostQuantumResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryTlsVersionResponse":
    let obj = cloudflare.GetRadarHttpSummaryTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryTlsVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpSummaryDimensionResponse":
    let obj = cloudflare.GetRadarHttpSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsBotClassResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsBrowserResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsBrowserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsBrowserResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsBrowserFamilyResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsBrowserFamilyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsBrowserFamilyResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsDeviceTypeResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsDeviceTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsDeviceTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsHttpProtocolResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsHttpProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsHttpProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsHttpVersionResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsOsResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsOsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsOsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsPostQuantumResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsPostQuantumResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsPostQuantumResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsTlsVersionResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsTlsVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarHttpTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesResponse":
    let obj = cloudflare.GetRadarHttpTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesBotClassBotClassResponse":
    let obj = cloudflare.GetRadarHttpTopAsesBotClassBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesBotClassBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse":
    let obj = cloudflare.GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse":
    let obj = cloudflare.GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse":
    let obj = cloudflare.GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesHttpVersionHttpVersionResponse":
    let obj = cloudflare.GetRadarHttpTopAsesHttpVersionHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesHttpVersionHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesIpVersionIpVersionResponse":
    let obj = cloudflare.GetRadarHttpTopAsesIpVersionIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesIpVersionIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesOsOsResponse":
    let obj = cloudflare.GetRadarHttpTopAsesOsOsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesOsOsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopAsesTlsVersionTlsVersionResponse":
    let obj = cloudflare.GetRadarHttpTopAsesTlsVersionTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopAsesTlsVersionTlsVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopBrowserResponse":
    let obj = cloudflare.GetRadarHttpTopBrowserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopBrowserResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopBrowserFamilyResponse":
    let obj = cloudflare.GetRadarHttpTopBrowserFamilyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopBrowserFamilyResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsBotClassBotClassResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsBotClassBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsBotClassBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsHttpVersionHttpVersionResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsHttpVersionHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsHttpVersionHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsIpVersionIpVersionResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsIpVersionIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsIpVersionIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsOsOsResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsOsOsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsOsOsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarHttpTopLocationsTlsVersionTlsVersionResponse":
    let obj = cloudflare.GetRadarHttpTopLocationsTlsVersionTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarHttpTopLocationsTlsVersionTlsVersionResponse)) == openjson.toJson(obj)

suite "radar_http endpoints":
  test "module has no sampleable endpoints":
    check true

