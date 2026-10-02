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
  PostZonesRequest = object
    account: JsonNode
    name: types.ZonesName
    `type`: Option[types.ZonesType]
  PatchZonesZoneIdRequest = object
    paused: Option[types.ZonesPaused]
    plan: Option[JsonNode]
    `type`: Option[string]
    vanity_name_servers: Option[types.ZonesVanityNameServers]
  ZoneStatusOption* = enum
    statusInitializing = "initializing"
    statusPending = "pending"
    statusActive = "active"
    statusMoved = "moved"

  ZoneOrderOption* = enum
    orderName = "name"
    orderStatus = "status"
    orderAccountId = "account.id"
    orderAccountName = "account.name"
    orderPlanId = "plan.id"

  ZoneDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ZoneMatchOption* = enum
    matchAny = "any"
    matchAll = "all"


proc getZones*(client: CloudflareClient, name: string = default(string),
               status: ZoneStatusOption = statusInitializing,
               `type`: seq[string] = default(seq[string]),
               accountId: string = default(string),
               accountName: string = default(string),
               page: float64 = default(float64),
               perPage: float64 = default(float64),
               order: ZoneOrderOption = orderName,
               direction: ZoneDirectionOption = directionAsc,
               match: ZoneMatchOption = matchAll): Future[JsonNode] {.async.} =
  ## Lists, searches, sorts, and filters your zones. Listing zones across more than
  ## 500 accounts
  ## is currently not allowed.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["status"] = $status
  q["type"] = $`type`
  q["account.id"] = $accountId
  q["account.name"] = $accountName
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["match"] = $match
  let res = await client.httpGET("/zones", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZones*(client: CloudflareClient, body: PostZonesRequest): Future[JsonNode] {.async.} =
  ## Creates a new zone (domain) in your Cloudflare account.
  ##
  ## The zone is created in a pending state and must be activated by updating your
  ## domain's
  ## nameservers to point to Cloudflare, or by completing the verification process
  ## for partial
  ## (CNAME) setups.

  let res = await client.httpPOST("/zones", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneId*(client: CloudflareClient, zoneId: types.ZonesIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves detailed information about a specific zone identified by its zone ID.
  ##
  ## Returns zone configuration, status, nameservers, and associated metadata.

  let res = await client.httpGET(fmt"/zones/{zoneId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneId*(client: CloudflareClient, zoneId: types.ZonesIdentifier): Future[types.ZonesApiResponseSingleId] {.async.} =
  ## Deletes an existing zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZonesApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneId*(client: CloudflareClient, zoneId: types.ZonesIdentifier,
                       body: PatchZonesZoneIdRequest): Future[JsonNode] {.async.} =
  ## Edits a zone. Only one zone property can be changed at a time.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdActivationCheck*(client: CloudflareClient,
                                    zoneId: types.ZoneActivationIdentifier): Future[JsonNode] {.async.} =
  ## Triggeres a new activation check for a PENDING Zone. This can be
  ## triggered every 5 min for paygo/ent customers, every hour for FREE
  ## Zones.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/activation_check")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEnvironmentsEnvironmentIdInvalidateCache*(client: CloudflareClient,
                                                              zoneId: types.CachePurgeIdentifier,
                                                              environmentId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## Marks cached content as stale for one environment of the zone. Content cached
  ## for the zone's other environments, including production, is not affected.
  ## Otherwise this works like `POST /zones/{zone_id}/invalidate_cache`: the next
  ## request for invalidated content makes Cloudflare revalidate it with your origin,
  ## and the request body takes the same fields.
  ##
  ## Environments are part of [Version
  ## Management](https://developers.cloudflare.com/version-management/). To delete
  ## the content instead, use `POST
  ## /zones/{zone_id}/environments/{environment_id}/purge_cache`.
  ##
  ## Invalidating by URL (`files`) does not work for environments that select
  ## requests by IP address, country, ASN, or threat score, and fails with error
  ## `1136`. Use `tags`, `hosts`, `prefixes`, or `purge_everything` for those
  ## environments.
  ##
  ## ### Availability and limits
  ##
  ## Rate limits and the number of items you can send in one request depend on your
  ## plan. See [Purge cache: availability andlimits](https://developers.cloudflare.c
  ## om/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/environments/{environmentId}/invalidate_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEnvironmentsEnvironmentIdPurgeCache*(client: CloudflareClient,
                                                         zoneId: types.CachePurgeIdentifier,
                                                         environmentId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## Deletes cached content for one environment of the zone. Content cached for the
  ## zone's other environments, including production, is not affected. Otherwise this
  ## works like `POST /zones/{zone_id}/purge_cache`: the next request for purged
  ## content is a cache `MISS`, and the request body takes the same fields.
  ##
  ## Environments are part of [Version
  ## Management](https://developers.cloudflare.com/version-management/). To keep
  ## content cached and have Cloudflare revalidate it instead, use `POST
  ## /zones/{zone_id}/environments/{environment_id}/invalidate_cache`.
  ##
  ## Purging by URL (`files`) does not work for environments that select requests by
  ## IP address, country, ASN, or threat score, and fails with error `1136`. Use
  ## `tags`, `hosts`, `prefixes`, or `purge_everything` for those environments.
  ##
  ## ### Availability and limits
  ##
  ## Rate limits and the number of items you can send in one request depend on your
  ## plan. See [Purge cache: availability andlimits](https://developers.cloudflare.c
  ## om/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/environments/{environmentId}/purge_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdInvalidateCache*(client: CloudflareClient,
                                     zoneId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## Marks cached content as stale in every Cloudflare data center and cache tier,
  ## including Cache Reserve. The content stays in cache. The next request for it
  ## makes Cloudflare revalidate it with your origin, using the `ETag` and
  ## `Last-Modified` values it was cached with:
  ##
  ## - If your origin answers `304 Not Modified`, Cloudflare serves the cached copy
  ## without downloading it again, and `CF-Cache-Status` is `REVALIDATED`.
  ## - If your origin sends a full response, Cloudflare serves and caches the new
  ## content, and `CF-Cache-Status` is `EXPIRED`.
  ##
  ## With Tiered Cache, each tier revalidates with the tier above it, so a visitor
  ## can see `EXPIRED` even when your origin answered `304`.
  ##
  ## Until content is revalidated, your `stale-while-revalidate` and `stale-if-error`
  ## directives still apply, counted from the time you invalidated it. For example,
  ## if your origin fails during revalidation, Cloudflare can keep serving the stale
  ## copy for the `stale-if-error` window.
  ##
  ## ### Invalidate or purge?
  ##
  ## - **Invalidate** when content may not have changed, for example after a deploy.
  ## Unchanged content costs your origin a `304` instead of a full response. That
  ## saving needs an origin that sends `ETag` or `Last-Modified` and answers
  ## conditional requests. Otherwise, every revalidation downloads the full response.
  ## - **Purge**, with `POST /zones/{zone_id}/purge_cache`, when content must not be
  ## served again, for example content you removed for legal or security reasons.
  ##
  ## Invalidating takes the same request bodies as purging, needs the same
  ## permission, and counts against the same rate limits. After a broad invalidation,
  ## such as `purge_everything`, expect more conditional requests to your origin
  ## while visitors request the invalidated content again.
  ##
  ## ### Choose what to invalidate
  ##
  ## Send one of these fields in the request body:
  ##
  ## - `files`: specific URLs. If your cache key includes request headers, send each
  ## URL with the header values it was cached with.
  ## - `tags`: all content whose `Cache-Tag` response header contains one of the
  ## tags.
  ## - `hosts`: all content cached for the hostnames.
  ## - `prefixes`: all content whose URL starts with one of the prefixes.
  ## - `purge_everything`: all cached content in the zone.
  ##
  ## ### Check the result
  ##
  ## A `200` response with `success: true` means Cloudflare accepted the request. To
  ## check, request an invalidated URL and confirm that the `CF-Cache-Status`
  ## response header is `REVALIDATED` or `EXPIRED`.
  ##
  ## ### Availability and limits
  ##
  ## Rate limits and the number of items you can send in one request depend on your
  ## plan. See [Purge cache: availability andlimits](https://developers.cloudflare.c
  ## om/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/invalidate_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPurgeCache*(client: CloudflareClient,
                                zoneId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## Deletes cached content in every Cloudflare data center and cache tier, including
  ## Cache Reserve. The next request for purged content is a cache `MISS`: Cloudflare
  ## fetches the full response from your origin and caches it again. Cloudflare does
  ## not serve purged content from cache again, even if your origin is unavailable.
  ##
  ## To keep content cached and have Cloudflare revalidate it with your origin
  ## instead, use `POST /zones/{zone_id}/invalidate_cache`.
  ##
  ## ### Choose what to purge
  ##
  ## Send one of these fields in the request body:
  ##
  ## - `files`: specific URLs. If your cache key includes request headers, send each
  ## URL with the header values it was cached with.
  ## - `tags`: all content whose `Cache-Tag` response header contains one of the
  ## tags.
  ## - `hosts`: all content cached for the hostnames.
  ## - `prefixes`: all content whose URL starts with one of the prefixes.
  ## - `purge_everything`: all cached content in the zone.
  ##
  ## ### Check the result
  ##
  ## A `200` response with `success: true` means Cloudflare accepted the request. It
  ## does not confirm that any content was cached or removed. To check, request a
  ## purged URL and confirm that the `CF-Cache-Status` response header is `MISS`.
  ##
  ## ### Availability and limits
  ##
  ## Rate limits and the number of items you can send in one request depend on your
  ## plan. See [Purge cache: availability andlimits](https://developers.cloudflare.c
  ## om/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/purge_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
