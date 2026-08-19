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

suite "radar_domains_ranking serialization":
  test "round-trips GetRadarRankingDomainDomainResponse":
    let obj = cloudflare.GetRadarRankingDomainDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingDomainDomainResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarRankingTimeseriesGroupsResponse":
    let obj = cloudflare.GetRadarRankingTimeseriesGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingTimeseriesGroupsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarRankingTopResponse":
    let obj = cloudflare.GetRadarRankingTopResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingTopResponse)) == openjson.toJson(obj)

suite "radar_domains_ranking endpoints":
  test "GET /radar/ranking/domain/{domain}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingDomainDomain("test", 1, {}, @["test"], true, @["test"], {})

  test "GET /radar/ranking/timeseries_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingTimeseriesGroups(1, {}, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/ranking/top":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingTop(1, @["test"], @["test"], @["test"], @["test"], {}, {})

