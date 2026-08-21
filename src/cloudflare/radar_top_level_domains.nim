# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarTldsResponse* = object
    result: JsonNode
    success: bool
  GetRadarTldsPerformanceSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarTldsTldResponse* = object
    result: JsonNode
    success: bool
  RadarTopLevelDomainTldTypeOption* = enum
    tldTypeGENERIC = "GENERIC"
    tldTypeCOUNTRYCODE = "COUNTRY_CODE"
    tldTypeGENERICRESTRICTED = "GENERIC_RESTRICTED"
    tldTypeINFRASTRUCTURE = "INFRASTRUCTURE"
    tldTypeSPONSORED = "SPONSORED"

  RadarTopLevelDomainFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarTopLevelDomainAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarTlds*(client: CloudflareClient, limit: int64 = 5,
                   offset: int64 = default(int64),
                   tldManager: string = default(string),
                   tldType: RadarTopLevelDomainTldTypeOption,
                   tld: string = default(string),
                   format: RadarTopLevelDomainFormatOption): Future[GetRadarTldsResponse] {.async.} =
  ## Retrieves a list of TLDs.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["tldManager"] = $tldManager
  q["tldType"] = $tldType
  q["tld"] = $tld
  q["format"] = $format
  let res = await client.httpGET("/radar/tlds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTldsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarTldsPerformanceSummaryDimension*(client: CloudflareClient,
                                              dimension: Dimension,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              tld: seq[string] = @[],
                                              nameserver: string = default(string),
                                              limitPerGroup: int64 = default(int64),
                                              format: RadarTopLevelDomainFormatOption): Future[GetRadarTldsPerformanceSummaryDimensionResponse] {.async.} =
  ## Returns a summary of TLD authoritative nameserver performance grouped by the
  ## specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["nameserver"] = $nameserver
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/tlds/performance/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTldsPerformanceSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarTldsPerformanceTimeseriesGroupsDimension*(client: CloudflareClient,
                                                       dimension: Dimension,
                                                       aggInterval: RadarTopLevelDomainAggIntervalOption,
                                                       name: seq[string] = @[],
                                                       dateRange: seq[string] = @[],
                                                       dateStart: seq[string] = @[],
                                                       dateEnd: seq[string] = @[],
                                                       location: seq[string] = @[],
                                                       continent: seq[string] = @[],
                                                       tld: seq[string] = @[],
                                                       nameserver: string = default(string),
                                                       limitPerGroup: int64 = default(int64),
                                                       format: RadarTopLevelDomainFormatOption): Future[GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse] {.async.} =
  ## Returns a timeseries of TLD authoritative nameserver performance grouped by the
  ## specified dimension.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["nameserver"] = $nameserver
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/tlds/performance/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTldsPerformanceTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarTldsTld*(client: CloudflareClient, tld: string,
                      format: RadarTopLevelDomainFormatOption): Future[GetRadarTldsTldResponse] {.async.} =
  ## Retrieves the requested TLD information.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/tlds/{tld}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTldsTldResponse)
  else:
    raise newException(CloudflareClientError, body)
