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

suite "radar_ai_inference serialization":
  test "round-trips GetRadarAiInferenceSummaryModelResponse":
    let obj = cloudflare.GetRadarAiInferenceSummaryModelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceSummaryModelResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiInferenceSummaryTaskResponse":
    let obj = cloudflare.GetRadarAiInferenceSummaryTaskResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceSummaryTaskResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiInferenceSummaryDimensionResponse":
    let obj = cloudflare.GetRadarAiInferenceSummaryDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceSummaryDimensionResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiInferenceTimeseriesGroupsModelResponse":
    let obj = cloudflare.GetRadarAiInferenceTimeseriesGroupsModelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceTimeseriesGroupsModelResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiInferenceTimeseriesGroupsTaskResponse":
    let obj = cloudflare.GetRadarAiInferenceTimeseriesGroupsTaskResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceTimeseriesGroupsTaskResponse)) == openjson.toJson(obj)

  test "round-trips GetRadarAiInferenceTimeseriesGroupsDimensionResponse":
    let obj = cloudflare.GetRadarAiInferenceTimeseriesGroupsDimensionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarAiInferenceTimeseriesGroupsDimensionResponse)) == openjson.toJson(obj)

suite "radar_ai_inference endpoints":
  test "GET /radar/ai/inference/summary/model":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiInferenceSummaryModel(@["test"], @["test"], @["test"], @["test"], 1, {})

  test "GET /radar/ai/inference/summary/task":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiInferenceSummaryTask(@["test"], @["test"], @["test"], @["test"], 1, {})

  test "GET /radar/ai/inference/timeseries_groups/model":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiInferenceTimeseriesGroupsModel({}, @["test"], @["test"], @["test"], @["test"], 1, {})

  test "GET /radar/ai/inference/timeseries_groups/task":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getRadarAiInferenceTimeseriesGroupsTask({}, @["test"], @["test"], @["test"], @["test"], 1, {})

