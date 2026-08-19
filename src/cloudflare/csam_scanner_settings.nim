# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSettingsCsamScannerThirdParty*(client: CloudflareClient,
                                                  zoneId: types.CsamConfigServiceZoneIdentifier): Future[types.CsamConfigServiceCsamScannerSingleResponse] {.async.} =
  ## Retrieve the current CSAM Scanner configuration for a zone.
  ##
  ## The notification email is masked by default in responses.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/csam_scanner_third_party")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CsamConfigServiceCsamScannerSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsCsamScannerThirdParty*(client: CloudflareClient,
                                                    zoneId: types.CsamConfigServiceZoneIdentifier,
                                                    body: types.CsamConfigServiceCsamScannerThirdPartyUpdateRequest): Future[types.CsamConfigServiceCsamScannerSingleResponse] {.async.} =
  ## Update the CSAM Scanner configuration for a zone. Allows enabling or
  ## disabling CSAM scanning, updating the notification email, and
  ## configuring scanning sources.
  ##
  ## When a new email is provided, email verification is triggered
  ## automatically. The `enabled` field is a toggle; the server may
  ## adjust it based on whether the notification email is verified.
  ##
  ## Returns 403 if the zone or account is locked by Trust & Safety.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/csam_scanner_third_party", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CsamConfigServiceCsamScannerSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
