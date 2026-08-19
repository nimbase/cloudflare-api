# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSmartShieldCacheReserveClear*(client: CloudflareClient,
                                                 zoneId: types.SmartshieldIdentifier): Future[JsonNode] {.async.} =
  ## You can use Cache Reserve Clear to clear your Cache Reserve, but you must first
  ## disable Cache Reserve. In most cases, this will be accomplished within 24 hours.
  ## You cannot re-enable Cache Reserve while this process is ongoing. Keep in mind
  ## that you cannot undo or cancel this operation.

  let res = await client.httpGET(fmt"/zones/{zoneId}/smart_shield/cache_reserve_clear")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSmartShieldCacheReserveClear*(client: CloudflareClient,
                                                  zoneId: types.SmartshieldIdentifier): Future[JsonNode] {.async.} =
  ## You can use Cache Reserve Clear to clear your Cache Reserve, but you must first
  ## disable Cache Reserve. In most cases, this will be accomplished within 24 hours.
  ## You cannot re-enable Cache Reserve while this process is ongoing. Keep in mind
  ## that you cannot undo or cancel this operation.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/smart_shield/cache_reserve_clear")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
