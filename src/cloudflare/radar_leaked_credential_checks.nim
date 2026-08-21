# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarLeakedCredentialChecksSummaryBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarLeakedCredentialChecksSummaryCompromisedResponse* = object
    result: JsonNode
    success: bool
  GetRadarLeakedCredentialChecksSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse* = object
    result: JsonNode
    success: bool
  GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarLeakedCredentialCheckFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarLeakedCredentialCheckAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarLeakedCredentialCheckNormalizationOption* = enum
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"
    normalizationMIN0MAX = "MIN0_MAX"


proc getRadarLeakedCredentialChecksSummaryBotClass*(client: CloudflareClient,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    compromised: seq[string] = default(seq[string]),
                                                    format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksSummaryBotClassResponse] {.async.} =
  ## Retrieves the distribution of HTTP authentication requests by bot class.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["compromised"] = $compromised
  q["format"] = $format
  let res = await client.httpGET("/radar/leaked_credential_checks/summary/bot_class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksSummaryBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarLeakedCredentialChecksSummaryCompromised*(client: CloudflareClient,
                                                       name: seq[string] = @[],
                                                       dateRange: seq[string] = @[],
                                                       dateStart: seq[string] = @[],
                                                       dateEnd: seq[string] = @[],
                                                       botClass: seq[string] = default(seq[string]),
                                                       format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksSummaryCompromisedResponse] {.async.} =
  ## Retrieves the distribution of HTTP authentication requests by compromised
  ## credential status.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["botClass"] = $botClass
  q["format"] = $format
  let res = await client.httpGET("/radar/leaked_credential_checks/summary/compromised", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksSummaryCompromisedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarLeakedCredentialChecksSummaryDimension*(client: CloudflareClient,
                                                     dimension: Dimension,
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     asn: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     botClass: seq[string] = default(seq[string]),
                                                     compromised: seq[string] = default(seq[string]),
                                                     limitPerGroup: int64 = default(int64),
                                                     format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of HTTP authentication requests grouped by the
  ## specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["botClass"] = $botClass
  q["compromised"] = $compromised
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/leaked_credential_checks/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarLeakedCredentialChecksTimeseriesGroupsBotClass*(client: CloudflareClient,
                                                             aggInterval: RadarLeakedCredentialCheckAggIntervalOption,
                                                             name: seq[string] = @[],
                                                             dateRange: seq[string] = @[],
                                                             dateStart: seq[string] = @[],
                                                             dateEnd: seq[string] = @[],
                                                             compromised: seq[string] = default(seq[string]),
                                                             format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse] {.async.} =
  ## Retrieves the distribution of HTTP authentication requests by bot class over
  ## time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["compromised"] = $compromised
  q["format"] = $format
  let res = await client.httpGET("/radar/leaked_credential_checks/timeseries_groups/bot_class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksTimeseriesGroupsBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarLeakedCredentialChecksTimeseriesGroupsCompromised*(client: CloudflareClient,
                                                                aggInterval: RadarLeakedCredentialCheckAggIntervalOption,
                                                                name: seq[string] = @[],
                                                                dateRange: seq[string] = @[],
                                                                dateStart: seq[string] = @[],
                                                                dateEnd: seq[string] = @[],
                                                                botClass: seq[string] = default(seq[string]),
                                                                format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse] {.async.} =
  ## Retrieves the distribution of HTTP authentication requests by compromised
  ## credential status over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["botClass"] = $botClass
  q["format"] = $format
  let res = await client.httpGET("/radar/leaked_credential_checks/timeseries_groups/compromised", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksTimeseriesGroupsCompromisedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarLeakedCredentialChecksTimeseriesGroupsDimension*(client: CloudflareClient,
                                                              dimension: Dimension,
                                                              aggInterval: RadarLeakedCredentialCheckAggIntervalOption,
                                                              name: seq[string] = @[],
                                                              dateRange: seq[string] = @[],
                                                              dateStart: seq[string] = @[],
                                                              dateEnd: seq[string] = @[],
                                                              asn: seq[string] = @[],
                                                              location: seq[string] = @[],
                                                              continent: seq[string] = @[],
                                                              botClass: seq[string] = default(seq[string]),
                                                              compromised: seq[string] = default(seq[string]),
                                                              checkResult: seq[string] = default(seq[string]),
                                                              limitPerGroup: int64 = default(int64),
                                                              normalization: RadarLeakedCredentialCheckNormalizationOption,
                                                              format: RadarLeakedCredentialCheckFormatOption): Future[GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP authentication requests, grouped by the
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
  q["botClass"] = $botClass
  q["compromised"] = $compromised
  q["checkResult"] = $checkResult
  q["limitPerGroup"] = $limitPerGroup
  q["normalization"] = $normalization
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/leaked_credential_checks/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarLeakedCredentialChecksTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
