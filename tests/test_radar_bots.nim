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

suite "radar_bots serialization":
  test "round-trips GetRadarBotsResponse":
    let obj = cloudflare.GetRadarBotsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBotsSummaryDimensionResponse":
    let obj = cloudflare.GetRadarBotsSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBotsTimeseriesResponse":
    let obj = cloudflare.GetRadarBotsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBotsTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarBotsTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBotsBotSlugResponse":
    let obj = cloudflare.GetRadarBotsBotSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsBotSlugResponse)) == openjson.toJson(obj)

suite "radar_bots endpoints":
  test "GET /radar/bots":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBots(1, 1, {}, "test", {}, {}, {})

  test "GET /radar/bots/{bot_slug}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBotsBotSlug("test", {})

