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

suite "radar_email_routing serialization":
  test "round-trips GetRadarEmailRoutingSummaryArcResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryArcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryArcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummaryDkimResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryDkimResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryDkimResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummaryDmarcResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryDmarcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryDmarcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummaryEncryptedResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryEncryptedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryEncryptedResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummaryIpVersionResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummarySpfResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummarySpfResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummarySpfResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingSummaryDimensionResponse":
    let obj = cloudflare.GetRadarEmailRoutingSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsArcResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsArcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsArcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsDkimResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsDkimResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsDkimResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsDmarcResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsDmarcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsDmarcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsSpfResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsSpfResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsSpfResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailRoutingTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarEmailRoutingTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailRoutingTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_email_routing endpoints":
  test "module has no sampleable endpoints":
    check true

