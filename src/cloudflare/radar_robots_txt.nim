# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarRobotsTxtTopDomainCategoriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarRobotsTxtTopUserAgentsDirectiveResponse* = object
    result: JsonNode
    success: bool
  RadarRobotsTxtUserAgentCategoryOption* = enum
    userAgentCategoryAI = "AI"

  RadarRobotsTxtFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarRobotsTxtDirectiveOption* = enum
    directiveALLOW = "ALLOW"
    directiveDISALLOW = "DISALLOW"


proc getRadarRobotsTxtTopDomainCategories*(client: CloudflareClient,
                                           limit: int64 = 5,
                                           name: seq[string] = @[],
                                           userAgentCategory: string = "AI",
                                           date: seq[string] = @[],
                                           format: set[RadarRobotsTxtFormatOption] = {}): Future[GetRadarRobotsTxtTopDomainCategoriesResponse] {.async.} =
  ## Retrieves the top domain categories by the number of robots.txt files parsed.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in userAgentCategory: q["userAgentCategory"] = $v
  for v in date: q["date"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/robots_txt/top/domain_categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRobotsTxtTopDomainCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarRobotsTxtTopUserAgentsDirective*(client: CloudflareClient,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              userAgentCategory: string = "AI",
                                              date: seq[string] = @[],
                                              domainCategory: seq[string] = @[],
                                              directive: set[RadarRobotsTxtDirectiveOption] = {},
                                              format: set[RadarRobotsTxtFormatOption] = {}): Future[GetRadarRobotsTxtTopUserAgentsDirectiveResponse] {.async.} =
  ## Retrieves the top user agents on robots.txt files.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in userAgentCategory: q["userAgentCategory"] = $v
  for v in date: q["date"] = $v
  for v in domainCategory: q["domainCategory"] = $v
  for v in directive: q["directive"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/robots_txt/top/user_agents/directive", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarRobotsTxtTopUserAgentsDirectiveResponse)
  else:
    raise newException(CloudflareClientError, body)
