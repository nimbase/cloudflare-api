# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarOriginsResponse* = object
    result: JsonNode
    success: bool
  GetRadarOriginsSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarOriginsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarOriginsTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarOriginsSlugResponse* = object
    result: JsonNode
    success: bool
  RadarOriginFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarOriginMetricOption* = enum
    metricCONNECTIONFAILURES = "CONNECTION_FAILURES"
    metricREQUESTS = "REQUESTS"
    metricRESPONSEHEADERRECEIVEDURATION = "RESPONSE_HEADER_RECEIVE_DURATION"
    metricTCPHANDSHAKEDURATION = "TCP_HANDSHAKE_DURATION"
    metricTCPRTT = "TCP_RTT"
    metricTLSHANDSHAKEDURATION = "TLS_HANDSHAKE_DURATION"

  RadarOriginAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarOriginNormalizationOption* = enum
    normalizationPERCENTAGE = "PERCENTAGE"
    normalizationMIN0MAX = "MIN0_MAX"


proc getRadarOrigins*(client: CloudflareClient, limit: int64 = 5,
                      offset: int64 = default(int64),
                      format: set[RadarOriginFormatOption] = {}): Future[GetRadarOriginsResponse] {.async.} =
  ## Retrieves a list of origins with their regions.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/origins", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarOriginsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarOriginsSummaryDimension*(client: CloudflareClient,
                                      dimension: string, name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      limitPerGroup: int64 = default(int64),
                                      origin: seq[string] = default(seq[string]),
                                      metric: set[RadarOriginMetricOption] = {},
                                      region: seq[string] = @[],
                                      format: set[RadarOriginFormatOption] = {}): Future[GetRadarOriginsSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of origin metrics grouped by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  q["origin"] = $origin
  for v in metric: q["metric"] = $v
  for v in region: q["region"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/origins/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarOriginsSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarOriginsTimeseries*(client: CloudflareClient,
                                aggInterval: set[RadarOriginAggIntervalOption] = {},
                                name: seq[string] = @[],
                                dateRange: seq[string] = @[],
                                dateStart: seq[string] = @[],
                                dateEnd: seq[string] = @[], origin: seq[string],
                                metric: set[RadarOriginMetricOption] = {},
                                region: seq[string] = @[],
                                format: set[RadarOriginFormatOption] = {}): Future[GetRadarOriginsTimeseriesResponse] {.async.} =
  ## Retrieves the time series of origin metrics for the specified origin.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["origin"] = $origin
  for v in metric: q["metric"] = $v
  for v in region: q["region"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/origins/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarOriginsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarOriginsTimeseriesGroupsDimension*(client: CloudflareClient,
                                               dimension: string,
                                               aggInterval: set[RadarOriginAggIntervalOption] = {},
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               limitPerGroup: int64 = default(int64),
                                               origin: seq[string] = default(seq[string]),
                                               metric: set[RadarOriginMetricOption] = {},
                                               region: seq[string] = @[],
                                               normalization: string = "PERCENTAGE",
                                               format: set[RadarOriginFormatOption] = {}): Future[GetRadarOriginsTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of origin metrics grouped by the specified dimension
  ## over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  q["origin"] = $origin
  for v in metric: q["metric"] = $v
  for v in region: q["region"] = $v
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/origins/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarOriginsTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarOriginsSlug*(client: CloudflareClient, slug: string,
                          format: set[RadarOriginFormatOption] = {}): Future[GetRadarOriginsSlugResponse] {.async.} =
  ## Retrieves the requested origin information with its regions.

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/origins/{slug}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarOriginsSlugResponse)
  else:
    raise newException(CloudflareClientError, body)
