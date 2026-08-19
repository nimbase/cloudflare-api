# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdEntitlements*(client: CloudflareClient,
                                 zoneId: types.EntitlementsIdentifier): Future[types.EntitlementsEntitlementsResponse] {.async.} =
  ## Returns the list of entitlements (features and their allocations) for a given
  ## zone. Each entitlement describes a product feature the zone is permitted to use
  ## and the allocation value (boolean, count, range, enum, or string) that governs
  ## its behaviour.

  let res = await client.httpGET(fmt"/zones/{zoneId}/entitlements")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EntitlementsEntitlementsResponse)
  else:
    raise newException(CloudflareClientError, body)
