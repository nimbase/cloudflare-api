# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAttacksLayer7SummaryHttpMethodResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryManagedRulesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryMitigationProductResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryVerticalResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7SummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopAsesOriginResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopAttacksResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopLocationsOriginResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopLocationsTargetResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer7TopVerticalResponse* = object
    result: JsonNode
    success: bool
  RadarLayer7AttackFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarLayer7AttackAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarLayer7AttackNormalizationOption* = enum
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"
    normalizationMIN0MAX = "MIN0_MAX"

  RadarLayer7AttackLimitDirectionOption* = enum
    limitDirectionORIGIN = "ORIGIN"
    limitDirectionTARGET = "TARGET"


proc getRadarAttacksLayer7SummaryHttpMethod*(client: CloudflareClient,
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             asn: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             ipVersion: seq[string] = default(seq[string]),
                                             httpVersion: seq[string] = default(seq[string]),
                                             mitigationProduct: seq[string] = default(seq[string]),
                                             limitPerGroup: int64 = default(int64),
                                             format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryHttpMethodResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by HTTP method.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["mitigationProduct"] = $mitigationProduct
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/http_method", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryHttpMethodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryHttpVersion*(client: CloudflareClient,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              ipVersion: seq[string] = default(seq[string]),
                                              httpMethod: seq[string] = default(seq[string]),
                                              mitigationProduct: seq[string] = default(seq[string]),
                                              format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryHttpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by HTTP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/http_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryIndustry*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           httpVersion: seq[string] = default(seq[string]),
                                           httpMethod: seq[string] = default(seq[string]),
                                           mitigationProduct: seq[string] = default(seq[string]),
                                           limitPerGroup: int64 = default(int64),
                                           format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryIndustryResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by targeted industry.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryIpVersion*(client: CloudflareClient,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            httpVersion: seq[string] = default(seq[string]),
                                            httpMethod: seq[string] = default(seq[string]),
                                            mitigationProduct: seq[string] = default(seq[string]),
                                            format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryManagedRules*(client: CloudflareClient,
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               asn: seq[string] = @[],
                                               location: seq[string] = @[],
                                               continent: seq[string] = @[],
                                               ipVersion: seq[string] = default(seq[string]),
                                               httpVersion: seq[string] = default(seq[string]),
                                               httpMethod: seq[string] = default(seq[string]),
                                               mitigationProduct: seq[string] = default(seq[string]),
                                               limitPerGroup: int64 = default(int64),
                                               format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryManagedRulesResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by managed rules.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/managed_rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryManagedRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryMitigationProduct*(client: CloudflareClient,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    asn: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    httpVersion: seq[string] = default(seq[string]),
                                                    httpMethod: seq[string] = default(seq[string]),
                                                    limitPerGroup: int64 = default(int64),
                                                    format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryMitigationProductResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by mitigation product.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/mitigation_product", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryMitigationProductResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryVertical*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           httpVersion: seq[string] = default(seq[string]),
                                           httpMethod: seq[string] = default(seq[string]),
                                           mitigationProduct: seq[string] = default(seq[string]),
                                           limitPerGroup: int64 = default(int64),
                                           format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryVerticalResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by targeted vertical.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/summary/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7SummaryDimension*(client: CloudflareClient,
                                            dimension: string,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            ipVersion: seq[string] = default(seq[string]),
                                            httpVersion: seq[string] = default(seq[string]),
                                            httpMethod: seq[string] = default(seq[string]),
                                            mitigationProduct: seq[string] = default(seq[string]),
                                            limitPerGroup: int64 = default(int64),
                                            format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7SummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/attacks/layer7/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7SummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7Timeseries*(client: CloudflareClient,
                                      aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      asn: seq[string] = @[],
                                      location: seq[string] = @[],
                                      continent: seq[string] = @[],
                                      normalization: set[RadarLayer7AttackNormalizationOption] = {},
                                      ipVersion: seq[string] = default(seq[string]),
                                      httpVersion: seq[string] = default(seq[string]),
                                      httpMethod: seq[string] = default(seq[string]),
                                      mitigationProduct: seq[string] = default(seq[string]),
                                      format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesResponse] {.async.} =
  ## Retrieves layer 7 attacks over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in normalization: q["normalization"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsHttpMethod*(client: CloudflareClient,
                                                      aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                      name: seq[string] = @[],
                                                      dateRange: seq[string] = @[],
                                                      dateStart: seq[string] = @[],
                                                      dateEnd: seq[string] = @[],
                                                      asn: seq[string] = @[],
                                                      location: seq[string] = @[],
                                                      continent: seq[string] = @[],
                                                      ipVersion: seq[string] = default(seq[string]),
                                                      httpVersion: seq[string] = default(seq[string]),
                                                      mitigationProduct: seq[string] = default(seq[string]),
                                                      normalization: string = "PERCENTAGE",
                                                      limitPerGroup: int64 = default(int64),
                                                      format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by HTTP method over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/http_method", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsHttpMethodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsHttpVersion*(client: CloudflareClient,
                                                       aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                       name: seq[string] = @[],
                                                       dateRange: seq[string] = @[],
                                                       dateStart: seq[string] = @[],
                                                       dateEnd: seq[string] = @[],
                                                       asn: seq[string] = @[],
                                                       location: seq[string] = @[],
                                                       continent: seq[string] = @[],
                                                       ipVersion: seq[string] = default(seq[string]),
                                                       httpMethod: seq[string] = default(seq[string]),
                                                       mitigationProduct: seq[string] = default(seq[string]),
                                                       normalization: string = "PERCENTAGE",
                                                       format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by HTTP version over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/http_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsIndustry*(client: CloudflareClient,
                                                    aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    asn: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    httpVersion: seq[string] = default(seq[string]),
                                                    httpMethod: seq[string] = default(seq[string]),
                                                    mitigationProduct: seq[string] = default(seq[string]),
                                                    normalization: string = "PERCENTAGE",
                                                    limitPerGroup: int64 = default(int64),
                                                    format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by targeted industry over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsIpVersion*(client: CloudflareClient,
                                                     aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     asn: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     httpVersion: seq[string] = default(seq[string]),
                                                     httpMethod: seq[string] = default(seq[string]),
                                                     mitigationProduct: seq[string] = default(seq[string]),
                                                     normalization: string = "PERCENTAGE",
                                                     format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by IP version used over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsManagedRules*(client: CloudflareClient,
                                                        aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                        name: seq[string] = @[],
                                                        dateRange: seq[string] = @[],
                                                        dateStart: seq[string] = @[],
                                                        dateEnd: seq[string] = @[],
                                                        asn: seq[string] = @[],
                                                        location: seq[string] = @[],
                                                        continent: seq[string] = @[],
                                                        ipVersion: seq[string] = default(seq[string]),
                                                        httpVersion: seq[string] = default(seq[string]),
                                                        httpMethod: seq[string] = default(seq[string]),
                                                        mitigationProduct: seq[string] = default(seq[string]),
                                                        normalization: string = "PERCENTAGE",
                                                        limitPerGroup: int64 = default(int64),
                                                        format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by managed rules over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/managed_rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsManagedRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsMitigationProduct*(client: CloudflareClient,
                                                             aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                             name: seq[string] = @[],
                                                             dateRange: seq[string] = @[],
                                                             dateStart: seq[string] = @[],
                                                             dateEnd: seq[string] = @[],
                                                             asn: seq[string] = @[],
                                                             location: seq[string] = @[],
                                                             continent: seq[string] = @[],
                                                             ipVersion: seq[string] = default(seq[string]),
                                                             httpVersion: seq[string] = default(seq[string]),
                                                             httpMethod: seq[string] = default(seq[string]),
                                                             normalization: string = "PERCENTAGE",
                                                             limitPerGroup: int64 = default(int64),
                                                             format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by mitigation product over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/mitigation_product", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsMitigationProductResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsVertical*(client: CloudflareClient,
                                                    aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    asn: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    httpVersion: seq[string] = default(seq[string]),
                                                    httpMethod: seq[string] = default(seq[string]),
                                                    mitigationProduct: seq[string] = default(seq[string]),
                                                    normalization: string = "PERCENTAGE",
                                                    limitPerGroup: int64 = default(int64),
                                                    format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks by targeted vertical over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/timeseries_groups/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TimeseriesGroupsDimension*(client: CloudflareClient,
                                                     dimension: string,
                                                     aggInterval: set[RadarLayer7AttackAggIntervalOption] = {},
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     asn: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     ipVersion: seq[string] = default(seq[string]),
                                                     httpVersion: seq[string] = default(seq[string]),
                                                     httpMethod: seq[string] = default(seq[string]),
                                                     mitigationProduct: seq[string] = default(seq[string]),
                                                     normalization: string = "PERCENTAGE",
                                                     limitPerGroup: int64 = default(int64),
                                                     format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of layer 7 attacks grouped by dimension over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in normalization: q["normalization"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/attacks/layer7/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopAsesOrigin*(client: CloudflareClient,
                                         limit: int64 = 5,
                                         name: seq[string] = @[],
                                         dateRange: seq[string] = @[],
                                         dateStart: seq[string] = @[],
                                         dateEnd: seq[string] = @[],
                                         location: seq[string] = @[],
                                         continent: seq[string] = @[],
                                         ipVersion: seq[string] = default(seq[string]),
                                         httpVersion: seq[string] = default(seq[string]),
                                         httpMethod: seq[string] = default(seq[string]),
                                         mitigationProduct: seq[string] = default(seq[string]),
                                         format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopAsesOriginResponse] {.async.} =
  ## Retrieves the top origin autonomous systems of layer 7 attacks. Values are
  ## percentages of the total layer 7 attacks, with the origin autonomous systems
  ## determined by the client IP address.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/ases/origin", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopAsesOriginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopAttacks*(client: CloudflareClient, limit: int64 = 5,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      asn: seq[string] = @[],
                                      location: seq[string] = @[],
                                      continent: seq[string] = @[],
                                      mitigationProduct: seq[string] = default(seq[string]),
                                      limitDirection: string = "ORIGIN",
                                      limitPerLocation: int64 = 10,
                                      normalization: string = "PERCENTAGE",
                                      format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopAttacksResponse] {.async.} =
  ## Retrieves the top attacks from origin to target location. Values are percentages
  ## of the total layer 7 attacks (with billing country). The attack magnitude can be
  ## defined by the number of mitigated requests or by the number of zones affected.
  ## You can optionally limit the number of attacks by origin/target location (useful
  ## if all the top attacks are from or to the same location).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["mitigationProduct"] = $mitigationProduct
  for v in limitDirection: q["limitDirection"] = $v
  q["limitPerLocation"] = $limitPerLocation
  for v in normalization: q["normalization"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/attacks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopAttacksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopIndustry*(client: CloudflareClient,
                                       limit: int64 = 5, name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       ipVersion: seq[string] = default(seq[string]),
                                       httpVersion: seq[string] = default(seq[string]),
                                       httpMethod: seq[string] = default(seq[string]),
                                       mitigationProduct: seq[string] = default(seq[string]),
                                       format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopIndustryResponse] {.async.} =
  ## This endpoint is deprecated. To continue getting this data, switch to the
  ## summary by industry endpoint.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopLocationsOrigin*(client: CloudflareClient,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              ipVersion: seq[string] = default(seq[string]),
                                              httpVersion: seq[string] = default(seq[string]),
                                              httpMethod: seq[string] = default(seq[string]),
                                              mitigationProduct: seq[string] = default(seq[string]),
                                              format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopLocationsOriginResponse] {.async.} =
  ## Retrieves the top origin locations of layer 7 attacks. Values are percentages of
  ## the total layer 7 attacks, with the origin location determined by the client IP
  ## address.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/locations/origin", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopLocationsOriginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopLocationsTarget*(client: CloudflareClient,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              mitigationProduct: seq[string] = default(seq[string]),
                                              format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopLocationsTargetResponse] {.async.} =
  ## Retrieves the top target locations of and by layer 7 attacks. Values are a
  ## percentage out of the total layer 7 attacks. The target location is determined
  ## by the attacked zone's billing country, when available.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in continent: q["continent"] = $v
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/locations/target", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopLocationsTargetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer7TopVertical*(client: CloudflareClient,
                                       limit: int64 = 5, name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       asn: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       ipVersion: seq[string] = default(seq[string]),
                                       httpVersion: seq[string] = default(seq[string]),
                                       httpMethod: seq[string] = default(seq[string]),
                                       mitigationProduct: seq[string] = default(seq[string]),
                                       format: set[RadarLayer7AttackFormatOption] = {}): Future[GetRadarAttacksLayer7TopVerticalResponse] {.async.} =
  ## This endpoint is deprecated. To continue getting this data, switch to the
  ## summary by vertical endpoint.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["httpVersion"] = $httpVersion
  q["httpMethod"] = $httpMethod
  q["mitigationProduct"] = $mitigationProduct
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/attacks/layer7/top/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer7TopVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)
