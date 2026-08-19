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

suite "radar_email_security serialization":
  test "round-trips GetRadarEmailSecuritySummaryArcResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryArcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryArcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryDkimResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryDkimResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryDkimResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryDmarcResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryDmarcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryDmarcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryMaliciousResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryMaliciousResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryMaliciousResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummarySpamResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummarySpamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummarySpamResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummarySpfResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummarySpfResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummarySpfResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummarySpoofResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummarySpoofResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummarySpoofResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryThreatCategoryResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryThreatCategoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryThreatCategoryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryTlsVersionResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryTlsVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecuritySummaryDimensionResponse":
    let obj = cloudflare.GetRadarEmailSecuritySummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecuritySummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsArcResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsArcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsArcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsDkimResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsDkimResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsDkimResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsDmarcResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsDmarcResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsDmarcResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsSpamResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpamResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsSpfResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpfResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpfResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsSpoofResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpoofResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsSpoofResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarEmailSecurityTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTopTldsResponse":
    let obj = cloudflare.GetRadarEmailSecurityTopTldsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTopTldsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse":
    let obj = cloudflare.GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTopTldsSpamSpamResponse":
    let obj = cloudflare.GetRadarEmailSecurityTopTldsSpamSpamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTopTldsSpamSpamResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEmailSecurityTopTldsSpoofSpoofResponse":
    let obj = cloudflare.GetRadarEmailSecurityTopTldsSpoofSpoofResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEmailSecurityTopTldsSpoofSpoofResponse)) == openjson.toJson(obj)

suite "radar_email_security endpoints":
  test "module has no sampleable endpoints":
    check true

