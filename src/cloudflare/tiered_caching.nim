# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdArgoTieredCaching*(client: CloudflareClient,
                                      zoneId: types.CacheSettingsIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves whether Tiered Cache is enabled for a zone. Tiered Cache reduces
  ## origin traffic by serving lower-tier cache misses from upper-tier data centers
  ## before requesting content from your origin.

  let res = await client.httpGET(fmt"/zones/{zoneId}/argo/tiered_caching")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdArgoTieredCaching*(client: CloudflareClient,
                                        zoneId: types.CacheSettingsIdentifier,
                                        body: types.CacheSettingsPatch): Future[JsonNode] {.async.} =
  ## Enables or disables Tiered Cache for a zone. Tiered Cache reduces origin traffic
  ## by serving lower-tier cache misses from upper-tier data centers before
  ## requesting content from your origin.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/argo/tiered_caching", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
