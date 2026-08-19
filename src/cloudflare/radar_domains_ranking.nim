# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarRankingDomainDomainResponse* = object
    result: JsonNode
    success: bool
  GetRadarRankingTimeseriesGroupsResponse* = object
    result: JsonNode
    success: bool
  GetRadarRankingTopResponse* = object
    result: JsonNode
    success: bool
  RadarDomainsRankingRankingTypeOption* = enum
    rankingTypePOPULAR = "POPULAR"
    rankingTypeTRENDINGRISE = "TRENDING_RISE"
    rankingTypeTRENDINGSTEADY = "TRENDING_STEADY"

  RadarDomainsRankingFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarRankingDomainDomain*(client: CloudflareClient, domain: string,
                                  limit: int64 = 5,
                                  rankingType: string = "POPULAR",
                                  name: seq[string] = @[],
                                  includeTopLocations: bool = default(bool),
                                  date: seq[string] = @[],
                                  format: set[RadarDomainsRankingFormatOption] = {}): Future[GetRadarRankingDomainDomainResponse] {.async.} =
  ## Retrieves domain rank details. Cloudflare provides an ordered rank for the top
  ## 100 domains, but for the remainder it only provides ranking buckets like top 200
  ## thousand, top one million, etc.. These are available through Radar datasets
  ## endpoints.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in rankingType: q["rankingType"] = $v
  for v in name: q["name"] = $v
  q["includeTopLocations"] = $includeTopLocations
  for v in date: q["date"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/ranking/domain/{domain}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingDomainDomainResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarRankingTimeseriesGroups*(client: CloudflareClient, limit: int64 = 5,
                                      rankingType: string = "POPULAR",
                                      name: seq[string] = @[],
                                      location: seq[string] = @[],
                                      domains: seq[string] = @[],
                                      domainCategory: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      format: set[RadarDomainsRankingFormatOption] = {}): Future[GetRadarRankingTimeseriesGroupsResponse] {.async.} =
  ## Retrieves domains rank over time.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in rankingType: q["rankingType"] = $v
  for v in name: q["name"] = $v
  for v in location: q["location"] = $v
  for v in domains: q["domains"] = $v
  for v in domainCategory: q["domainCategory"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ranking/timeseries_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingTimeseriesGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarRankingTop*(client: CloudflareClient, limit: int64 = default(int64),
                         name: seq[string] = @[], location: seq[string] = @[],
                         domainCategory: seq[string] = @[],
                         date: seq[string] = @[],
                         rankingType: string = "POPULAR",
                         format: set[RadarDomainsRankingFormatOption] = {}): Future[GetRadarRankingTopResponse] {.async.} =
  ## Retrieves the top or trending domains based on their rank. Popular domains are
  ## domains of broad appeal based on how people use the Internet. Trending domains
  ## are domains that are generating a surge in interest. For more information on top
  ## domains, see https://blog.cloudflare.com/radar-domain-rankings/.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in location: q["location"] = $v
  for v in domainCategory: q["domainCategory"] = $v
  for v in date: q["date"] = $v
  for v in rankingType: q["rankingType"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ranking/top", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingTopResponse)
  else:
    raise newException(CloudflareClientError, body)
