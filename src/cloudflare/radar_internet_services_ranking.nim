# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarRankingInternetServicesCategoriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarRankingInternetServicesTimeseriesGroupsResponse* = object
    result: JsonNode
    success: bool
  GetRadarRankingInternetServicesTopResponse* = object
    result: JsonNode
    success: bool
  RadarInternetServicesRankingFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarRankingInternetServicesCategories*(client: CloudflareClient,
                                                limit: int64 = default(int64),
                                                name: seq[string] = @[],
                                                date: seq[string] = @[],
                                                format: set[RadarInternetServicesRankingFormatOption] = {}): Future[GetRadarRankingInternetServicesCategoriesResponse] {.async.} =
  ## Retrieves the list of Internet services categories.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in date: q["date"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ranking/internet_services/categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingInternetServicesCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarRankingInternetServicesTimeseriesGroups*(client: CloudflareClient,
                                                      serviceCategory: seq[string] = @[],
                                                      limit: int64 = 5,
                                                      name: seq[string] = @[],
                                                      dateRange: seq[string] = @[],
                                                      dateStart: seq[string] = @[],
                                                      dateEnd: seq[string] = @[],
                                                      format: set[RadarInternetServicesRankingFormatOption] = {}): Future[GetRadarRankingInternetServicesTimeseriesGroupsResponse] {.async.} =
  ## Retrieves Internet Services rank update changes over time.

  var q = initOrderedTable[string, string]()
  for v in serviceCategory: q["serviceCategory"] = $v
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ranking/internet_services/timeseries_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingInternetServicesTimeseriesGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarRankingInternetServicesTop*(client: CloudflareClient,
                                         serviceCategory: seq[string] = @[],
                                         limit: int64 = default(int64),
                                         name: seq[string] = @[],
                                         date: seq[string] = @[],
                                         format: set[RadarInternetServicesRankingFormatOption] = {}): Future[GetRadarRankingInternetServicesTopResponse] {.async.} =
  ## Retrieves top Internet services based on their rank.

  var q = initOrderedTable[string, string]()
  for v in serviceCategory: q["serviceCategory"] = $v
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in date: q["date"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/ranking/internet_services/top", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRankingInternetServicesTopResponse)
  else:
    raise newException(CloudflareClientError, body)
