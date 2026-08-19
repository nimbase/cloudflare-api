# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient


proc getZonesZoneIdAiAuditRobots*(client: CloudflareClient, zoneId: string,
                                  subdomain: string = default(string)): Future[JsonNode] {.async.} =
  ## Fetches and parses the robots.txt file for a zone or a specific subdomain within
  ## the zone. Returns parsed user-agent rules, content signals, and sitemaps.

  var q = initOrderedTable[string, string]()
  q["subdomain"] = $subdomain
  let res = await client.httpGET(fmt"/zones/{zoneId}/ai-audit/robots", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAiAuditRobotsBulk*(client: CloudflareClient, zoneId: string): Future[JsonNode] {.async.} =
  ## Fetches and parses robots.txt files for multiple domains within a zone in a
  ## single request. Each domain must belong to the specified zone. Results are keyed
  ## by hostname.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/ai-audit/robots/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
