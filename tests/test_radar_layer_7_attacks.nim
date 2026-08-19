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

suite "radar_layer_7_attacks serialization":
  test "round-trips GetRadarAttacksLayer7SummaryHttpMethodResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryHttpMethodResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryHttpMethodResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryHttpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryIpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryManagedRulesResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryManagedRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryManagedRulesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryMitigationProductResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryMitigationProductResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryMitigationProductResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryVerticalResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7SummaryDimensionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7SummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7SummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopAsesOriginResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopAsesOriginResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopAsesOriginResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopAttacksResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopAttacksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopAttacksResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopLocationsOriginResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopLocationsOriginResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopLocationsOriginResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopLocationsTargetResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopLocationsTargetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopLocationsTargetResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer7TopVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer7TopVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer7TopVerticalResponse)) == openjson.toJson(obj)

suite "radar_layer_7_attacks endpoints":
  test "module has no sampleable endpoints":
    check true

