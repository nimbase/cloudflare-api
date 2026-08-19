# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdRateLimitsRequest = object
    action: types.FirewallAction
    match: types.FirewallMatch
    period: types.FirewallPeriod
    threshold: types.FirewallThreshold
  PutZonesZoneIdRateLimitsRateLimitIdRequest = object
    action: types.FirewallAction
    match: types.FirewallMatch
    period: types.FirewallPeriod
    threshold: types.FirewallThreshold

proc getZonesZoneIdRateLimits*(client: CloudflareClient,
                               zoneId: types.FirewallIdentifier,
                               page: float64 = default(float64),
                               perPage: float64 = default(float64)): Future[types.FirewallRatelimitResponseCollection] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/rate_limits", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRatelimitResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdRateLimits*(client: CloudflareClient,
                                zoneId: types.FirewallIdentifier,
                                body: PostZonesZoneIdRateLimitsRequest): Future[types.FirewallRatelimitResponseSingle] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/rate_limits", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRatelimitResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                          rateLimitId: types.FirewallRateLimitId,
                                          zoneId: types.FirewallIdentifier): Future[types.FirewallRatelimitResponseSingle] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRatelimitResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                          rateLimitId: types.FirewallRateLimitId,
                                          zoneId: types.FirewallIdentifier,
                                          body: PutZonesZoneIdRateLimitsRateLimitIdRequest): Future[types.FirewallRatelimitResponseSingle] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRatelimitResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                             rateLimitId: types.FirewallRateLimitId,
                                             zoneId: types.FirewallIdentifier): Future[JsonNode] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
