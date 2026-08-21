# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarEntitiesIpResponse* = object
    result: JsonNode
    success: bool
  RadarIpFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarEntitiesIp*(client: CloudflareClient, ip: string,
                         format: RadarIpFormatOption): Future[GetRadarEntitiesIpResponse] {.async.} =
  ## Retrieves IP address information.

  var q = initOrderedTable[string, string]()
  q["ip"] = $ip
  q["format"] = $format
  let res = await client.httpGET("/radar/entities/ip", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesIpResponse)
  else:
    raise newException(CloudflareClientError, body)
