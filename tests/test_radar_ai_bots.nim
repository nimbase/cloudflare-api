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

suite "radar_ai_bots serialization":
  test "round-trips GetRadarAiBotsSummaryUserAgentResponse":
    let obj = cloudflare.GetRadarAiBotsSummaryUserAgentResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiBotsSummaryUserAgentResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiBotsSummaryDimensionResponse":
    let obj = cloudflare.GetRadarAiBotsSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiBotsSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiBotsTimeseriesResponse":
    let obj = cloudflare.GetRadarAiBotsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiBotsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiBotsTimeseriesGroupsUserAgentResponse":
    let obj = cloudflare.GetRadarAiBotsTimeseriesGroupsUserAgentResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiBotsTimeseriesGroupsUserAgentResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiBotsTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarAiBotsTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiBotsTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_ai_bots endpoints":
  test "GET /radar/ai/bots/summary/user_agent":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiBotsSummaryUserAgent(@["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], 1, {})

  test "GET /radar/ai/bots/timeseries_groups/user_agent":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiBotsTimeseriesGroupsUserAgent({}, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], 1, {})

