# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarBotsResponse* = object
    result: JsonNode
    success: bool
  GetRadarBotsSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarBotsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarBotsTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarBotsBotSlugResponse* = object
    result: JsonNode
    success: bool
  RadarBotBotCategoryOption* = enum
    botCategorySEARCHENGINECRAWLER = "SEARCH_ENGINE_CRAWLER"
    botCategorySEARCHENGINEOPTIMIZATION = "SEARCH_ENGINE_OPTIMIZATION"
    botCategoryMONITORINGANDANALYTICS = "MONITORING_AND_ANALYTICS"
    botCategoryADVERTISINGANDMARKETING = "ADVERTISING_AND_MARKETING"
    botCategorySOCIALMEDIAMARKETING = "SOCIAL_MEDIA_MARKETING"
    botCategoryPAGEPREVIEW = "PAGE_PREVIEW"
    botCategoryACADEMICRESEARCH = "ACADEMIC_RESEARCH"
    botCategorySECURITY = "SECURITY"
    botCategoryACCESSIBILITY = "ACCESSIBILITY"
    botCategoryWEBHOOKS = "WEBHOOKS"
    botCategoryFEEDFETCHER = "FEED_FETCHER"
    botCategoryAICRAWLER = "AI_CRAWLER"
    botCategoryAGGREGATOR = "AGGREGATOR"
    botCategoryAIASSISTANT = "AI_ASSISTANT"
    botCategoryAISEARCH = "AI_SEARCH"
    botCategoryARCHIVER = "ARCHIVER"

  RadarBotKindOption* = enum
    kindAGENT = "AGENT"
    kindBOT = "BOT"

  RadarBotBotVerificationStatusOption* = enum
    botVerificationStatusVERIFIED = "VERIFIED"

  RadarBotFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarBotAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarBots*(client: CloudflareClient, limit: int64 = 5,
                   offset: int64 = default(int64),
                   botCategory: set[RadarBotBotCategoryOption] = {},
                   botOperator: string = default(string),
                   kind: set[RadarBotKindOption] = {},
                   botVerificationStatus: set[RadarBotBotVerificationStatusOption] = {},
                   format: set[RadarBotFormatOption] = {}): Future[GetRadarBotsResponse] {.async.} =
  ## Retrieves a list of bots.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  for v in botCategory: q["botCategory"] = $v
  q["botOperator"] = $botOperator
  for v in kind: q["kind"] = $v
  for v in botVerificationStatus: q["botVerificationStatus"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bots", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBotsSummaryDimension*(client: CloudflareClient, dimension: string,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   limitPerGroup: int64 = default(int64),
                                   bot: seq[string] = @[],
                                   botOperator: seq[string] = @[],
                                   botCategory: seq[string] = default(seq[string]),
                                   botKind: seq[string] = default(seq[string]),
                                   botVerificationStatus: seq[string] = default(seq[string]),
                                   format: set[RadarBotFormatOption] = {}): Future[GetRadarBotsSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of bots HTTP requests grouped by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in bot: q["bot"] = $v
  for v in botOperator: q["botOperator"] = $v
  q["botCategory"] = $botCategory
  q["botKind"] = $botKind
  q["botVerificationStatus"] = $botVerificationStatus
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bots/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBotsTimeseries*(client: CloudflareClient,
                             aggInterval: set[RadarBotAggIntervalOption] = {},
                             name: seq[string] = @[],
                             dateRange: seq[string] = @[],
                             dateStart: seq[string] = @[],
                             dateEnd: seq[string] = @[], asn: seq[string] = @[],
                             location: seq[string] = @[],
                             continent: seq[string] = @[],
                             bot: seq[string] = @[],
                             botOperator: seq[string] = @[],
                             botCategory: seq[string] = default(seq[string]),
                             botKind: seq[string] = default(seq[string]),
                             botVerificationStatus: seq[string] = default(seq[string]),
                             format: set[RadarBotFormatOption] = {}): Future[GetRadarBotsTimeseriesResponse] {.async.} =
  ## Retrieves bots HTTP request volume over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in bot: q["bot"] = $v
  for v in botOperator: q["botOperator"] = $v
  q["botCategory"] = $botCategory
  q["botKind"] = $botKind
  q["botVerificationStatus"] = $botVerificationStatus
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/bots/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBotsTimeseriesGroupsDimension*(client: CloudflareClient,
                                            dimension: string,
                                            aggInterval: set[RadarBotAggIntervalOption] = {},
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            limitPerGroup: int64 = default(int64),
                                            bot: seq[string] = @[],
                                            botOperator: seq[string] = @[],
                                            botCategory: seq[string] = default(seq[string]),
                                            botKind: seq[string] = default(seq[string]),
                                            botVerificationStatus: seq[string] = default(seq[string]),
                                            format: set[RadarBotFormatOption] = {}): Future[GetRadarBotsTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests from bots, grouped by the specified
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
  q["limitPerGroup"] = $limitPerGroup
  for v in bot: q["bot"] = $v
  for v in botOperator: q["botOperator"] = $v
  q["botCategory"] = $botCategory
  q["botKind"] = $botKind
  q["botVerificationStatus"] = $botVerificationStatus
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bots/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarBotsBotSlug*(client: CloudflareClient, botSlug: string,
                          format: set[RadarBotFormatOption] = {}): Future[GetRadarBotsBotSlugResponse] {.async.} =
  ## Retrieves the requested bot information.

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/bots/{botSlug}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarBotsBotSlugResponse)
  else:
    raise newException(CloudflareClientError, body)
