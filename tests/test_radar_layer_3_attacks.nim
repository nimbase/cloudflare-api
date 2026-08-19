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

suite "radar_layer_3_attacks serialization":
  test "round-trips GetRadarAttacksLayer3SummaryBitrateResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryBitrateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryBitrateResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryDurationResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryDurationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryDurationResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryIpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryProtocolResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryVectorResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryVectorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryVectorResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryVerticalResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3SummaryDimensionResponse":
    let obj = cloudflare.GetRadarAttacksLayer3SummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3SummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsDurationResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsDurationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsDurationResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsVectorResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsVectorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsVectorResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TopAttacksResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TopAttacksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TopAttacksResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TopIndustryResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TopIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TopIndustryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TopLocationsOriginResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TopLocationsOriginResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TopLocationsOriginResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TopLocationsTargetResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TopLocationsTargetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TopLocationsTargetResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAttacksLayer3TopVerticalResponse":
    let obj = cloudflare.GetRadarAttacksLayer3TopVerticalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAttacksLayer3TopVerticalResponse)) == openjson.toJson(obj)

suite "radar_layer_3_attacks endpoints":
  test "module has no sampleable endpoints":
    check true

