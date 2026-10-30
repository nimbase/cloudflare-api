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
  PatchZonesZoneIdHoldRequest = object
    hold_after: Option[string]
    include_subdomains: Option[bool]

proc getZonesZoneIdHold*(client: CloudflareClient,
                         zoneId: types.ZonesIdentifier2): Future[JsonNode] {.async.} =
  ## Retrieve whether the zone is subject to a zone hold, and metadata about the
  ## hold.

  let res = await client.httpGET(fmt"/zones/{zoneId}/hold")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdHold*(client: CloudflareClient,
                          zoneId: types.ZonesIdentifier2,
                          includeSubdomains: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Enforce a zone hold on the zone, blocking the creation and activation of zones
  ## with this zone's hostname.
  ## Zone holds cannot be enabled on CDN-only zones.

  var q = initOrderedTable[string, string]()
  q["include_subdomains"] = $includeSubdomains
  let res = await client.httpPOST(fmt"/zones/{zoneId}/hold", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdHold*(client: CloudflareClient,
                            zoneId: types.ZonesIdentifier2,
                            holdAfter: string = default(string)): Future[JsonNode] {.async.} =
  ## Stop enforcement of a zone hold on the zone, permanently or temporarily,
  ## allowing the
  ## creation and activation of zones with this zone's hostname.
  ## Existing zone holds can be removed from CDN-only zones when `hold_after` is not
  ## provided.
  ## Active holds are automatically disabled when a zone transitions to CDN-only
  ## mode.

  var q = initOrderedTable[string, string]()
  q["hold_after"] = $holdAfter
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/hold", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdHold*(client: CloudflareClient,
                           zoneId: types.ZonesIdentifier2,
                           body: PatchZonesZoneIdHoldRequest): Future[JsonNode] {.async.} =
  ## Update the `hold_after` and/or `include_subdomains` values on an existing zone
  ## hold.
  ## The hold is enabled if the `hold_after` date-time value is in the past.
  ## Existing zone holds can be removed from CDN-only zones by setting `hold_after`
  ## to `null`.
  ## Other zone hold updates cannot be made on CDN-only zones.
  ## Active holds are automatically disabled when a zone transitions to CDN-only
  ## mode.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/hold", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
