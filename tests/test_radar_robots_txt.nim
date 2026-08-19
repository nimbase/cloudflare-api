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

suite "radar_robots_txt serialization":
  test "round-trips GetRadarRobotsTxtTopDomainCategoriesResponse":
    let obj = cloudflare.GetRadarRobotsTxtTopDomainCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRobotsTxtTopDomainCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarRobotsTxtTopUserAgentsDirectiveResponse":
    let obj = cloudflare.GetRadarRobotsTxtTopUserAgentsDirectiveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRobotsTxtTopUserAgentsDirectiveResponse)) == openjson.toJson(obj)

suite "radar_robots_txt endpoints":
  test "GET /radar/robots_txt/top/domain_categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRobotsTxtTopDomainCategories(1, @["test"], {}, @["test"], {})

  test "GET /radar/robots_txt/top/user_agents/directive":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRobotsTxtTopUserAgentsDirective(1, @["test"], {}, @["test"], @["test"], {}, {})

