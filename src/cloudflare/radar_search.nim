# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarSearchGlobalResponse* = object
    result: JsonNode
    success: bool
  RadarSearchFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarSearchGlobal*(client: CloudflareClient, limit: int64 = 5,
                           limitPerGroup: float64 = default(float64),
                           query: string,
                           `include`: seq[string] = default(seq[string]),
                           exclude: seq[string] = default(seq[string]),
                           format: RadarSearchFormatOption): Future[GetRadarSearchGlobalResponse] {.async.} =
  ## Searches for locations, autonomous systems, reports, bots, certificate logs,
  ## certificate authorities, industries and verticals. Location names can be
  ## localized by sending an `Accept-Language` HTTP header with a BCP 47 language tag
  ## (e.g., `Accept-Language: pt-PT`). The full quality-value chain is supported
  ## (e.g., `pt-PT,pt;q=0.9,en;q=0.8`).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["limitPerGroup"] = $limitPerGroup
  q["query"] = $query
  q["include"] = $`include`
  q["exclude"] = $exclude
  q["format"] = $format
  let res = await client.httpGET("/radar/search/global", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarSearchGlobalResponse)
  else:
    raise newException(CloudflareClientError, body)
