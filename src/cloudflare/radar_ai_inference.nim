# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAiInferenceSummaryModelResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiInferenceSummaryTaskResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiInferenceSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiInferenceTimeseriesGroupsModelResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiInferenceTimeseriesGroupsTaskResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiInferenceTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarAiInferenceFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarAiInferenceAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarAiInferenceNormalizationOption* = enum
    normalizationPERCENTAGE = "PERCENTAGE"
    normalizationMIN0MAX = "MIN0_MAX"


proc getRadarAiInferenceSummaryModel*(client: CloudflareClient,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      limitPerGroup: int64 = default(int64),
                                      format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceSummaryModelResponse] {.async.} =
  ## Retrieves the distribution of the number of inferences by model.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ai/inference/summary/model", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceSummaryModelResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiInferenceSummaryTask*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     limitPerGroup: int64 = default(int64),
                                     format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceSummaryTaskResponse] {.async.} =
  ## Retrieves the distribution of the number of inferences by task.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ai/inference/summary/task", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceSummaryTaskResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiInferenceSummaryDimension*(client: CloudflareClient,
                                          dimension: string,
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          asn: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          limitPerGroup: int64 = default(int64),
                                          format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of the number of inferences run on Workers AI,
  ## grouped by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/ai/inference/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiInferenceTimeseriesGroupsModel*(client: CloudflareClient,
                                               aggInterval: set[RadarAiInferenceAggIntervalOption] = {},
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               limitPerGroup: int64 = default(int64),
                                               format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceTimeseriesGroupsModelResponse] {.async.} =
  ## Retrieves the distribution of the number of inferences by model over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ai/inference/timeseries_groups/model", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceTimeseriesGroupsModelResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiInferenceTimeseriesGroupsTask*(client: CloudflareClient,
                                              aggInterval: set[RadarAiInferenceAggIntervalOption] = {},
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              limitPerGroup: int64 = default(int64),
                                              format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceTimeseriesGroupsTaskResponse] {.async.} =
  ## Retrieves the distribution of the number of inferences by task over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ai/inference/timeseries_groups/task", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceTimeseriesGroupsTaskResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiInferenceTimeseriesGroupsDimension*(client: CloudflareClient,
                                                   dimension: string,
                                                   aggInterval: set[RadarAiInferenceAggIntervalOption] = {},
                                                   name: seq[string] = @[],
                                                   dateRange: seq[string] = @[],
                                                   dateStart: seq[string] = @[],
                                                   dateEnd: seq[string] = @[],
                                                   asn: seq[string] = @[],
                                                   location: seq[string] = @[],
                                                   continent: seq[string] = @[],
                                                   limitPerGroup: int64 = default(int64),
                                                   normalization: string = "PERCENTAGE",
                                                   format: set[RadarAiInferenceFormatOption] = {}): Future[GetRadarAiInferenceTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of the number of inferences run on Workers AI,
  ## grouped by the specified dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/ai/inference/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiInferenceTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
