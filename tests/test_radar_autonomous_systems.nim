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

suite "radar_autonomous_systems serialization":
  test "round-trips GetRadarEntitiesAsnsResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesAsnsBotnetThreatFeedResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsBotnetThreatFeedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsBotnetThreatFeedResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesAsnsIpResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsIpResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsIpResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesAsnsAsnResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsAsnResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsAsnResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesAsnsAsnAsSetResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsAsnAsSetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsAsnAsSetResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarEntitiesAsnsAsnRelResponse":
    let obj = cloudflare.GetRadarEntitiesAsnsAsnRelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarEntitiesAsnsAsnRelResponse)) == openjson.toJson(obj)

suite "radar_autonomous_systems endpoints":
  test "GET /radar/entities/asns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsns(1, 1, "test", "test", {}, {})

  test "GET /radar/entities/asns/botnet_threat_feed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsnsBotnetThreatFeed(1, 1, {}, "test", "test", "test", @["test"], {}, {})

  test "GET /radar/entities/asns/ip":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsnsIp("test", {})

  test "GET /radar/entities/asns/{asn}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsnsAsn(1, {})

  test "GET /radar/entities/asns/{asn}/as_set":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsnsAsnAsSet(1, {})

  test "GET /radar/entities/asns/{asn}/rel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarEntitiesAsnsAsnRel(1, 1, {})

