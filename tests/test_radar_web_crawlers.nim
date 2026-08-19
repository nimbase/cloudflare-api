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

suite "radar_web_crawlers serialization":
  test "round-trips GetRadarBotsCrawlersSummaryDimensionResponse":
    let obj = cloudflare.GetRadarBotsCrawlersSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsCrawlersSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_web_crawlers endpoints":
  test "module has no sampleable endpoints":
    check true

