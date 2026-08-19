# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdManagedHeaders*(client: CloudflareClient,
                                   zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches a list of all Managed Transforms.

  let res = await client.httpGET(fmt"/zones/{zoneId}/managed_headers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdManagedHeaders*(client: CloudflareClient,
                                      zoneId: types.RulesetsZoneId): Future[AsyncResponse] {.async.} =
  ## Disables all Managed Transforms.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/managed_headers")
  return res

proc patchZonesZoneIdManagedHeaders*(client: CloudflareClient,
                                     zoneId: types.RulesetsZoneId,
                                     body: types.RulesetsManagedTransformsPatch): Future[JsonNode] {.async.} =
  ## Updates the status of one or more Managed Transforms.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/managed_headers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
