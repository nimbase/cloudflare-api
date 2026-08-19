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

suite "radar_tcp_resets_and_timeouts serialization":
  test "round-trips GetRadarTcpResetsTimeoutsSummaryResponse":
    let obj = cloudflare.GetRadarTcpResetsTimeoutsSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTcpResetsTimeoutsSummaryResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse":
    let obj = cloudflare.GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse)) == openjson.toJson(obj)

suite "radar_tcp_resets_and_timeouts endpoints":
  test "GET /radar/tcp_resets_timeouts/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarTcpResetsTimeoutsSummary(@["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/tcp_resets_timeouts/timeseries_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarTcpResetsTimeoutsTimeseriesGroups({}, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

