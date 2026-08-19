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
  PostZonesZoneIdSslCertificatePacksOrderRequest = object
    certificate_authority: types.TlsCertificatesAndHostnamesCertificateAuthority2
    cloudflare_branding: Option[types.TlsCertificatesAndHostnamesCloudflareBranding]
    hosts: types.TlsCertificatesAndHostnamesHosts2
    `type`: types.TlsCertificatesAndHostnamesAdvancedType
    validation_method: types.TlsCertificatesAndHostnamesValidationMethod
    validity_days: types.TlsCertificatesAndHostnamesValidityDays
  PatchZonesZoneIdSslCertificatePacksCertificatePackIdRequest = object
    cloudflare_branding: Option[types.TlsCertificatesAndHostnamesCloudflareBranding]
  CertificatePackStatusOption* = enum
    statusAll = "all"

  CertificatePackDeployOption* = enum
    deployStaging = "staging"
    deployProduction = "production"


proc getZonesZoneIdSslCertificatePacks*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                        page: float64 = default(float64),
                                        perPage: float64 = default(float64),
                                        status: set[CertificatePackStatusOption] = {},
                                        deploy: set[CertificatePackDeployOption] = {}): Future[types.TlsCertificatesAndHostnamesCertificatePackResponseCollection] {.async.} =
  ## For a given zone, list all active certificate packs.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in status: q["status"] = $v
  for v in deploy: q["deploy"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/certificate_packs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificatePackResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSslCertificatePacksOrder*(client: CloudflareClient,
                                              zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                              body: PostZonesZoneIdSslCertificatePacksOrderRequest): Future[types.TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle] {.async.} =
  ## For a given zone, order an advanced certificate pack.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/ssl/certificate_packs/order", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSslCertificatePacksQuota*(client: CloudflareClient,
                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificatePackQuotaResponse] {.async.} =
  ## For a given zone, list certificate pack quotas.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/certificate_packs/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificatePackQuotaResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSslCertificatePacksCertificatePackId*(client: CloudflareClient,
                                                         certificatePackId: types.TlsCertificatesAndHostnamesIdentifier,
                                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificatePackResponseSingle] {.async.} =
  ## For a given zone, get a certificate pack.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/certificate_packs/{certificatePackId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificatePackResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSslCertificatePacksCertificatePackId*(client: CloudflareClient,
                                                            certificatePackId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesDeleteAdvancedCertificatePackResponseSingle] {.async.} =
  ## For a given zone, delete an advanced certificate pack.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/ssl/certificate_packs/{certificatePackId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesDeleteAdvancedCertificatePackResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSslCertificatePacksCertificatePackId*(client: CloudflareClient,
                                                           certificatePackId: types.TlsCertificatesAndHostnamesIdentifier,
                                                           zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                           body: PatchZonesZoneIdSslCertificatePacksCertificatePackIdRequest): Future[types.TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle] {.async.} =
  ## For a given zone, restart validation or add cloudflare branding for an advanced
  ## certificate pack.  The former is only a validation operation for a Certificate
  ## Pack in a validation_timed_out status.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ssl/certificate_packs/{certificatePackId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesAdvancedCertificatePackResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
