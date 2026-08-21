# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarVerifiedBotsTopBotsResponse* = object
    result: JsonNode
    success: bool
  GetRadarVerifiedBotsTopCategoriesResponse* = object
    result: JsonNode
    success: bool
  RadarVerifiedBotFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarVerifiedBotsTopBots*(client: CloudflareClient, limit: int64 = 5,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  format: RadarVerifiedBotFormatOption): Future[GetRadarVerifiedBotsTopBotsResponse] {.async.} =
  ## Retrieves the top verified bots by HTTP requests, with owner and category.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["format"] = $format
  let res = await client.httpGET("/radar/verified_bots/top/bots", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarVerifiedBotsTopBotsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarVerifiedBotsTopCategories*(client: CloudflareClient,
                                        limit: int64 = 5,
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        asn: seq[string] = @[],
                                        location: seq[string] = @[],
                                        continent: seq[string] = @[],
                                        format: RadarVerifiedBotFormatOption): Future[GetRadarVerifiedBotsTopCategoriesResponse] {.async.} =
  ## Retrieves the top verified bot categories by HTTP requests, along with their
  ## corresponding percentage, over the total verified bot HTTP requests.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["format"] = $format
  let res = await client.httpGET("/radar/verified_bots/top/categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarVerifiedBotsTopCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)
