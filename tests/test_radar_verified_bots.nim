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

suite "radar_verified_bots serialization":
  test "round-trips GetRadarVerifiedBotsTopBotsResponse":
    let obj = cloudflare.GetRadarVerifiedBotsTopBotsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarVerifiedBotsTopBotsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarVerifiedBotsTopCategoriesResponse":
    let obj = cloudflare.GetRadarVerifiedBotsTopCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarVerifiedBotsTopCategoriesResponse)) == openjson.toJson(obj)

suite "radar_verified_bots endpoints":
  test "GET /radar/verified_bots/top/bots":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarVerifiedBotsTopBots(1, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/verified_bots/top/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarVerifiedBotsTopCategories(1, @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], @["test"], {})

