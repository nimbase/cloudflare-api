# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSettingsNel*(client: CloudflareClient,
                                zoneId: types.NelConfigZoneIdentifier): Future[types.NelConfigNelSettingResponse] {.async.} =
  ## Fetches the Network Error Logging (NEL) setting for a zone. NEL allows browsers
  ## to report network errors to a configured endpoint. The setting is enabled by
  ## default for free and pro zones, and disabled by default for business and
  ## enterprise zones unless the NEL product feature is enabled.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/nel")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NelConfigNelSettingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsNel*(client: CloudflareClient,
                                  zoneId: types.NelConfigZoneIdentifier,
                                  body: types.NelConfigNelSettingPatch): Future[types.NelConfigNelSettingResponse] {.async.} =
  ## Updates the Network Error Logging (NEL) setting for a zone. Requires the NEL
  ## product feature to be enabled for the zone. The setting controls whether
  ## browsers report network errors to Cloudflare's NEL endpoint.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/nel", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NelConfigNelSettingResponse)
  else:
    raise newException(CloudflareClientError, body)
