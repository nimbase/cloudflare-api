# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarAiMarkdownForAgentsSummaryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAiMarkdownForAgentsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  RadarMarkdownForAgentFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarMarkdownForAgentAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarAiMarkdownForAgentsSummary*(client: CloudflareClient,
                                         name: seq[string] = @[],
                                         dateRange: seq[string] = @[],
                                         dateStart: seq[string] = @[],
                                         dateEnd: seq[string] = @[],
                                         format: RadarMarkdownForAgentFormatOption): Future[GetRadarAiMarkdownForAgentsSummaryResponse] {.async.} =
  ## Retrieves the overall median HTML-to-markdown reduction ratio for AI agent
  ## requests over the given date range.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["format"] = $format
  let res = await client.httpGET("/radar/ai/markdown_for_agents/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiMarkdownForAgentsSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAiMarkdownForAgentsTimeseries*(client: CloudflareClient,
                                            aggInterval: RadarMarkdownForAgentAggIntervalOption,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            format: RadarMarkdownForAgentFormatOption): Future[GetRadarAiMarkdownForAgentsTimeseriesResponse] {.async.} =
  ## Retrieves the median HTML-to-markdown reduction ratio over time for AI agent
  ## requests.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["format"] = $format
  let res = await client.httpGET("/radar/ai/markdown_for_agents/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAiMarkdownForAgentsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)
