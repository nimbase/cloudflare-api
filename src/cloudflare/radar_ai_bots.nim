# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAiBotsSummaryUserAgentResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiBotsSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiBotsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiBotsTimeseriesGroupsUserAgentResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiBotsTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarAiBotFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarAiBotAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarAiBotNormalizationOption* = enum
    normalizationPERCENTAGE = "PERCENTAGE"
    normalizationMIN0MAX = "MIN0_MAX"
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"


proc getRadarAiBotsSummaryUserAgent*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     limitPerGroup: int64 = default(int64),
                                     format: RadarAiBotFormatOption): Future[GetRadarAiBotsSummaryUserAgentResponse] {.async.} =
  ## Retrieves the distribution of traffic by AI user agent.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/ai/bots/summary/user_agent", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiBotsSummaryUserAgentResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiBotsSummaryDimension*(client: CloudflareClient,
                                     dimension: Dimension,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     crawlPurpose: seq[string] = @[],
                                     userAgent: seq[string] = @[],
                                     vertical: seq[string] = @[],
                                     industry: seq[string] = @[],
                                     contentType: seq[string] = default(seq[string]),
                                     responseStatus: seq[string] = @[],
                                     responseStatusCategory: seq[string] = default(seq[string]),
                                     limitPerGroup: int64 = default(int64),
                                     format: RadarAiBotFormatOption): Future[GetRadarAiBotsSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of AI bots HTTP requests grouped by the
  ## specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in crawlPurpose: q["crawlPurpose"] = $v
  for v in userAgent: q["userAgent"] = $v
  for v in vertical: q["vertical"] = $v
  for v in industry: q["industry"] = $v
  q["contentType"] = $contentType
  for v in responseStatus: q["responseStatus"] = $v
  q["responseStatusCategory"] = $responseStatusCategory
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ai/bots/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiBotsSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiBotsTimeseries*(client: CloudflareClient,
                               aggInterval: RadarAiBotAggIntervalOption,
                               name: seq[string] = @[],
                               dateRange: seq[string] = @[],
                               dateStart: seq[string] = @[],
                               dateEnd: seq[string] = @[],
                               asn: seq[string] = @[],
                               location: seq[string] = @[],
                               continent: seq[string] = @[],
                               crawlPurpose: seq[string] = @[],
                               userAgent: seq[string] = @[],
                               industry: seq[string] = @[],
                               vertical: seq[string] = @[],
                               contentType: seq[string] = default(seq[string]),
                               responseStatus: seq[string] = @[],
                               responseStatusCategory: seq[string] = default(seq[string]),
                               limitPerGroup: int64 = default(int64),
                               format: RadarAiBotFormatOption): Future[GetRadarAiBotsTimeseriesResponse] {.async.} =
  ## Retrieves AI bots HTTP request volume over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in crawlPurpose: q["crawlPurpose"] = $v
  for v in userAgent: q["userAgent"] = $v
  for v in industry: q["industry"] = $v
  for v in vertical: q["vertical"] = $v
  q["contentType"] = $contentType
  for v in responseStatus: q["responseStatus"] = $v
  q["responseStatusCategory"] = $responseStatusCategory
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/ai/bots/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiBotsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiBotsTimeseriesGroupsUserAgent*(client: CloudflareClient,
                                              aggInterval: RadarAiBotAggIntervalOption,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              limitPerGroup: int64 = default(int64),
                                              format: RadarAiBotFormatOption): Future[GetRadarAiBotsTimeseriesGroupsUserAgentResponse] {.async.} =
  ## Retrieves the distribution of traffic by AI user agent over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/ai/bots/timeseries_groups/user_agent", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiBotsTimeseriesGroupsUserAgentResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiBotsTimeseriesGroupsDimension*(client: CloudflareClient,
                                              dimension: Dimension,
                                              aggInterval: RadarAiBotAggIntervalOption,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              crawlPurpose: seq[string] = @[],
                                              userAgent: seq[string] = @[],
                                              industry: seq[string] = @[],
                                              vertical: seq[string] = @[],
                                              contentType: seq[string] = default(seq[string]),
                                              responseStatus: seq[string] = @[],
                                              responseStatusCategory: seq[string] = default(seq[string]),
                                              limitPerGroup: int64 = default(int64),
                                              normalization: RadarAiBotNormalizationOption = normalizationPERCENTAGE,
                                              format: RadarAiBotFormatOption): Future[GetRadarAiBotsTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests from AI bots, grouped by the
  ## specified dimension over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in crawlPurpose: q["crawlPurpose"] = $v
  for v in userAgent: q["userAgent"] = $v
  for v in industry: q["industry"] = $v
  for v in vertical: q["vertical"] = $v
  q["contentType"] = $contentType
  for v in responseStatus: q["responseStatus"] = $v
  q["responseStatusCategory"] = $responseStatusCategory
  q["limitPerGroup"] = $limitPerGroup
  q["normalization"] = $normalization
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ai/bots/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiBotsTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
