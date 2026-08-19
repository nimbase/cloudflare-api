# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarNetflowsSummaryResponse* = object
    result: JsonNode
    success: bool
  GetRadarNetflowsSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarNetflowsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarNetflowsTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarNetflowsTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarNetflowsTopLocationsResponse* = object
    result: JsonNode
    success: bool
  RadarNetflowFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarNetflowAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarNetflowNormalizationOption* = enum
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"
    normalizationMIN0MAX = "MIN0_MAX"


proc getRadarNetflowsSummary*(client: CloudflareClient, name: seq[string] = @[],
                              dateRange: seq[string] = @[],
                              dateStart: seq[string] = @[],
                              dateEnd: seq[string] = @[], asn: seq[string] = @[],
                              location: seq[string] = @[],
                              continent: seq[string] = @[],
                              geoId: seq[string] = @[],
                              format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsSummaryResponse] {.async.} =
  ## Retrieves the distribution of network traffic (NetFlows) by HTTP vs other
  ## protocols.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/netflows/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarNetflowsSummaryDimension*(client: CloudflareClient,
                                       dimension: string,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       geoId: seq[string] = @[],
                                       product: seq[string] = default(seq[string]),
                                       limitPerGroup: int64 = default(int64),
                                       format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsSummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of network traffic (NetFlows) by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["product"] = $product
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/netflows/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarNetflowsTimeseries*(client: CloudflareClient,
                                 aggInterval: set[RadarNetflowAggIntervalOption] = {},
                                 name: seq[string] = @[],
                                 dateRange: seq[string] = @[],
                                 dateStart: seq[string] = @[],
                                 dateEnd: seq[string] = @[],
                                 product: seq[string] = default(seq[string]),
                                 asn: seq[string] = @[],
                                 location: seq[string] = @[],
                                 continent: seq[string] = @[],
                                 geoId: seq[string] = @[],
                                 normalization: set[RadarNetflowNormalizationOption] = {},
                                 format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsTimeseriesResponse] {.async.} =
  ## Retrieves network traffic (NetFlows) over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["product"] = $product
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/netflows/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarNetflowsTimeseriesGroupsDimension*(client: CloudflareClient,
                                                dimension: string,
                                                aggInterval: set[RadarNetflowAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                asn: seq[string] = @[],
                                                location: seq[string] = @[],
                                                continent: seq[string] = @[],
                                                geoId: seq[string] = @[],
                                                limitPerGroup: int64 = default(int64),
                                                normalization: string = "PERCENTAGE",
                                                product: seq[string] = default(seq[string]),
                                                format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of NetFlows traffic, grouped by the specified
  ## dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in normalization: q["normalization"] = $v
  q["product"] = $product
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/netflows/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarNetflowsTopAses*(client: CloudflareClient, limit: int64 = 5,
                              name: seq[string] = @[],
                              dateRange: seq[string] = @[],
                              dateStart: seq[string] = @[],
                              dateEnd: seq[string] = @[], asn: seq[string] = @[],
                              location: seq[string] = @[],
                              continent: seq[string] = @[],
                              geoId: seq[string] = @[],
                              format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsTopAsesResponse] {.async.} =
  ## Retrieves the top autonomous systems by network traffic (NetFlows).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/netflows/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarNetflowsTopLocations*(client: CloudflareClient, limit: int64 = 5,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   geoId: seq[string] = @[],
                                   format: set[RadarNetflowFormatOption] = {}): Future[GetRadarNetflowsTopLocationsResponse] {.async.} =
  ## Retrieves the top locations by network traffic (NetFlows).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/netflows/top/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarNetflowsTopLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)
