# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarQualityIqiSummaryResponse* = object
    result: JsonNode
    success: bool
  GetRadarQualityIqiTimeseriesGroupsResponse* = object
    result: JsonNode
    success: bool
  GetRadarQualitySpeedHistogramResponse* = object
    result: JsonNode
    success: bool
  GetRadarQualitySpeedSummaryResponse* = object
    result: JsonNode
    success: bool
  GetRadarQualitySpeedTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarQualitySpeedTopLocationsResponse* = object
    result: JsonNode
    success: bool
  RadarQualityMetricOption* = enum
    metricBANDWIDTH = "BANDWIDTH"
    metricDNS = "DNS"
    metricLATENCY = "LATENCY"

  RadarQualityFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarQualityAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarQualityMetricGroupOption* = enum
    metricGroupBANDWIDTH = "BANDWIDTH"
    metricGroupLATENCY = "LATENCY"
    metricGroupJITTER = "JITTER"

  RadarQualityOrderByOption* = enum
    orderByBANDWIDTHDOWNLOAD = "BANDWIDTH_DOWNLOAD"
    orderByBANDWIDTHUPLOAD = "BANDWIDTH_UPLOAD"
    orderByLATENCYIDLE = "LATENCY_IDLE"
    orderByLATENCYLOADED = "LATENCY_LOADED"
    orderByJITTERIDLE = "JITTER_IDLE"
    orderByJITTERLOADED = "JITTER_LOADED"


proc getRadarQualityIqiSummary*(client: CloudflareClient,
                                name: seq[string] = @[],
                                dateRange: seq[string] = @[],
                                dateStart: seq[string] = @[],
                                dateEnd: seq[string] = @[],
                                asn: seq[string] = @[],
                                location: seq[string] = @[],
                                continent: seq[string] = @[],
                                metric: set[RadarQualityMetricOption] = {},
                                format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualityIqiSummaryResponse] {.async.} =
  ## Retrieves a summary (percentiles) of bandwidth, latency, or DNS response time
  ## from the Radar Internet Quality Index (IQI).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in metric: q["metric"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/iqi/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualityIqiSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarQualityIqiTimeseriesGroups*(client: CloudflareClient,
                                         aggInterval: set[RadarQualityAggIntervalOption] = {},
                                         name: seq[string] = @[],
                                         dateRange: seq[string] = @[],
                                         dateStart: seq[string] = @[],
                                         dateEnd: seq[string] = @[],
                                         asn: seq[string] = @[],
                                         location: seq[string] = @[],
                                         continent: seq[string] = @[],
                                         interpolation: bool = default(bool),
                                         metric: set[RadarQualityMetricOption] = {},
                                         format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualityIqiTimeseriesGroupsResponse] {.async.} =
  ## Retrieves a time series (percentiles) of bandwidth, latency, or DNS response
  ## time from the Radar Internet Quality Index (IQI).

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["interpolation"] = $interpolation
  for v in metric: q["metric"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/iqi/timeseries_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualityIqiTimeseriesGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarQualitySpeedHistogram*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    bucketSize: int64 = default(int64),
                                    metricGroup: string = "bandwidth",
                                    format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualitySpeedHistogramResponse] {.async.} =
  ## Retrieves a histogram from the previous 90 days of Cloudflare Speed Test data,
  ## split into fixed bandwidth (Mbps), latency (ms), or jitter (ms) buckets.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["bucketSize"] = $bucketSize
  for v in metricGroup: q["metricGroup"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/speed/histogram", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualitySpeedHistogramResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarQualitySpeedSummary*(client: CloudflareClient,
                                  name: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualitySpeedSummaryResponse] {.async.} =
  ## Retrieves a summary of bandwidth, latency, jitter, and packet loss, from the
  ## previous 90 days of Cloudflare Speed Test data.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/speed/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualitySpeedSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarQualitySpeedTopAses*(client: CloudflareClient, limit: int64 = 5,
                                  name: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  orderBy: string = "BANDWIDTH_DOWNLOAD",
                                  reverse: bool = default(bool),
                                  format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualitySpeedTopAsesResponse] {.async.} =
  ## Retrieves the top autonomous systems by bandwidth, latency, jitter, or packet
  ## loss, from the previous 90 days of Cloudflare Speed Test data.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in orderBy: q["orderBy"] = $v
  q["reverse"] = $reverse
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/speed/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualitySpeedTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarQualitySpeedTopLocations*(client: CloudflareClient,
                                       limit: int64 = 5, name: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       orderBy: string = "BANDWIDTH_DOWNLOAD",
                                       reverse: bool = default(bool),
                                       format: set[RadarQualityFormatOption] = {}): Future[GetRadarQualitySpeedTopLocationsResponse] {.async.} =
  ## Retrieves the top locations by bandwidth, latency, jitter, or packet loss, from
  ## the previous 90 days of Cloudflare Speed Test data.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in orderBy: q["orderBy"] = $v
  q["reverse"] = $reverse
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/quality/speed/top/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarQualitySpeedTopLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)
