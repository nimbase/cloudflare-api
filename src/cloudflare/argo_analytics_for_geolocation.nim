# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAnalyticsLatencyColos*(client: CloudflareClient,
                                          zoneId: types.ArgoAnalyticsIdentifier): Future[types.ArgoAnalyticsResponseSingle] {.async.} =
  ## Retrieves Argo Smart Routing analytics broken down by geographic points of
  ## presence (PoPs). Shows latency improvements and routing efficiency per location.

  let res = await client.httpGET(fmt"/zones/{zoneId}/analytics/latency/colos")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoAnalyticsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
