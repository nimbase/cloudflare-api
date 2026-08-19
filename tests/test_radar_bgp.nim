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

suite "radar_bgp serialization":
  test "round-trips GetRadarBgpHijacksEventsResponse":
    let obj = cloudflare.GetRadarBgpHijacksEventsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpHijacksEventsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpIpsTimeseriesResponse":
    let obj = cloudflare.GetRadarBgpIpsTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpIpsTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpIpsTopAsesResponse":
    let obj = cloudflare.GetRadarBgpIpsTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpIpsTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpLeaksEventsResponse":
    let obj = cloudflare.GetRadarBgpLeaksEventsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpLeaksEventsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesAsesResponse":
    let obj = cloudflare.GetRadarBgpRoutesAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesMoasResponse":
    let obj = cloudflare.GetRadarBgpRoutesMoasResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesMoasResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesPathsAsnResponse":
    let obj = cloudflare.GetRadarBgpRoutesPathsAsnResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesPathsAsnResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesPfx2asResponse":
    let obj = cloudflare.GetRadarBgpRoutesPfx2asResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesPfx2asResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesRealtimeResponse":
    let obj = cloudflare.GetRadarBgpRoutesRealtimeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesRealtimeResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesStatsResponse":
    let obj = cloudflare.GetRadarBgpRoutesStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesStatsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse":
    let obj = cloudflare.GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRpkiAspaChangesResponse":
    let obj = cloudflare.GetRadarBgpRpkiAspaChangesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRpkiAspaChangesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRpkiAspaSnapshotResponse":
    let obj = cloudflare.GetRadarBgpRpkiAspaSnapshotResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRpkiAspaSnapshotResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRpkiAspaTimeseriesResponse":
    let obj = cloudflare.GetRadarBgpRpkiAspaTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRpkiAspaTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpRpkiRoasTimeseriesResponse":
    let obj = cloudflare.GetRadarBgpRpkiRoasTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpRpkiRoasTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpTimeseriesResponse":
    let obj = cloudflare.GetRadarBgpTimeseriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpTimeseriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpTopAsesResponse":
    let obj = cloudflare.GetRadarBgpTopAsesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpTopAsesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpTopAsesPrefixesResponse":
    let obj = cloudflare.GetRadarBgpTopAsesPrefixesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpTopAsesPrefixesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarBgpTopPrefixesResponse":
    let obj = cloudflare.GetRadarBgpTopPrefixesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarBgpTopPrefixesResponse)) == openjson.toJson(obj)

suite "radar_bgp endpoints":
  test "GET /radar/bgp/hijacks/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpHijacksEvents(1, 1, 1, 1, 1, 1, "test", "test", 1, 1, "test", "test", "test", {}, {}, {})

  test "GET /radar/bgp/ips/top/ases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpIpsTopAses("test", 1, {}, "test", {})

  test "GET /radar/bgp/leaks/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpLeaksEvents(1, 1, 1, 1, 1, "test", "test", "test", "test", {}, {}, {})

  test "GET /radar/bgp/routes/ases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesAses("test", 1, {}, {}, {})

  test "GET /radar/bgp/routes/moas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesMoas(1, "test", true, {})

  test "GET /radar/bgp/routes/paths/{asn}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesPathsAsn(1, {}, "test", {})

  test "GET /radar/bgp/routes/pfx2as":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesPfx2as("test", 1, {}, true, {})

  test "GET /radar/bgp/routes/realtime":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesRealtime("test", {})

  test "GET /radar/bgp/routes/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesStats(1, "test", {})

  test "GET /radar/bgp/routes/upstreams/{asn}/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRoutesUpstreamsAsnTimeseries(1, {}, "test", "test", 1, {})

  test "GET /radar/bgp/rpki/aspa/changes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRpkiAspaChanges("test", "test", 1, true, {})

  test "GET /radar/bgp/rpki/aspa/snapshot":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRpkiAspaSnapshot(1, 1, "test", true, {})

  test "GET /radar/bgp/rpki/roas/timeseries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpRpkiRoasTimeseries("test", "test", {}, @["test"], @["test"], @["test"], {})

  test "GET /radar/bgp/top/ases/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarBgpTopAsesPrefixes("test", 1, {})

