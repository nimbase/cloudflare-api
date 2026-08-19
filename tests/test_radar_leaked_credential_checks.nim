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

suite "radar_leaked_credential_checks serialization":
  test "round-trips GetRadarLeakedCredentialChecksSummaryBotClassResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksSummaryBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksSummaryBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarLeakedCredentialChecksSummaryCompromisedResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksSummaryCompromisedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksSummaryCompromisedResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarLeakedCredentialChecksSummaryDimensionResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_leaked_credential_checks endpoints":
  test "module has no sampleable endpoints":
    check true

