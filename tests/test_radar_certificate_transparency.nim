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

suite "radar_certificate_transparency serialization":
  test "round-trips GetRadarCtAuthoritiesResponse":
    let obj = cloudflare.GetRadarCtAuthoritiesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtAuthoritiesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtAuthoritiesCaSlugResponse":
    let obj = cloudflare.GetRadarCtAuthoritiesCaSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtAuthoritiesCaSlugResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtLogsResponse":
    let obj = cloudflare.GetRadarCtLogsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtLogsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtLogsLogSlugResponse":
    let obj = cloudflare.GetRadarCtLogsLogSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtLogsLogSlugResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtSummaryDimensionResponse":
    let obj = cloudflare.GetRadarCtSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtTimeseriesResponse":
    let obj = cloudflare.GetRadarCtTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarCtTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarCtTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarCtTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_certificate_transparency endpoints":
  test "GET /radar/ct/authorities":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarCtAuthorities(1, 1, {})

  test "GET /radar/ct/authorities/{ca_slug}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarCtAuthoritiesCaSlug("test", {})

  test "GET /radar/ct/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarCtLogs(1, 1, {})

  test "GET /radar/ct/logs/{log_slug}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarCtLogsLogSlug("test", {})

