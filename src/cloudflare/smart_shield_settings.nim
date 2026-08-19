# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSmartShield*(client: CloudflareClient,
                                zoneId: types.SmartshieldIdentifier): Future[JsonNode] {.async.} =
  ## Retrieve Smart Shield Settings.

  let res = await client.httpGET(fmt"/zones/{zoneId}/smart_shield")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSmartShield*(client: CloudflareClient,
                                  zoneId: types.SmartshieldIdentifier,
                                  body: types.SmartshieldSmartShieldSettingsPatchBody): Future[JsonNode] {.async.} =
  ## Set Smart Shield Settings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/smart_shield", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
