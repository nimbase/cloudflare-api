# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdPagerulesRequest = object
    actions: types.ZonesActions
    priority: Option[types.ZonesPriority]
    status: Option[types.ZonesStatus]
    targets: types.ZonesTargets
  PutZonesZoneIdPagerulesPageruleIdRequest = object
    actions: types.ZonesActions
    priority: Option[types.ZonesPriority]
    status: Option[types.ZonesStatus]
    targets: types.ZonesTargets
  PatchZonesZoneIdPagerulesPageruleIdRequest = object
    actions: Option[types.ZonesActions]
    priority: Option[types.ZonesPriority]
    status: Option[types.ZonesStatus]
    targets: Option[types.ZonesTargets]
  PageRuleOrderOption* = enum
    orderStatus = "status"
    orderPriority = "priority"

  PageRuleDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  PageRuleMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  PageRuleStatusOption* = enum
    statusActive = "active"
    statusDisabled = "disabled"


proc getZonesZoneIdPagerules*(client: CloudflareClient,
                              zoneId: types.ZonesIdentifier2,
                              order: string = "priority",
                              direction: string = "desc", match: string = "all",
                              status: string = "disabled"): Future[JsonNode] {.async.} =
  ## Fetches Page Rules in a zone.

  var q = initOrderedTable[string, string]()
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  for v in match: q["match"] = $v
  for v in status: q["status"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/pagerules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPagerules*(client: CloudflareClient,
                               zoneId: types.ZonesIdentifier2,
                               body: PostZonesZoneIdPagerulesRequest): Future[JsonNode] {.async.} =
  ## Creates a new Page Rule.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/pagerules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPagerulesPageruleId*(client: CloudflareClient,
                                        pageruleId: types.ZonesIdentifier2,
                                        zoneId: types.ZonesIdentifier2): Future[JsonNode] {.async.} =
  ## Fetches the details of a Page Rule.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pagerules/{pageruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPagerulesPageruleId*(client: CloudflareClient,
                                        pageruleId: types.ZonesIdentifier2,
                                        zoneId: types.ZonesIdentifier2,
                                        body: PutZonesZoneIdPagerulesPageruleIdRequest): Future[JsonNode] {.async.} =
  ## Replaces the configuration of an existing Page Rule. The configuration of the
  ## updated Page Rule will exactly match the data passed in the API request.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/pagerules/{pageruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdPagerulesPageruleId*(client: CloudflareClient,
                                           pageruleId: types.ZonesIdentifier2,
                                           zoneId: types.ZonesIdentifier2): Future[types.ZonesApiResponseSingleId2] {.async.} =
  ## Deletes an existing Page Rule.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/pagerules/{pageruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZonesApiResponseSingleId2)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdPagerulesPageruleId*(client: CloudflareClient,
                                          pageruleId: types.ZonesIdentifier2,
                                          zoneId: types.ZonesIdentifier2,
                                          body: PatchZonesZoneIdPagerulesPageruleIdRequest): Future[JsonNode] {.async.} =
  ## Updates one or more fields of an existing Page Rule.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/pagerules/{pageruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
