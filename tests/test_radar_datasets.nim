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

suite "radar_datasets serialization":
  test "round-trips GetRadarDatasetsResponse":
    let obj = cloudflare.GetRadarDatasetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarDatasetsResponse)) == openjson.toJson(obj)

  test "round-trips PostRadarDatasetsDownloadResponse":
    let obj = cloudflare.PostRadarDatasetsDownloadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostRadarDatasetsDownloadResponse)) == openjson.toJson(obj)

suite "radar_datasets endpoints":
  test "GET /radar/datasets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarDatasets(1, 1, {}, "test", {})

  test "GET /radar/datasets/{alias}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarDatasetsAlias("test")

