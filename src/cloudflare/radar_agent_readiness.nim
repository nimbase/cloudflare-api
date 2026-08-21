# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAgentReadinessSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarAgentReadinesFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarAgentReadinessSummaryDimension*(client: CloudflareClient,
                                             dimension: Dimension,
                                             date: string = default(string),
                                             domainCategory: seq[string] = @[],
                                             name: seq[string] = @[],
                                             format: RadarAgentReadinesFormatOption): Future[GetRadarAgentReadinessSummaryDimensionResponse] {.async.} =
  ## Returns a summary of AI agent readiness scores across scanned domains, grouped
  ## by the specified dimension. Data is sourced from weekly bulk scans. All values
  ## are raw domain counts.

  var q = initOrderedTable[string, string]()
  q["date"] = $date
  for v in domainCategory: q["domainCategory"] = $v
  for v in name: q["name"] = $v
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/agent_readiness/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAgentReadinessSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
