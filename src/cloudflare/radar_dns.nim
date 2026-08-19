# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarDnsSummaryCacheHitResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryDnssecResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryDnssecAwareResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryDnssecE2eResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryMatchingAnswerResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryQueryTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryResponseCodeResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryResponseTtlResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsCacheHitResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsDnssecResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsDnssecAwareResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsDnssecE2eResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsMatchingAnswerResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsQueryTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsResponseCodeResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsResponseTtlResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarDnsTopLocationsResponse* = object
    result: JsonNode
    success: bool
  RadarDnFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarDnAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarDnNormalizationOption* = enum
    normalizationPERCENTAGE = "PERCENTAGE"
    normalizationMIN0MAX = "MIN0_MAX"
    normalizationRANK = "RANK"


proc getRadarDnsSummaryCacheHit*(client: CloudflareClient,
                                 name: seq[string] = @[],
                                 dateRange: seq[string] = @[],
                                 dateStart: seq[string] = @[],
                                 dateEnd: seq[string] = @[],
                                 asn: seq[string] = @[],
                                 location: seq[string] = @[],
                                 continent: seq[string] = @[],
                                 tld: seq[string] = @[],
                                 queryType: seq[string] = default(seq[string]),
                                 protocol: seq[string] = default(seq[string]),
                                 responseCode: seq[string] = default(seq[string]),
                                 nodata: seq[string] = @[],
                                 format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryCacheHitResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by cache status.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/cache_hit", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryCacheHitResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryDnssec*(client: CloudflareClient, name: seq[string] = @[],
                               dateRange: seq[string] = @[],
                               dateStart: seq[string] = @[],
                               dateEnd: seq[string] = @[],
                               asn: seq[string] = @[],
                               location: seq[string] = @[],
                               continent: seq[string] = @[],
                               tld: seq[string] = @[],
                               queryType: seq[string] = default(seq[string]),
                               protocol: seq[string] = default(seq[string]),
                               responseCode: seq[string] = default(seq[string]),
                               nodata: seq[string] = @[],
                               format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryDnssecResponse] {.async.} =
  ## Retrieves the distribution of DNS responses by DNSSEC (DNS Security Extensions)
  ## support.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/dnssec", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryDnssecResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryDnssecAware*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    tld: seq[string] = @[],
                                    queryType: seq[string] = default(seq[string]),
                                    protocol: seq[string] = default(seq[string]),
                                    responseCode: seq[string] = default(seq[string]),
                                    nodata: seq[string] = @[],
                                    format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryDnssecAwareResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by DNSSEC (DNS Security Extensions)
  ## client awareness.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/dnssec_aware", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryDnssecAwareResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryDnssecE2e*(client: CloudflareClient,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  tld: seq[string] = @[],
                                  queryType: seq[string] = default(seq[string]),
                                  protocol: seq[string] = default(seq[string]),
                                  responseCode: seq[string] = default(seq[string]),
                                  nodata: seq[string] = @[],
                                  format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryDnssecE2eResponse] {.async.} =
  ## Retrieves the distribution of DNSSEC-validated answers by end-to-end security
  ## status.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/dnssec_e2e", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryDnssecE2eResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryIpVersion*(client: CloudflareClient,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  tld: seq[string] = @[],
                                  queryType: seq[string] = default(seq[string]),
                                  protocol: seq[string] = default(seq[string]),
                                  responseCode: seq[string] = default(seq[string]),
                                  nodata: seq[string] = @[],
                                  format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryMatchingAnswer*(client: CloudflareClient,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       tld: seq[string] = @[],
                                       queryType: seq[string] = default(seq[string]),
                                       protocol: seq[string] = default(seq[string]),
                                       responseCode: seq[string] = default(seq[string]),
                                       nodata: seq[string] = @[],
                                       format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryMatchingAnswerResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by matching answers.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/matching_answer", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryMatchingAnswerResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryProtocol*(client: CloudflareClient,
                                 name: seq[string] = @[],
                                 dateRange: seq[string] = @[],
                                 dateStart: seq[string] = @[],
                                 dateEnd: seq[string] = @[],
                                 asn: seq[string] = @[],
                                 location: seq[string] = @[],
                                 continent: seq[string] = @[],
                                 tld: seq[string] = @[],
                                 queryType: seq[string] = default(seq[string]),
                                 responseCode: seq[string] = default(seq[string]),
                                 nodata: seq[string] = @[],
                                 format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryProtocolResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by DNS transport protocol.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryQueryType*(client: CloudflareClient,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  tld: seq[string] = @[],
                                  protocol: seq[string] = default(seq[string]),
                                  responseCode: seq[string] = default(seq[string]),
                                  nodata: seq[string] = @[],
                                  limitPerGroup: int64 = default(int64),
                                  format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryQueryTypeResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by type.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/query_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryQueryTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryResponseCode*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     tld: seq[string] = @[],
                                     queryType: seq[string] = default(seq[string]),
                                     protocol: seq[string] = default(seq[string]),
                                     nodata: seq[string] = @[],
                                     limitPerGroup: int64 = default(int64),
                                     format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryResponseCodeResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by response code.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  for v in nodata: q["nodata"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/response_code", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryResponseCodeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryResponseTtl*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    tld: seq[string] = @[],
                                    queryType: seq[string] = default(seq[string]),
                                    protocol: seq[string] = default(seq[string]),
                                    responseCode: seq[string] = default(seq[string]),
                                    nodata: seq[string] = @[],
                                    format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryResponseTtlResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by minimum response TTL.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/summary/response_ttl", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryResponseTtlResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsSummaryDimension*(client: CloudflareClient, dimension: string,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  cacheHit: seq[string] = @[],
                                  nodata: seq[string] = @[],
                                  protocol: seq[string] = default(seq[string]),
                                  queryType: seq[string] = default(seq[string]),
                                  responseCode: seq[string] = default(seq[string]),
                                  responseTtl: seq[string] = default(seq[string]),
                                  dnssec: seq[string] = default(seq[string]),
                                  dnssecAware: seq[string] = default(seq[string]),
                                  dnssecE2e: seq[string] = @[],
                                  ipVersion: seq[string] = default(seq[string]),
                                  limitPerGroup: int64 = default(int64),
                                  matchingAnswer: seq[string] = @[],
                                  tld: seq[string] = @[],
                                  format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsSummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in cacheHit: q["cacheHit"] = $v
  for v in nodata: q["nodata"] = $v
  q["protocol"] = $protocol
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  q["responseTtl"] = $responseTtl
  q["dnssec"] = $dnssec
  q["dnssecAware"] = $dnssecAware
  for v in dnssecE2e: q["dnssecE2e"] = $v
  q["ipVersion"] = $ipVersion
  q["limitPerGroup"] = $limitPerGroup
  for v in matchingAnswer: q["matchingAnswer"] = $v
  for v in tld: q["tld"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/dns/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseries*(client: CloudflareClient,
                            aggInterval: set[RadarDnAggIntervalOption] = {},
                            name: seq[string] = @[],
                            dateRange: seq[string] = @[],
                            dateStart: seq[string] = @[],
                            dateEnd: seq[string] = @[], asn: seq[string] = @[],
                            location: seq[string] = @[],
                            continent: seq[string] = @[],
                            cacheHit: seq[string] = @[],
                            nodata: seq[string] = @[],
                            protocol: seq[string] = default(seq[string]),
                            queryType: seq[string] = default(seq[string]),
                            responseCode: seq[string] = default(seq[string]),
                            responseTtl: seq[string] = default(seq[string]),
                            dnssec: seq[string] = default(seq[string]),
                            dnssecAware: seq[string] = default(seq[string]),
                            dnssecE2e: seq[string] = @[],
                            ipVersion: seq[string] = default(seq[string]),
                            matchingAnswer: seq[string] = @[],
                            tld: seq[string] = @[],
                            format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesResponse] {.async.} =
  ## Retrieves normalized query volume to the 1.1.1.1 DNS resolver over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in cacheHit: q["cacheHit"] = $v
  for v in nodata: q["nodata"] = $v
  q["protocol"] = $protocol
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  q["responseTtl"] = $responseTtl
  q["dnssec"] = $dnssec
  q["dnssecAware"] = $dnssecAware
  for v in dnssecE2e: q["dnssecE2e"] = $v
  q["ipVersion"] = $ipVersion
  for v in matchingAnswer: q["matchingAnswer"] = $v
  for v in tld: q["tld"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsCacheHit*(client: CloudflareClient,
                                          aggInterval: set[RadarDnAggIntervalOption] = {},
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          asn: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          tld: seq[string] = @[],
                                          queryType: seq[string] = default(seq[string]),
                                          protocol: seq[string] = default(seq[string]),
                                          responseCode: seq[string] = default(seq[string]),
                                          nodata: seq[string] = @[],
                                          format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsCacheHitResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by cache status over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/cache_hit", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsCacheHitResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsDnssec*(client: CloudflareClient,
                                        aggInterval: set[RadarDnAggIntervalOption] = {},
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        asn: seq[string] = @[],
                                        location: seq[string] = @[],
                                        continent: seq[string] = @[],
                                        tld: seq[string] = @[],
                                        queryType: seq[string] = default(seq[string]),
                                        protocol: seq[string] = default(seq[string]),
                                        responseCode: seq[string] = default(seq[string]),
                                        nodata: seq[string] = @[],
                                        format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsDnssecResponse] {.async.} =
  ## Retrieves the distribution of DNS responses by DNSSEC (DNS Security Extensions)
  ## support over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/dnssec", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsDnssecResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsDnssecAware*(client: CloudflareClient,
                                             aggInterval: set[RadarDnAggIntervalOption] = {},
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             asn: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             tld: seq[string] = @[],
                                             queryType: seq[string] = default(seq[string]),
                                             protocol: seq[string] = default(seq[string]),
                                             responseCode: seq[string] = default(seq[string]),
                                             nodata: seq[string] = @[],
                                             format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsDnssecAwareResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by DNSSEC (DNS Security Extensions)
  ## client awareness over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/dnssec_aware", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsDnssecAwareResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsDnssecE2e*(client: CloudflareClient,
                                           aggInterval: set[RadarDnAggIntervalOption] = {},
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           tld: seq[string] = @[],
                                           queryType: seq[string] = default(seq[string]),
                                           protocol: seq[string] = default(seq[string]),
                                           responseCode: seq[string] = default(seq[string]),
                                           nodata: seq[string] = @[],
                                           format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsDnssecE2eResponse] {.async.} =
  ## Retrieves the distribution of DNSSEC-validated answers by end-to-end security
  ## status over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/dnssec_e2e", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsDnssecE2eResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsIpVersion*(client: CloudflareClient,
                                           aggInterval: set[RadarDnAggIntervalOption] = {},
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           tld: seq[string] = @[],
                                           queryType: seq[string] = default(seq[string]),
                                           protocol: seq[string] = default(seq[string]),
                                           responseCode: seq[string] = default(seq[string]),
                                           nodata: seq[string] = @[],
                                           format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by IP version over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsMatchingAnswer*(client: CloudflareClient,
                                                aggInterval: set[RadarDnAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                asn: seq[string] = @[],
                                                location: seq[string] = @[],
                                                continent: seq[string] = @[],
                                                tld: seq[string] = @[],
                                                queryType: seq[string] = default(seq[string]),
                                                protocol: seq[string] = default(seq[string]),
                                                responseCode: seq[string] = default(seq[string]),
                                                nodata: seq[string] = @[],
                                                format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsMatchingAnswerResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by matching answers over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/matching_answer", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsMatchingAnswerResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsProtocol*(client: CloudflareClient,
                                          aggInterval: set[RadarDnAggIntervalOption] = {},
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          asn: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          tld: seq[string] = @[],
                                          queryType: seq[string] = default(seq[string]),
                                          responseCode: seq[string] = default(seq[string]),
                                          nodata: seq[string] = @[],
                                          format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsProtocolResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by DNS transport protocol over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsQueryType*(client: CloudflareClient,
                                           aggInterval: set[RadarDnAggIntervalOption] = {},
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           tld: seq[string] = @[],
                                           protocol: seq[string] = default(seq[string]),
                                           responseCode: seq[string] = default(seq[string]),
                                           nodata: seq[string] = @[],
                                           limitPerGroup: int64 = default(int64),
                                           format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsQueryTypeResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by type over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/query_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsQueryTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsResponseCode*(client: CloudflareClient,
                                              aggInterval: set[RadarDnAggIntervalOption] = {},
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              tld: seq[string] = @[],
                                              queryType: seq[string] = default(seq[string]),
                                              protocol: seq[string] = default(seq[string]),
                                              nodata: seq[string] = @[],
                                              limitPerGroup: int64 = default(int64),
                                              format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsResponseCodeResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by response code over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  for v in nodata: q["nodata"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/response_code", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsResponseCodeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsResponseTtl*(client: CloudflareClient,
                                             aggInterval: set[RadarDnAggIntervalOption] = {},
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             asn: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             tld: seq[string] = @[],
                                             queryType: seq[string] = default(seq[string]),
                                             protocol: seq[string] = default(seq[string]),
                                             responseCode: seq[string] = default(seq[string]),
                                             nodata: seq[string] = @[],
                                             format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsResponseTtlResponse] {.async.} =
  ## Retrieves the distribution of DNS queries by minimum answer TTL over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in tld: q["tld"] = $v
  q["queryType"] = $queryType
  q["protocol"] = $protocol
  q["responseCode"] = $responseCode
  for v in nodata: q["nodata"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/timeseries_groups/response_ttl", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsResponseTtlResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTimeseriesGroupsDimension*(client: CloudflareClient,
                                           dimension: string,
                                           aggInterval: set[RadarDnAggIntervalOption] = {},
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           cacheHit: seq[string] = @[],
                                           nodata: seq[string] = @[],
                                           protocol: seq[string] = default(seq[string]),
                                           queryType: seq[string] = default(seq[string]),
                                           responseCode: seq[string] = default(seq[string]),
                                           responseTtl: seq[string] = default(seq[string]),
                                           dnssec: seq[string] = default(seq[string]),
                                           dnssecAware: seq[string] = default(seq[string]),
                                           dnssecE2e: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           limitPerGroup: int64 = default(int64),
                                           matchingAnswer: seq[string] = @[],
                                           tld: seq[string] = @[],
                                           normalization: string = "PERCENTAGE",
                                           format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of DNS queries grouped by dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in cacheHit: q["cacheHit"] = $v
  for v in nodata: q["nodata"] = $v
  q["protocol"] = $protocol
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  q["responseTtl"] = $responseTtl
  q["dnssec"] = $dnssec
  q["dnssecAware"] = $dnssecAware
  for v in dnssecE2e: q["dnssecE2e"] = $v
  q["ipVersion"] = $ipVersion
  q["limitPerGroup"] = $limitPerGroup
  for v in matchingAnswer: q["matchingAnswer"] = $v
  for v in tld: q["tld"] = $v
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/dns/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTopAses*(client: CloudflareClient, limit: int64 = 5,
                         name: seq[string] = @[], dateRange: seq[string] = @[],
                         dateStart: seq[string] = @[],
                         dateEnd: seq[string] = @[], asn: seq[string] = @[],
                         location: seq[string] = @[],
                         continent: seq[string] = @[], domain: seq[string] = @[],
                         cacheHit: seq[string] = @[], nodata: seq[string] = @[],
                         protocol: seq[string] = default(seq[string]),
                         queryType: seq[string] = default(seq[string]),
                         responseCode: seq[string] = default(seq[string]),
                         responseTtl: seq[string] = default(seq[string]),
                         dnssec: seq[string] = default(seq[string]),
                         dnssecAware: seq[string] = default(seq[string]),
                         dnssecE2e: seq[string] = @[],
                         ipVersion: seq[string] = default(seq[string]),
                         matchingAnswer: seq[string] = @[],
                         format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTopAsesResponse] {.async.} =
  ## Retrieves the top autonomous systems by DNS queries made to 1.1.1.1 DNS
  ## resolver.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in domain: q["domain"] = $v
  for v in cacheHit: q["cacheHit"] = $v
  for v in nodata: q["nodata"] = $v
  q["protocol"] = $protocol
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  q["responseTtl"] = $responseTtl
  q["dnssec"] = $dnssec
  q["dnssecAware"] = $dnssecAware
  for v in dnssecE2e: q["dnssecE2e"] = $v
  q["ipVersion"] = $ipVersion
  for v in matchingAnswer: q["matchingAnswer"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDnsTopLocations*(client: CloudflareClient, limit: int64 = 5,
                              name: seq[string] = @[],
                              dateRange: seq[string] = @[],
                              dateStart: seq[string] = @[],
                              dateEnd: seq[string] = @[], asn: seq[string] = @[],
                              location: seq[string] = @[],
                              continent: seq[string] = @[],
                              domain: seq[string] = @[],
                              cacheHit: seq[string] = @[],
                              nodata: seq[string] = @[],
                              protocol: seq[string] = default(seq[string]),
                              queryType: seq[string] = default(seq[string]),
                              responseCode: seq[string] = default(seq[string]),
                              responseTtl: seq[string] = default(seq[string]),
                              dnssec: seq[string] = default(seq[string]),
                              dnssecAware: seq[string] = default(seq[string]),
                              dnssecE2e: seq[string] = @[],
                              ipVersion: seq[string] = default(seq[string]),
                              matchingAnswer: seq[string] = @[],
                              tld: seq[string] = @[],
                              format: set[RadarDnFormatOption] = {}): Future[GetRadarDnsTopLocationsResponse] {.async.} =
  ## Retrieves the top locations by DNS queries made to 1.1.1.1 DNS resolver.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in domain: q["domain"] = $v
  for v in cacheHit: q["cacheHit"] = $v
  for v in nodata: q["nodata"] = $v
  q["protocol"] = $protocol
  q["queryType"] = $queryType
  q["responseCode"] = $responseCode
  q["responseTtl"] = $responseTtl
  q["dnssec"] = $dnssec
  q["dnssecAware"] = $dnssecAware
  for v in dnssecE2e: q["dnssecE2e"] = $v
  q["ipVersion"] = $ipVersion
  for v in matchingAnswer: q["matchingAnswer"] = $v
  for v in tld: q["tld"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/dns/top/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDnsTopLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)
