# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSslRecommendation*(client: CloudflareClient,
                                      zoneId: types.CacheIdentifier): Future[types.CacheApiResponseSingleId] {.async.} =
  ## Retrieve the SSL/TLS Recommender's recommendation for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/recommendation")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
