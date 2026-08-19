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
                                      zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Tiered Cache works by dividing Cloudflare's data centers into a hierarchy of
  ## lower-tiers and upper-tiers. If content is not cached in lower-tier data centers
  ## (generally the ones closest to a visitor), the lower-tier must ask an upper-tier
  ## to see if it has the content. If the upper-tier does not have the content, only
  ## the upper-tier can ask the origin for content. This practice improves bandwidth
  ## efficiency by limiting the number of data centers that can ask the origin for
  ## content, which reduces origin load and makes websites more cost-effective to
  ## operate. Additionally, Tiered Cache concentrates connections to origin servers
  ## so they come from a small number of data centers rather than the full set of
  ## network locations. This results in fewer open connections using server
  ## resources.

  let res = await client.httpGET(fmt"/zones/{zoneId}/argo/tiered_caching")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdArgoTieredCaching*(client: CloudflareClient,
                                        zoneId: types.CacheRulesIdentifier,
                                        body: types.CacheRulesPatch): Future[JsonNode] {.async.} =
  ## Tiered Cache works by dividing Cloudflare's data centers into a hierarchy of
  ## lower-tiers and upper-tiers. If content is not cached in lower-tier data centers
  ## (generally the ones closest to a visitor), the lower-tier must ask an upper-tier
  ## to see if it has the content. If the upper-tier does not have the content, only
  ## the upper-tier can ask the origin for content. This practice improves bandwidth
  ## efficiency by limiting the number of data centers that can ask the origin for
  ## content, which reduces origin load and makes websites more cost-effective to
  ## operate. Additionally, Tiered Cache concentrates connections to origin servers
  ## so they come from a small number of data centers rather than the full set of
  ## network locations. This results in fewer open connections using server
  ## resources.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/argo/tiered_caching", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
