# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarTcpResetsTimeoutsSummaryResponse* = object
    result: JsonNode
    success: bool
  GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse* = object
    result: JsonNode
    success: bool
  RadarTcpResetsAndTimeoutFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarTcpResetsAndTimeoutAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarTcpResetsTimeoutsSummary*(client: CloudflareClient,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       format: set[RadarTcpResetsAndTimeoutFormatOption] = {}): Future[GetRadarTcpResetsTimeoutsSummaryResponse] {.async.} =
  ## Retrieves the distribution of connection stage by TCP connections terminated
  ## within the first 10 packets by a reset or timeout.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/tcp_resets_timeouts/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTcpResetsTimeoutsSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarTcpResetsTimeoutsTimeseriesGroups*(client: CloudflareClient,
                                                aggInterval: set[RadarTcpResetsAndTimeoutAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                asn: seq[string] = @[],
                                                location: seq[string] = @[],
                                                continent: seq[string] = @[],
                                                format: set[RadarTcpResetsAndTimeoutFormatOption] = {}): Future[GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse] {.async.} =
  ## Retrieves the distribution of connection stage by TCP connections terminated
  ## within the first 10 packets by a reset or timeout over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/tcp_resets_timeouts/timeseries_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTcpResetsTimeoutsTimeseriesGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)
