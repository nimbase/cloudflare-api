# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCacheTieredCacheSmartTopologyEnable*(client: CloudflareClient,
                                                        zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Smart Tiered Cache dynamically selects the single closest upper tier for each of
  ## your website’s origins with no configuration required, using our in-house
  ## performance and routing data. Cloudflare collects latency data for each request
  ## to an origin, and uses the latency data to determine how well any upper-tier
  ## data center is connected with an origin. As a result, Cloudflare can select the
  ## data center with the lowest latency to be the upper-tier for an origin.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/tiered_cache_smart_topology_enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCacheTieredCacheSmartTopologyEnable*(client: CloudflareClient,
                                                         zoneId: types.CacheRulesIdentifier,
                                                         body: types.CacheRulesSmartTieredCachePatch): Future[JsonNode] {.async.} =
  ## Smart Tiered Cache dynamically selects the single closest upper tier for each of
  ## your website's origins with no configuration required, using our in-house
  ## performance and routing data. Cloudflare collects latency data for each request
  ## to an origin, and uses the latency data to determine how well any upper-tier
  ## data center is connected with an origin. As a result, Cloudflare can select the
  ## data center with the lowest latency to be the upper-tier for an origin.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/cache/tiered_cache_smart_topology_enable", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCacheTieredCacheSmartTopologyEnable*(client: CloudflareClient,
                                                           zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Smart Tiered Cache dynamically selects the single closest upper tier for each of
  ## your website’s origins with no configuration required, using our in-house
  ## performance and routing data. Cloudflare collects latency data for each request
  ## to an origin, and uses the latency data to determine how well any upper-tier
  ## data center is connected with an origin. As a result, Cloudflare can select the
  ## data center with the lowest latency to be the upper-tier for an origin.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/cache/tiered_cache_smart_topology_enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheTieredCacheSmartTopologyEnable*(client: CloudflareClient,
                                                          zoneId: types.CacheRulesIdentifier,
                                                          body: types.CacheRulesSmartTieredCachePatch): Future[JsonNode] {.async.} =
  ## Smart Tiered Cache dynamically selects the single closest upper tier for each of
  ## your website’s origins with no configuration required, using our in-house
  ## performance and routing data. Cloudflare collects latency data for each request
  ## to an origin, and uses the latency data to determine how well any upper-tier
  ## data center is connected with an origin. As a result, Cloudflare can select the
  ## data center with the lowest latency to be the upper-tier for an origin.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/tiered_cache_smart_topology_enable", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
