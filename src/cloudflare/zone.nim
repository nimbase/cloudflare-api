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
               status: set[ZoneStatusOption] = {},
               `type`: seq[string] = default(seq[string]),
               accountId: string = default(string),
               accountName: string = default(string),
               page: float64 = default(float64),
               perPage: float64 = default(float64),
               order: set[ZoneOrderOption] = {},
               direction: set[ZoneDirectionOption] = {}, match: string = "all"): Future[JsonNode] {.async.} =
  ## Lists, searches, sorts, and filters your zones. Listing zones across more than
  ## 500 accounts
  ## is currently not allowed.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  for v in status: q["status"] = $v
  q["type"] = $`type`
  q["account.id"] = $accountId
  q["account.name"] = $accountName
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  for v in match: q["match"] = $v
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

proc postZonesZoneIdEnvironmentsEnvironmentIdPurgeCache*(client: CloudflareClient,
                                                         zoneId: types.CachePurgeIdentifier,
                                                         environmentId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## Purge cached content scoped to a specific environment. Supports the same purge
  ## types as the zone-level endpoint (purge everything, by URL, by tag, host, or
  ## prefix).
  ##
  ## ### Availability and limits
  ## Please refer to [purge cache availability and limits documentationpage](https:/
  ## /developers.cloudflare.com/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/environments/{environmentId}/purge_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPurgeCache*(client: CloudflareClient,
                                zoneId: types.CachePurgeIdentifier): Future[types.CachePurgeApiResponseSingleId] {.async.} =
  ## ### Purge All Cached Content
  ## Removes ALL files from Cloudflare's cache. All tiers can purge everything.
  ## ```
  ## {"purge_everything": true}
  ## ```
  ##
  ## ### Purge Cached Content by URL
  ## Granularly removes one or more files from Cloudflare's cache by specifying URLs.
  ## All tiers can purge by URL.
  ##
  ## To purge files with custom cache keys, include the headers used to compute the
  ## cache key as in the example. If you have a device type or geo in your cache key,
  ## you will need to include the CF-Device-Type or CF-IPCountry headers. If you have
  ## lang in your cache key, you will need to include the Accept-Language header.
  ##
  ## **NB:** When including the Origin header, be sure to include the **scheme** and
  ## **hostname**. The port number can be omitted if it is the default port (80 for
  ## http, 443 for https), but must be included otherwise.
  ##
  ## Single file purge example with files:
  ## ```
  ## {"files": ["http://www.example.com/css/styles.css",
  ## "http://www.example.com/js/index.js"]}
  ## ```
  ## Single file purge example with url and header pairs:
  ## ```
  ## {"files": [{"url": "http://www.example.com/cat_picture.jpg", "headers":
  ## {"CF-IPCountry": "US", "CF-Device-Type": "desktop", "Accept-Language":
  ## "zh-CN"}}, {"url": "http://www.example.com/dog_picture.jpg", "headers":
  ## {"CF-IPCountry": "EU", "CF-Device-Type": "mobile", "Accept-Language":
  ## "en-US"}}]}
  ## ```
  ##
  ## ### Purge Cached Content by Tag, Host or Prefix
  ## Granularly removes one or more files from Cloudflare's cache either by
  ## specifying the host, the associated Cache-Tag, or a Prefix.
  ##
  ## Flex purge with tags:
  ## ```
  ## {"tags": ["a-cache-tag", "another-cache-tag"]}
  ## ```
  ## Flex purge with hosts:
  ## ```
  ## {"hosts": ["www.example.com", "images.example.com"]}
  ## ```
  ## Flex purge with prefixes:
  ## ```
  ## {"prefixes": ["www.example.com/foo", "images.example.com/bar/baz"]}
  ## ```
  ##
  ## ### Availability and limits
  ## Please refer to [purge cache availability and limits documentationpage](https:/
  ## /developers.cloudflare.com/cache/how-to/purge-cache/#availability-and-limits).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/purge_cache", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CachePurgeApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
