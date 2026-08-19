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

suite "radar_agent_readiness serialization":
  test "round-trips GetRadarAgentReadinessSummaryDimensionResponse":
    let obj = cloudflare.GetRadarAgentReadinessSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAgentReadinessSummaryDimensionResponse)) == openjson.toJson(obj)

suite "radar_agent_readiness endpoints":
  test "module has no sampleable endpoints":
    check true

