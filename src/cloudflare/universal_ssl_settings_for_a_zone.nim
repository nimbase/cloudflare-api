# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSslUniversalSettings*(client: CloudflareClient,
                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesSslUniversalSettingsResponse] {.async.} =
  ## Get Universal SSL Settings for a Zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/universal/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesSslUniversalSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSslUniversalSettings*(client: CloudflareClient,
                                           zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                           body: types.TlsCertificatesAndHostnamesUniversal): Future[types.TlsCertificatesAndHostnamesSslUniversalSettingsResponse] {.async.} =
  ## Patch Universal SSL Settings for a Zone.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ssl/universal/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesSslUniversalSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
