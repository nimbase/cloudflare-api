# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSettingsSslAutomaticMode*(client: CloudflareClient,
                                             zoneId: types.CacheIdentifier): Future[types.CacheApiResponseSingleId] {.async.} =
  ## If the system is enabled, the response will include next_scheduled_scan,
  ## representing the next time this zone will be scanned and the zone's ssl/tls
  ## encryption mode is potentially upgraded by the system. If the system is
  ## disabled, next_scheduled_scan will not be present in the response body.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/ssl_automatic_mode")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsSslAutomaticMode*(client: CloudflareClient,
                                               zoneId: types.CacheIdentifier,
                                               body: types.CacheSchemasPatch): Future[types.CacheApiResponseSingleId] {.async.} =
  ## The automatic system is enabled when this endpoint is hit with value in the
  ## request body is set to "auto", and disabled when the request body value is set
  ## to "custom".

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/ssl_automatic_mode", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
