# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
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
                               perPage: float64 = default(float64)): Future[AsyncResponse] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/rate_limits", q)
  return res

proc postZonesZoneIdRateLimits*(client: CloudflareClient,
                                zoneId: types.FirewallIdentifier,
                                body: PostZonesZoneIdRateLimitsRequest): Future[AsyncResponse] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/rate_limits", body)
  return res

proc getZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                          rateLimitId: types.FirewallRateLimitId,
                                          zoneId: types.FirewallIdentifier): Future[AsyncResponse] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}")
  return res

proc putZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                          rateLimitId: types.FirewallRateLimitId,
                                          zoneId: types.FirewallIdentifier,
                                          body: PutZonesZoneIdRateLimitsRateLimitIdRequest): Future[AsyncResponse] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}", body)
  return res

proc deleteZonesZoneIdRateLimitsRateLimitId*(client: CloudflareClient,
                                             rateLimitId: types.FirewallRateLimitId,
                                             zoneId: types.FirewallIdentifier): Future[AsyncResponse] {.async.} =
  ## **Deprecated**: This endpoint returns 410 Gone. Please use the Rulesets API
  ## instead.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/rate_limits/{rateLimitId}")
  return res
