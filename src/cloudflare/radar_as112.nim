# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAs112SummaryDnssecResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryEdnsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryQueryTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryResponseCodesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112SummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsDnssecResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsEdnsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsQueryTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsResponseCodesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TopLocationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TopLocationsDnssecDnssecResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TopLocationsEdnsEdnsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAs112TopLocationsIpVersionIpVersionResponse* = object
    result: JsonNode
    success: bool
  RadarAs112FormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarAs112AggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarAs112SummaryDnssec*(client: CloudflareClient,
                                 name: seq[string] = @[],
                                 dateRange: seq[string] = @[],
                                 dateStart: seq[string] = @[],
                                 dateEnd: seq[string] = @[],
                                 location: seq[string] = @[],
                                 continent: seq[string] = @[],
                                 queryType: seq[string] = default(seq[string]),
                                 protocol: seq[string] = default(seq[string]),
                                 responseCode: seq[string] = default(seq[string]),
                                 format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryDnssecResponse] {.async.} =
  ## Retrieves the distribution of DNS queries to AS112 by DNSSEC (DNS Security
  ## Extensions) support.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/dnssec", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryDnssecResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryEdns*(client: CloudflareClient, name: seq[string] = @[],
                               dateRange: seq[string] = @[],
                               dateStart: seq[string] = @[],
                               dateEnd: seq[string] = @[],
                               location: seq[string] = @[],
                               continent: seq[string] = @[],
                               queryType: seq[string] = default(seq[string]),
                               protocol: seq[string] = default(seq[string]),
                               responseCode: seq[string] = default(seq[string]),
                               format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryEdnsResponse] {.async.} =
  ## Retrieves the distribution of DNS queries to AS112 by EDNS (Extension Mechanisms
  ## for DNS) support.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/edns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryEdnsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryIpVersion*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    queryType: seq[string] = default(seq[string]),
                                    protocol: seq[string] = default(seq[string]),
                                    responseCode: seq[string] = default(seq[string]),
                                    format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of DNS queries to AS112 by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryProtocol*(client: CloudflareClient,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   queryType: seq[string] = default(seq[string]),
                                   responseCode: seq[string] = default(seq[string]),
                                   format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryProtocolResponse] {.async.} =
  ## Retrieves the distribution of DNS queries to AS112 by protocol.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryQueryType*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    protocol: seq[string] = default(seq[string]),
                                    responseCode: seq[string] = default(seq[string]),
                                    limitPerGroup: int64 = default(int64),
                                    format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryQueryTypeResponse] {.async.} =
  ## Retrieves the distribution of DNS queries to AS112 by type.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/query_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryQueryTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryResponseCodes*(client: CloudflareClient,
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        location: seq[string] = @[],
                                        continent: seq[string] = @[],
                                        queryType: seq[string] = default(seq[string]),
                                        protocol: seq[string] = default(seq[string]),
                                        limitPerGroup: int64 = default(int64),
                                        format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryResponseCodesResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS requests classified by response code.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/summary/response_codes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryResponseCodesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112SummaryDimension*(client: CloudflareClient, dimension: string,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    queryType: seq[string] = default(seq[string]),
                                    protocol: seq[string] = default(seq[string]),
                                    responseCode: seq[string] = default(seq[string]),
                                    limitPerGroup: int64 = default(int64),
                                    format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112SummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of AS112 queries by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/as112/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112SummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112Timeseries*(client: CloudflareClient,
                              aggInterval: set[RadarAs112AggIntervalOption] = {},
                              name: seq[string] = @[],
                              dateRange: seq[string] = @[],
                              dateStart: seq[string] = @[],
                              dateEnd: seq[string] = @[],
                              location: seq[string] = @[],
                              continent: seq[string] = @[],
                              queryType: seq[string] = default(seq[string]),
                              protocol: seq[string] = default(seq[string]),
                              responseCode: seq[string] = default(seq[string]),
                              format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesResponse] {.async.} =
  ## Retrieves the AS112 DNS queries over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsDnssec*(client: CloudflareClient,
                                          aggInterval: set[RadarAs112AggIntervalOption] = {},
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          queryType: seq[string] = default(seq[string]),
                                          protocol: seq[string] = default(seq[string]),
                                          responseCode: seq[string] = default(seq[string]),
                                          format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsDnssecResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS queries by DNSSEC (DNS Security
  ## Extensions) support over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/dnssec", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsDnssecResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsEdns*(client: CloudflareClient,
                                        aggInterval: set[RadarAs112AggIntervalOption] = {},
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        location: seq[string] = @[],
                                        continent: seq[string] = @[],
                                        queryType: seq[string] = default(seq[string]),
                                        protocol: seq[string] = default(seq[string]),
                                        responseCode: seq[string] = default(seq[string]),
                                        format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsEdnsResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS queries by EDNS (Extension Mechanisms
  ## for DNS) support over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/edns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsEdnsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsIpVersion*(client: CloudflareClient,
                                             aggInterval: set[RadarAs112AggIntervalOption] = {},
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             queryType: seq[string] = default(seq[string]),
                                             protocol: seq[string] = default(seq[string]),
                                             responseCode: seq[string] = default(seq[string]),
                                             format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS queries by IP version over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsProtocol*(client: CloudflareClient,
                                            aggInterval: set[RadarAs112AggIntervalOption] = {},
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            queryType: seq[string] = default(seq[string]),
                                            responseCode: seq[string] = default(seq[string]),
                                            format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsProtocolResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS requests classified by protocol over
  ## time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsQueryType*(client: CloudflareClient,
                                             aggInterval: set[RadarAs112AggIntervalOption] = {},
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             protocol: seq[string] = default(seq[string]),
                                             responseCode: seq[string] = default(seq[string]),
                                             limitPerGroup: int64 = default(int64),
                                             format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsQueryTypeResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS queries by type over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/query_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsQueryTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsResponseCodes*(client: CloudflareClient,
                                                 aggInterval: set[RadarAs112AggIntervalOption] = {},
                                                 name: seq[string] = @[],
                                                 dateRange: seq[string] = @[],
                                                 dateStart: seq[string] = @[],
                                                 dateEnd: seq[string] = @[],
                                                 location: seq[string] = @[],
                                                 continent: seq[string] = @[],
                                                 queryType: seq[string] = default(seq[string]),
                                                 protocol: seq[string] = default(seq[string]),
                                                 limitPerGroup: int64 = default(int64),
                                                 format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsResponseCodesResponse] {.async.} =
  ## Retrieves the distribution of AS112 DNS requests classified by response code
  ## over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/timeseries_groups/response_codes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsResponseCodesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TimeseriesGroupsDimension*(client: CloudflareClient,
                                             dimension: string,
                                             aggInterval: set[RadarAs112AggIntervalOption] = {},
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             queryType: seq[string] = default(seq[string]),
                                             protocol: seq[string] = default(seq[string]),
                                             responseCode: seq[string] = default(seq[string]),
                                             limitPerGroup: int64 = default(int64),
                                             format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of AS112 queries grouped by dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/as112/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TopLocations*(client: CloudflareClient, limit: int64 = 5,
                                name: seq[string] = @[],
                                dateRange: seq[string] = @[],
                                dateStart: seq[string] = @[],
                                dateEnd: seq[string] = @[],
                                location: seq[string] = @[],
                                continent: seq[string] = @[],
                                format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TopLocationsResponse] {.async.} =
  ## Retrieves the top locations by AS112 DNS queries.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/as112/top/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TopLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TopLocationsDnssecDnssec*(client: CloudflareClient,
                                            dnssec: string, limit: int64 = 5,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TopLocationsDnssecDnssecResponse] {.async.} =
  ## Retrieves the top locations of DNS queries to AS112 with DNSSEC (DNS Security
  ## Extensions) support.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/as112/top/locations/dnssec/{dnssec}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TopLocationsDnssecDnssecResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TopLocationsEdnsEdns*(client: CloudflareClient, edns: string,
                                        limit: int64 = 5,
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        location: seq[string] = @[],
                                        continent: seq[string] = @[],
                                        format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TopLocationsEdnsEdnsResponse] {.async.} =
  ## Retrieves the top locations of DNS queries to AS112 with EDNS (Extension
  ## Mechanisms for DNS) support.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/as112/top/locations/edns/{edns}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TopLocationsEdnsEdnsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAs112TopLocationsIpVersionIpVersion*(client: CloudflareClient,
                                                  ipVersion: string,
                                                  limit: int64 = 5,
                                                  name: seq[string] = @[],
                                                  dateRange: seq[string] = @[],
                                                  dateStart: seq[string] = @[],
                                                  dateEnd: seq[string] = @[],
                                                  location: seq[string] = @[],
                                                  continent: seq[string] = @[],
                                                  format: set[RadarAs112FormatOption] = {}): Future[GetRadarAs112TopLocationsIpVersionIpVersionResponse] {.async.} =
  ## Retrieves the top locations of DNS queries to AS112 for an IP version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/as112/top/locations/ip_version/{ipVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAs112TopLocationsIpVersionIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)
