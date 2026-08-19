# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAnalyticsLatency*(client: CloudflareClient,
                                     zoneId: types.ArgoAnalyticsIdentifier,
                                     bins: string = default(string)): Future[types.ArgoAnalyticsResponseSingle] {.async.} =
  ## Retrieves aggregate Argo Smart Routing analytics for a zone, including latency
  ## improvements, bandwidth savings, and routing statistics.

  var q = initOrderedTable[string, string]()
  q["bins"] = $bins
  let res = await client.httpGET(fmt"/zones/{zoneId}/analytics/latency", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoAnalyticsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
