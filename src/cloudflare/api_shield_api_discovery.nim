# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PatchZonesZoneIdApiGatewayDiscoveryOperationsDiscoveryIdRequest = object
    state: Option[JsonNode]
  ApiShieldApiDiscoveryDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ApiShieldApiDiscoveryOrderOption* = enum
    orderHost = "host"
    orderMethod = "method"
    orderEndpoint = "endpoint"
    orderTrafficStatsRequests = "traffic_stats.requests"
    orderTrafficStatsLastUpdated = "traffic_stats.last_updated"


proc getZonesZoneIdApiGatewayDiscovery*(client: CloudflareClient): Future[types.ApiShieldSchemaResponseDiscovery] {.async.} =
  ## Retrieve the most up to date view of discovered operations, rendered as OpenAPI
  ## schemas

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/discovery")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldSchemaResponseDiscovery)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayDiscoveryOperations*(client: CloudflareClient,
                                                  page: int64 = 1,
                                                  perPage: int64 = 20,
                                                  host: seq[string] = @[],
                                                  `method`: seq[string] = @[],
                                                  endpoint: string = default(string),
                                                  direction: set[ApiShieldApiDiscoveryDirectionOption] = {},
                                                  order: set[ApiShieldApiDiscoveryOrderOption] = {},
                                                  diff: bool = default(bool),
                                                  origin: types.ApiShieldApiDiscoveryOrigin = default(types.ApiShieldApiDiscoveryOrigin),
                                                  state: types.ApiShieldApiDiscoveryState = default(types.ApiShieldApiDiscoveryState)): Future[JsonNode] {.async.} =
  ## Retrieve the most up to date view of discovered operations

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in host: q["host"] = $v
  for v in `method`: q["method"] = $v
  q["endpoint"] = $endpoint
  for v in direction: q["direction"] = $v
  for v in order: q["order"] = $v
  q["diff"] = $diff
  q["origin"] = $origin
  q["state"] = $state
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/discovery/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewayDiscoveryOperations*(client: CloudflareClient,
                                                    body: types.ApiShieldApiDiscoveryPatchMultipleRequest): Future[types.ApiShieldPatchDiscoveriesResponse] {.async.} =
  ## Update the `state` on one or more discovered operations

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/discovery/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldPatchDiscoveriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayDiscoveryOperationsDiscoveryId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieve a single discovered operation by ID

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/discovery/operations/{discovery_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewayDiscoveryOperationsDiscoveryId*(client: CloudflareClient,
                                                               body: PatchZonesZoneIdApiGatewayDiscoveryOperationsDiscoveryIdRequest): Future[types.ApiShieldPatchDiscoveryResponse] {.async.} =
  ## Update the `state` on a discovered operation

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/discovery/operations/{discovery_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldPatchDiscoveryResponse)
  else:
    raise newException(CloudflareClientError, body)
