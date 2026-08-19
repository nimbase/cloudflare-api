# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarBotsCrawlersSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarWebCrawlerFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarWebCrawlerAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarWebCrawlerNormalizationOption* = enum
    normalizationPERCENTAGE = "PERCENTAGE"
    normalizationMIN0MAX = "MIN0_MAX"
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"


proc getRadarBotsCrawlersSummaryDimension*(client: CloudflareClient,
                                           dimension: string,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           limitPerGroup: int64 = default(int64),
                                           botOperator: seq[string] = @[],
                                           vertical: seq[string] = @[],
                                           industry: seq[string] = @[],
                                           clientType: seq[string] = default(seq[string]),
                                           responseStatus: seq[string] = @[],
                                           responseStatusCategory: seq[string] = default(seq[string]),
                                           format: set[RadarWebCrawlerFormatOption] = {}): Future[GetRadarBotsCrawlersSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of HTTP requests from crawlers, grouped by the
  ## specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in botOperator: q["botOperator"] = $v
  for v in vertical: q["vertical"] = $v
  for v in industry: q["industry"] = $v
  q["clientType"] = $clientType
  for v in responseStatus: q["responseStatus"] = $v
  q["responseStatusCategory"] = $responseStatusCategory
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bots/crawlers/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsCrawlersSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBotsCrawlersTimeseriesGroupsDimension*(client: CloudflareClient,
                                                    dimension: string,
                                                    aggInterval: set[RadarWebCrawlerAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    limitPerGroup: int64 = default(int64),
                                                    normalization: string = "PERCENTAGE",
                                                    botOperator: seq[string] = @[],
                                                    vertical: seq[string] = @[],
                                                    industry: seq[string] = @[],
                                                    clientType: seq[string] = default(seq[string]),
                                                    responseStatus: seq[string] = @[],
                                                    responseStatusCategory: seq[string] = default(seq[string]),
                                                    format: set[RadarWebCrawlerFormatOption] = {}): Future[GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests from crawlers, grouped by the
  ## specified dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in normalization: q["normalization"] = $v
  for v in botOperator: q["botOperator"] = $v
  for v in vertical: q["vertical"] = $v
  for v in industry: q["industry"] = $v
  q["clientType"] = $clientType
  for v in responseStatus: q["responseStatus"] = $v
  q["responseStatusCategory"] = $responseStatusCategory
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bots/crawlers/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsCrawlersTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
