# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarBgpHijacksEventsResponse* = object
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetRadarBgpIpsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpIpsTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpLeaksEventsResponse* = object
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetRadarBgpRoutesAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesMoasResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesPathsAsnResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesPfx2asResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesRealtimeResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesStatsResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRpkiAspaChangesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRpkiAspaSnapshotResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRpkiAspaTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpRpkiRoasTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpTopAsesPrefixesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBgpTopPrefixesResponse* = object
    result: JsonNode
    success: bool
  RadarBgpSortByOption* = enum
    sortByID = "ID"
    sortByTIME = "TIME"
    sortByCONFIDENCE = "CONFIDENCE"

  RadarBgpSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"

  RadarBgpFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarBgpMetricOption* = enum
    metricV424s = "v4_24s"
    metricV648s = "v6_48s"

  RadarBgpIpVersionOption* = enum
    ipVersionIPv4 = "IPv4"
    ipVersionIPv6 = "IPv6"

  RadarBgpRpkiStatusOption* = enum
    rpkiStatusVALID = "VALID"
    rpkiStatusINVALID = "INVALID"
    rpkiStatusUNKNOWN = "UNKNOWN"

  RadarBgpAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarBgpHijacksEvents*(client: CloudflareClient, page: int64 = 1,
                               perPage: int64 = 50,
                               eventId: int64 = default(int64),
                               hijackerAsn: int64 = default(int64),
                               victimAsn: int64 = default(int64),
                               involvedAsn: int64 = default(int64),
                               involvedCountry: string = default(string),
                               prefix: string = default(string),
                               minConfidence: int64 = default(int64),
                               maxConfidence: int64 = default(int64),
                               dateRange: string = default(string),
                               dateStart: string = default(string),
                               dateEnd: string = default(string),
                               sortBy: set[RadarBgpSortByOption] = {},
                               sortOrder: set[RadarBgpSortOrderOption] = {},
                               format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpHijacksEventsResponse] {.async.} =
  ## Retrieves the BGP hijack events.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["eventId"] = $eventId
  q["hijackerAsn"] = $hijackerAsn
  q["victimAsn"] = $victimAsn
  q["involvedAsn"] = $involvedAsn
  q["involvedCountry"] = $involvedCountry
  q["prefix"] = $prefix
  q["minConfidence"] = $minConfidence
  q["maxConfidence"] = $maxConfidence
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  for v in sortBy: q["sortBy"] = $v
  for v in sortOrder: q["sortOrder"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/hijacks/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpHijacksEventsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpIpsTimeseries*(client: CloudflareClient, name: seq[string] = @[],
                               dateRange: seq[string] = @[],
                               dateStart: seq[string] = @[],
                               dateEnd: seq[string] = @[],
                               asn: seq[string] = @[],
                               location: seq[string] = @[],
                               ipVersion: seq[string] = default(seq[string]),
                               includeDelay: bool = default(bool),
                               format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpIpsTimeseriesResponse] {.async.} =
  ## Retrieves time series data for the announced IP space count, represented as the
  ## number of IPv4 /24s and IPv6 /48s, for a given ASN.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  q["ipVersion"] = $ipVersion
  q["includeDelay"] = $includeDelay
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/ips/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpIpsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpIpsTopAses*(client: CloudflareClient,
                            date: string = default(string), limit: int64 = 5,
                            metric: set[RadarBgpMetricOption] = {},
                            country: string = default(string),
                            format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpIpsTopAsesResponse] {.async.} =
  ## Returns the top-N autonomous systems by announced IP space at the nearest 8-hour
  ## RIB boundary at or before the requested date. The snapped boundary is returned
  ## as `anchor_ts`.

  var q = initOrderedTable[string, string]()
  q["date"] = $date
  q["limit"] = $limit
  for v in metric: q["metric"] = $v
  q["country"] = $country
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/ips/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpIpsTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpLeaksEvents*(client: CloudflareClient, page: int64 = 1,
                             perPage: int64 = 50,
                             eventId: int64 = default(int64),
                             leakAsn: int64 = default(int64),
                             involvedAsn: int64 = default(int64),
                             involvedCountry: string = default(string),
                             dateRange: string = default(string),
                             dateStart: string = default(string),
                             dateEnd: string = default(string),
                             sortBy: set[RadarBgpSortByOption] = {},
                             sortOrder: set[RadarBgpSortOrderOption] = {},
                             format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpLeaksEventsResponse] {.async.} =
  ## Retrieves the BGP route leak events.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["eventId"] = $eventId
  q["leakAsn"] = $leakAsn
  q["involvedAsn"] = $involvedAsn
  q["involvedCountry"] = $involvedCountry
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  for v in sortBy: q["sortBy"] = $v
  for v in sortOrder: q["sortOrder"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/leaks/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpLeaksEventsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesAses*(client: CloudflareClient,
                            location: string = default(string), limit: int64 = 5,
                            sortBy: set[RadarBgpSortByOption] = {},
                            sortOrder: set[RadarBgpSortOrderOption] = {},
                            format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesAsesResponse] {.async.} =
  ## Retrieves all ASes in the current global routing tables with routing statistics.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  q["limit"] = $limit
  for v in sortBy: q["sortBy"] = $v
  for v in sortOrder: q["sortOrder"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/routes/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesMoas*(client: CloudflareClient,
                            origin: int64 = default(int64),
                            prefix: string = default(string),
                            invalidOnly: bool = default(bool),
                            format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesMoasResponse] {.async.} =
  ## Retrieves all Multi-Origin AS (MOAS) prefixes in the global routing tables.

  var q = initOrderedTable[string, string]()
  q["origin"] = $origin
  q["prefix"] = $prefix
  q["invalid_only"] = $invalidOnly
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/routes/moas", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesMoasResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesPathsAsn*(client: CloudflareClient, asn: int64,
                                ipVersion: string = "IPv4",
                                collector: string = default(string),
                                format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesPathsAsnResponse] {.async.} =
  ## Retrieves the paths an AS uses to reach the tier-1 clique, derived from
  ## RouteViews RIB snapshots. Each entry is an ordered AS-path segment (from the
  ## queried AS toward a tier-1) with the number of observed paths and peers, and the
  ## collectors that observed it. By default segments are merged across all active
  ## collectors; pass "collector" to scope to one. The response also includes an
  ## "asnInfo" map (keyed by ASN) with the name and country for every ASN in the
  ## returned segments plus the queried ASN (best-effort; null when unavailable).

  var q = initOrderedTable[string, string]()
  for v in ipVersion: q["ipVersion"] = $v
  q["collector"] = $collector
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bgp/routes/paths/{asn}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesPathsAsnResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesPfx2as*(client: CloudflareClient,
                              prefix: string = default(string),
                              origin: int64 = default(int64),
                              rpkiStatus: set[RadarBgpRpkiStatusOption] = {},
                              longestPrefixMatch: bool = default(bool),
                              format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesPfx2asResponse] {.async.} =
  ## Retrieves the prefix-to-ASN mapping from global routing tables.

  var q = initOrderedTable[string, string]()
  q["prefix"] = $prefix
  q["origin"] = $origin
  for v in rpkiStatus: q["rpkiStatus"] = $v
  q["longestPrefixMatch"] = $longestPrefixMatch
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/routes/pfx2as", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesPfx2asResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesRealtime*(client: CloudflareClient,
                                prefix: string = default(string),
                                format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesRealtimeResponse] {.async.} =
  ## Retrieves real-time BGP routes for a prefix, using public real-time data
  ## collectors (RouteViews and RIPE RIS).

  var q = initOrderedTable[string, string]()
  q["prefix"] = $prefix
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/routes/realtime", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesRealtimeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesStats*(client: CloudflareClient,
                             asn: int64 = default(int64),
                             location: string = default(string),
                             format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesStatsResponse] {.async.} =
  ## Retrieves the BGP routing table stats.

  var q = initOrderedTable[string, string]()
  q["asn"] = $asn
  q["location"] = $location
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/routes/stats", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRoutesUpstreamsAsnTimeseries*(client: CloudflareClient,
                                              asn: int64,
                                              ipVersion: string = "IPv4",
                                              dateStart: string = default(string),
                                              dateEnd: string = default(string),
                                              limit: int64 = default(int64),
                                              format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse] {.async.} =
  ## Retrieves the share of an AS’s observed paths carried by each direct upstream
  ## over time, derived from RouteViews RIB snapshots across all collectors (the
  ## combined product). Each upstream ASN is returned as its own series of shares
  ## (0–1); the least-significant upstreams beyond the requested limit are grouped
  ## into an "OTHER" series. Series share a common set of timestamps.

  var q = initOrderedTable[string, string]()
  for v in ipVersion: q["ipVersion"] = $v
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["limit"] = $limit
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bgp/routes/upstreams/{asn}/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRoutesUpstreamsAsnTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRpkiAspaChanges*(client: CloudflareClient,
                                 dateStart: string = default(string),
                                 dateEnd: string = default(string),
                                 asn: int64 = default(int64),
                                 includeAsnInfo: bool = default(bool),
                                 format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRpkiAspaChangesResponse] {.async.} =
  ## Retrieves ASPA (Autonomous System Provider Authorization) changes over time.
  ## Returns daily aggregated changes including additions, removals, and
  ## modifications of ASPA objects.

  var q = initOrderedTable[string, string]()
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["asn"] = $asn
  q["includeAsnInfo"] = $includeAsnInfo
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/rpki/aspa/changes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRpkiAspaChangesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRpkiAspaSnapshot*(client: CloudflareClient,
                                  customerAsn: int64 = default(int64),
                                  providerAsn: int64 = default(int64),
                                  date: string = default(string),
                                  includeAsnInfo: bool = default(bool),
                                  format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRpkiAspaSnapshotResponse] {.async.} =
  ## Retrieves current or historical ASPA (Autonomous System Provider Authorization)
  ## objects. ASPA objects define which ASNs are authorized upstream providers for a
  ## customer ASN.

  var q = initOrderedTable[string, string]()
  q["customerAsn"] = $customerAsn
  q["providerAsn"] = $providerAsn
  q["date"] = $date
  q["includeAsnInfo"] = $includeAsnInfo
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/rpki/aspa/snapshot", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRpkiAspaSnapshotResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRpkiAspaTimeseries*(client: CloudflareClient,
                                    dateStart: string = default(string),
                                    dateEnd: string = default(string),
                                    name: seq[string] = @[],
                                    rir: seq[string] = default(seq[string]),
                                    location: seq[string] = @[],
                                    format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRpkiAspaTimeseriesResponse] {.async.} =
  ## Retrieves ASPA (Autonomous System Provider Authorization) object count over
  ## time. Supports filtering by RIR or location (country code) to generate multiple
  ## named series. If no RIR or location filter is specified, returns total count.

  var q = initOrderedTable[string, string]()
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  for v in name: q["name"] = $v
  q["rir"] = $rir
  for v in location: q["location"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/rpki/aspa/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRpkiAspaTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpRpkiRoasTimeseries*(client: CloudflareClient,
                                    dateStart: string = default(string),
                                    dateEnd: string = default(string),
                                    metric: string = "validPfxsRatio",
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    name: seq[string] = @[],
                                    format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpRpkiRoasTimeseriesResponse] {.async.} =
  ## Retrieves RPKI ROA (Route Origin Authorization) validation ratios over time.
  ## Returns the selected metric as a time series. Supports filtering by ASN or
  ## location (country code) — multiple values of the same filter type produce one
  ## series per value. If no ASN or location is specified, returns the global
  ## aggregate.

  var q = initOrderedTable[string, string]()
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  for v in metric: q["metric"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in name: q["name"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/rpki/roas/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpRpkiRoasTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpTimeseries*(client: CloudflareClient,
                            aggInterval: set[RadarBgpAggIntervalOption] = {},
                            name: seq[string] = @[],
                            dateRange: seq[string] = @[],
                            dateStart: seq[string] = @[],
                            dateEnd: seq[string] = @[],
                            prefix: seq[string] = @[],
                            updateType: seq[string] = default(seq[string]),
                            asn: seq[string] = @[],
                            format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpTimeseriesResponse] {.async.} =
  ## Retrieves BGP updates over time. When requesting updates for an autonomous
  ## system, only BGP updates of type announcement are returned.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in prefix: q["prefix"] = $v
  q["updateType"] = $updateType
  for v in asn: q["asn"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpTopAses*(client: CloudflareClient, limit: int64 = 5,
                         name: seq[string] = @[], dateRange: seq[string] = @[],
                         dateStart: seq[string] = @[],
                         dateEnd: seq[string] = @[], asn: seq[string] = @[],
                         prefix: seq[string] = @[],
                         updateType: seq[string] = default(seq[string]),
                         format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpTopAsesResponse] {.async.} =
  ## Retrieves the top autonomous systems by BGP updates (announcements only).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in prefix: q["prefix"] = $v
  q["updateType"] = $updateType
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpTopAsesPrefixes*(client: CloudflareClient,
                                 country: string = default(string),
                                 limit: int64 = default(int64),
                                 format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpTopAsesPrefixesResponse] {.async.} =
  ## Retrieves the full list of autonomous systems on the global routing table
  ## ordered by announced prefixes count. The data comes from public BGP MRT data
  ## archives and updates every 2 hours.

  var q = initOrderedTable[string, string]()
  q["country"] = $country
  q["limit"] = $limit
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/top/ases/prefixes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpTopAsesPrefixesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBgpTopPrefixes*(client: CloudflareClient, limit: int64 = 5,
                             name: seq[string] = @[],
                             dateRange: seq[string] = @[],
                             dateStart: seq[string] = @[],
                             dateEnd: seq[string] = @[], asn: seq[string] = @[],
                             updateType: seq[string] = default(seq[string]),
                             format: set[RadarBgpFormatOption] = {}): Future[GetRadarBgpTopPrefixesResponse] {.async.} =
  ## Retrieves the top network prefixes by BGP updates.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  q["updateType"] = $updateType
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bgp/top/prefixes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBgpTopPrefixesResponse)
  else:
    raise newException(CloudflareClientError, body)
