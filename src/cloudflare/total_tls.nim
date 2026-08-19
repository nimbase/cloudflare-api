# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdAcmTotalTlsRequest = object
    certificate_authority: Option[types.TlsCertificatesAndHostnamesCertificateAuthority3]
    enabled: types.TlsCertificatesAndHostnamesEnabled3

proc getZonesZoneIdAcmTotalTls*(client: CloudflareClient,
                                zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesTotalTlsSettingsResponse] {.async.} =
  ## Get Total TLS Settings for a Zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/acm/total_tls")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesTotalTlsSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAcmTotalTls*(client: CloudflareClient,
                                 zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                 body: PostZonesZoneIdAcmTotalTlsRequest): Future[types.TlsCertificatesAndHostnamesTotalTlsSettingsResponse] {.async.} =
  ## Set Total TLS Settings or disable the feature for a Zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/acm/total_tls", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesTotalTlsSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
