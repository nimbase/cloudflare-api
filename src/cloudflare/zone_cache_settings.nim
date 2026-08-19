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
  PatchZonesZoneIdCacheCacheReserveRequest = object
    value: types.CacheRulesCacheReserveValue
  PatchZonesZoneIdCacheRegionalTieredCacheRequest = object
    value: types.CacheRulesRegionalTieredCacheValue
  PatchZonesZoneIdCacheVariantsRequest = object
    value: types.CacheRulesVariantsValue

proc getZonesZoneIdCacheCacheReserve*(client: CloudflareClient,
                                      zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Increase cache lifetimes by automatically storing all cacheable files into
  ## Cloudflare's persistent object storage buckets. Requires Cache Reserve
  ## subscription. Note: using Tiered Cache with Cache Reserve is highly recommended
  ## to reduce Reserve operations costs. See the [developer
  ## docs](https://developers.cloudflare.com/cache/about/cache-reserve) for more
  ## information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/cache_reserve")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheCacheReserve*(client: CloudflareClient,
                                        zoneId: types.CacheRulesIdentifier,
                                        body: PatchZonesZoneIdCacheCacheReserveRequest): Future[JsonNode] {.async.} =
  ## Increase cache lifetimes by automatically storing all cacheable files into
  ## Cloudflare's persistent object storage buckets. Requires Cache Reserve
  ## subscription. Note: using Tiered Cache with Cache Reserve is highly recommended
  ## to reduce Reserve operations costs. See the [developer
  ## docs](https://developers.cloudflare.com/cache/about/cache-reserve) for more
  ## information.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/cache_reserve", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCacheCacheReserveClear*(client: CloudflareClient,
                                           zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## You can use Cache Reserve Clear to clear your Cache Reserve, but you must first
  ## disable Cache Reserve. In most cases, this will be accomplished within 24 hours.
  ## You cannot re-enable Cache Reserve while this process is ongoing. Keep in mind
  ## that you cannot undo or cancel this operation.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/cache_reserve_clear")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCacheCacheReserveClear*(client: CloudflareClient,
                                            zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## You can use Cache Reserve Clear to clear your Cache Reserve, but you must first
  ## disable Cache Reserve. In most cases, this will be accomplished within 24 hours.
  ## You cannot re-enable Cache Reserve while this process is ongoing. Keep in mind
  ## that you cannot undo or cancel this operation.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/cache/cache_reserve_clear")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCacheRegionalTieredCache*(client: CloudflareClient,
                                             zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Instructs Cloudflare to check a regional hub data center on the way to your
  ## upper tier. This can help improve performance for smart and custom tiered cache
  ## topologies.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/regional_tiered_cache")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheRegionalTieredCache*(client: CloudflareClient,
                                               zoneId: types.CacheRulesIdentifier,
                                               body: PatchZonesZoneIdCacheRegionalTieredCacheRequest): Future[JsonNode] {.async.} =
  ## Instructs Cloudflare to check a regional hub data center on the way to your
  ## upper tier. This can help improve performance for smart and custom tiered cache
  ## topologies.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/regional_tiered_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCacheVariants*(client: CloudflareClient,
                                  zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Variant support enables caching variants of images with certain file extensions
  ## in addition to the original. This only applies when the origin server sends the
  ## 'Vary: Accept' response header. If the origin server sends 'Vary: Accept' but
  ## does not serve the variant requested, the response will not be cached. This will
  ## be indicated with BYPASS cache status in the response headers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/variants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCacheVariants*(client: CloudflareClient,
                                     zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Variant support enables caching variants of images with certain file extensions
  ## in addition to the original. This only applies when the origin server sends the
  ## 'Vary: Accept' response header. If the origin server sends 'Vary: Accept' but
  ## does not serve the variant requested, the response will not be cached. This will
  ## be indicated with BYPASS cache status in the response headers.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/cache/variants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheVariants*(client: CloudflareClient,
                                    zoneId: types.CacheRulesIdentifier,
                                    body: PatchZonesZoneIdCacheVariantsRequest): Future[JsonNode] {.async.} =
  ## Variant support enables caching variants of images with certain file extensions
  ## in addition to the original. This only applies when the origin server sends the
  ## 'Vary: Accept' response header. If the origin server sends 'Vary: Accept' but
  ## does not serve the variant requested, the response will not be cached. This will
  ## be indicated with BYPASS cache status in the response headers.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/variants", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
