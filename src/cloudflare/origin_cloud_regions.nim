# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCacheOriginCloudRegions*(client: CloudflareClient,
                                            zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Returns all IP-to-cloud-region mappings configured for the zone. Each mapping
  ## tells Cloudflare which cloud vendor and region hosts the origin at that IP,
  ## enabling the edge to route via the nearest Tiered Cache upper-tier co-located
  ## with that cloud provider. Returns an empty array when no mappings exist.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/origin_cloud_regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCacheOriginCloudRegions*(client: CloudflareClient,
                                             zoneId: types.CacheRulesIdentifier,
                                             body: types.CacheRulesOriginCloudRegionRequest): Future[JsonNode] {.async.} =
  ## Adds a single IP-to-cloud-region mapping for the zone. The IP must be a valid
  ## IPv4 or IPv6 address and is normalized to canonical form before storage (RFC
  ## 5952 for IPv6). Returns 400 (code 1145) if a mapping for that IP already exists
  ## — use PATCH to update an existing entry. The vendor and region are validated
  ## against the list from `GET
  ## /zones/{zone_id}/cache/origin_cloud_regions/supported_regions`.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/cache/origin_cloud_regions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheOriginCloudRegions*(client: CloudflareClient,
                                              zoneId: types.CacheRulesIdentifier,
                                              body: types.CacheRulesOriginCloudRegionRequest): Future[JsonNode] {.async.} =
  ## Adds or updates a single IP-to-cloud-region mapping for the zone. Unlike POST,
  ## this operation is idempotent — if a mapping for the IP already exists it is
  ## overwritten. Returns the complete updated list of all mappings for the zone.
  ## Returns 403 (code 1164) when the zone has reached the limit of 3,500 IP
  ## mappings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/origin_cloud_regions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCacheOriginCloudRegionsBatch*(client: CloudflareClient,
                                                    zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Removes up to 100 IP-to-cloud-region mappings in a single request. Each IP is
  ## validated independently — successfully deleted items are returned in the
  ## `succeeded` array and IPs that could not be found or are invalid are returned in
  ## the `failed` array.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/cache/origin_cloud_regions/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCacheOriginCloudRegionsBatch*(client: CloudflareClient,
                                                   zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Adds or updates up to 100 IP-to-cloud-region mappings in a single request. Each
  ## item is validated independently — valid items are applied and invalid items are
  ## returned in the `failed` array. The vendor and region for every item are
  ## validated against the list from `GET
  ## /zones/{zone_id}/cache/origin_cloud_regions/supported_regions`.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/cache/origin_cloud_regions/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCacheOriginCloudRegionsSupportedRegions*(client: CloudflareClient,
                                                            zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Returns the cloud vendors and regions that are valid values for origin cloud
  ## region mappings. Each region includes the Tiered Cache upper-tier colocation
  ## codes that will be used for cache routing when a mapping targeting that region
  ## is active. Requires the zone to have Tiered Cache enabled.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/origin_cloud_regions/supported_regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCacheOriginCloudRegionsOriginIp*(client: CloudflareClient,
                                                    zoneId: types.CacheRulesIdentifier,
                                                    originIp: string): Future[JsonNode] {.async.} =
  ## Returns the cloud region mapping for a single origin IP address. The IP path
  ## parameter is normalized before lookup (RFC 5952 for IPv6). Returns 404 (code
  ## 1142) if the zone has no mappings or if the specified IP has no mapping.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/origin_cloud_regions/{originIp}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCacheOriginCloudRegionsOriginIp*(client: CloudflareClient,
                                                       zoneId: types.CacheRulesIdentifier,
                                                       originIp: string): Future[JsonNode] {.async.} =
  ## Removes the cloud region mapping for a single origin IP address. The IP path
  ## parameter is normalized before lookup. Returns the deleted entry on success.
  ## Returns 404 (code 1163) if no mapping exists for the specified IP. When the last
  ## mapping for the zone is removed the underlying rule record is also deleted.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/cache/origin_cloud_regions/{originIp}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginCloudRegions*(client: CloudflareClient,
                                       zoneId: types.CacheRulesIdentifier,
                                       page: int64 = 1, perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns all IP-to-cloud-region mappings configured for the zone with pagination
  ## support. Each mapping tells Cloudflare which cloud vendor and region hosts the
  ## origin at that IP, enabling the edge to route via the nearest Tiered Cache
  ## upper-tier co-located with that cloud provider. Returns an empty array when no
  ## mappings exist.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/origin/cloud_regions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdOriginCloudRegionsBatch*(client: CloudflareClient,
                                            zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Upserts up to 100 IP-to-cloud-region mappings in a single request. Items in the
  ## request body are created or replaced; mappings not included in the request body
  ## are preserved unchanged (this is a merge operation, not a full collection
  ## replacement). Each item is validated independently — valid items are applied and
  ## invalid items are returned in the `failed` array. The vendor and region for
  ## every item are validated against the list from `GET
  ## /zones/{zone_id}/origin/cloud_regions/supported_regions`.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/origin/cloud_regions/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdOriginCloudRegionsBatch*(client: CloudflareClient,
                                               zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Removes up to 100 IP-to-cloud-region mappings in a single request. Each IP is
  ## validated independently — successfully deleted items are returned in the
  ## `succeeded` array and IPs that could not be found or are invalid are returned in
  ## the `failed` array.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/origin/cloud_regions/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginCloudRegionsSupportedRegions*(client: CloudflareClient,
                                                       zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Returns the cloud vendors and regions that are valid values for origin cloud
  ## region mappings. Each region includes the Tiered Cache upper-tier colocation
  ## codes that will be used for cache routing when a mapping targeting that region
  ## is active. Requires the zone to have Tiered Cache enabled.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin/cloud_regions/supported_regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginCloudRegionsOriginIp*(client: CloudflareClient,
                                               zoneId: types.CacheRulesIdentifier,
                                               originIp: string): Future[JsonNode] {.async.} =
  ## Returns the cloud region mapping for a single origin IP address. The IP path
  ## parameter is normalized before lookup (RFC 5952 for IPv6). Returns 404 if the
  ## zone has no mappings or if the specified IP has no mapping.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin/cloud_regions/{originIp}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdOriginCloudRegionsOriginIp*(client: CloudflareClient,
                                               zoneId: types.CacheRulesIdentifier,
                                               originIp: string,
                                               body: types.CacheRulesOriginCloudRegionV2Request): Future[JsonNode] {.async.} =
  ## Creates a new IP-to-cloud-region mapping or replaces the existing mapping for
  ## the specified IP. PUT is idempotent — calling it repeatedly with the same body
  ## produces the same result. The IP path parameter is normalized to canonical form
  ## (RFC 5952 for IPv6) before storage. The vendor and region are validated against
  ## the list from `GET /zones/{zone_id}/origin/cloud_regions/supported_regions`.
  ## Returns 400 if the `origin_ip` in the body does not match the URL path
  ## parameter. Returns 403 (code 1164) when the zone has reached the limit of 3,500
  ## IP mappings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/origin/cloud_regions/{originIp}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdOriginCloudRegionsOriginIp*(client: CloudflareClient,
                                                  zoneId: types.CacheRulesIdentifier,
                                                  originIp: string): Future[JsonNode] {.async.} =
  ## Removes the cloud region mapping for a single origin IP address. The IP path
  ## parameter is normalized before lookup. Returns the deleted IP on success.
  ## Returns 404 if no mapping exists for the specified IP. When the last mapping for
  ## the zone is removed the underlying rule record is also deleted.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/origin/cloud_regions/{originIp}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
