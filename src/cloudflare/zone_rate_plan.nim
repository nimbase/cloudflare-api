# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAvailablePlans*(client: CloudflareClient,
                                   zoneId: types.BillSubsApiIdentifier): Future[JsonNode] {.async.} =
  ## Lists available plans the zone can subscribe to.

  let res = await client.httpGET(fmt"/zones/{zoneId}/available_plans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAvailablePlansPlanIdentifier*(client: CloudflareClient,
                                                 planIdentifier: types.BillSubsApiIdentifier,
                                                 zoneId: types.BillSubsApiIdentifier): Future[JsonNode] {.async.} =
  ## Details of the available plan that the zone can subscribe to.

  let res = await client.httpGET(fmt"/zones/{zoneId}/available_plans/{planIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAvailableRatePlans*(client: CloudflareClient,
                                       zoneId: types.BillSubsApiIdentifier): Future[types.BillSubsApiPlanResponseCollection] {.async.} =
  ## Lists all rate plans the zone can subscribe to.

  let res = await client.httpGET(fmt"/zones/{zoneId}/available_rate_plans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPlanResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
