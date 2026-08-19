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

suite "radar_internet_services_ranking serialization":
  test "round-trips GetRadarRankingInternetServicesCategoriesResponse":
    let obj = cloudflare.GetRadarRankingInternetServicesCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingInternetServicesCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarRankingInternetServicesTimeseriesGroupsResponse":
    let obj = cloudflare.GetRadarRankingInternetServicesTimeseriesGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingInternetServicesTimeseriesGroupsResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarRankingInternetServicesTopResponse":
    let obj = cloudflare.GetRadarRankingInternetServicesTopResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarRankingInternetServicesTopResponse)) == openjson.toJson(obj)

suite "radar_internet_services_ranking endpoints":
  test "GET /radar/ranking/internet_services/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingInternetServicesCategories(1, @["test"], @["test"], {})

  test "GET /radar/ranking/internet_services/timeseries_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingInternetServicesTimeseriesGroups(@["test"], 1, @["test"], @["test"], @["test"], @["test"], {})

  test "GET /radar/ranking/internet_services/top":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarRankingInternetServicesTop(@["test"], 1, @["test"], @["test"], {})

