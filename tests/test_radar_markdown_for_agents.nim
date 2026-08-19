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

suite "radar_markdown_for_agents serialization":
  test "round-trips GetRadarAiMarkdownForAgentsSummaryResponse":
    let obj = cloudflare.GetRadarAiMarkdownForAgentsSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiMarkdownForAgentsSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiMarkdownForAgentsTimeseriesResponse":
    let obj = cloudflare.GetRadarAiMarkdownForAgentsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiMarkdownForAgentsTimeseriesResponse)) == openjson.toJson(obj)

suite "radar_markdown_for_agents endpoints":
  test "GET /radar/ai/markdown_for_agents/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiMarkdownForAgentsSummary(@["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/ai/markdown_for_agents/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiMarkdownForAgentsTimeseries({}, @["test"], @["test"], @["test"], @["test"], {})

