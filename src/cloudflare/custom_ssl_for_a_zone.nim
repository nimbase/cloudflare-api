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
  PostZonesZoneIdCustomCertificatesRequest = object
    bundle_method: Option[types.TlsCertificatesAndHostnamesBundleMethod]
    certificate: types.TlsCertificatesAndHostnamesCertificate
    custom_csr_id: Option[types.TlsCertificatesAndHostnamesCustomCsrId]
    deploy: Option[types.TlsCertificatesAndHostnamesDeploy]
    geo_restrictions: Option[types.TlsCertificatesAndHostnamesGeoRestrictions]
    policy: Option[types.TlsCertificatesAndHostnamesPolicy]
    private_key: Option[types.TlsCertificatesAndHostnamesPrivateKey]
    `type`: Option[types.TlsCertificatesAndHostnamesType]
  PutZonesZoneIdCustomCertificatesPrioritizeRequest = object
    certificates: seq[JsonNode]
  PatchZonesZoneIdCustomCertificatesCustomCertificateIdRequest = object
    bundle_method: Option[types.TlsCertificatesAndHostnamesBundleMethod]
    certificate: Option[types.TlsCertificatesAndHostnamesCertificate]
    custom_csr_id: Option[types.TlsCertificatesAndHostnamesCustomCsrId]
    deploy: Option[types.TlsCertificatesAndHostnamesDeploy]
    geo_restrictions: Option[types.TlsCertificatesAndHostnamesGeoRestrictions]
    policy: Option[types.TlsCertificatesAndHostnamesPolicy]
    private_key: Option[types.TlsCertificatesAndHostnamesPrivateKey]
  CustomSslForAZoneMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  CustomSslForAZoneStatusOption* = enum
    statusActive = "active"
    statusExpired = "expired"
    statusDeleted = "deleted"
    statusPending = "pending"
    statusInitializing = "initializing"


proc getZonesZoneIdCustomCertificates*(client: CloudflareClient,
                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                       page: float64 = default(float64),
                                       perPage: float64 = default(float64),
                                       match: string = "all",
                                       status: set[CustomSslForAZoneStatusOption] = {}): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection] {.async.} =
  ## List, search, and filter all of your custom SSL certificates. The higher
  ## priority will break ties across overlapping 'legacy_custom' certificates, but
  ## 'legacy_custom' certificates will always supercede 'sni_custom' certificates.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in match: q["match"] = $v
  for v in status: q["status"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCustomCertificates*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                        body: PostZonesZoneIdCustomCertificatesRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle] {.async.} =
  ## Upload a new SSL certificate for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/custom_certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomCertificatesPrioritize*(client: CloudflareClient,
                                                 zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                 body: PutZonesZoneIdCustomCertificatesPrioritizeRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection] {.async.} =
  ## If a zone has multiple SSL certificates, you can set the order in which they
  ## should be used during a request. The higher priority will break ties across
  ## overlapping 'legacy_custom' certificates.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_certificates/prioritize", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomCertificatesCustomCertificateId*(client: CloudflareClient,
                                                          customCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                          zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle] {.async.} =
  ## Retrieves details for a specific custom SSL certificate, including certificate
  ## metadata, bundle method, geographic restrictions, and associated keyless server
  ## configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_certificates/{customCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomCertificatesCustomCertificateId*(client: CloudflareClient,
                                                             customCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseIdOnly] {.async.} =
  ## Remove a SSL certificate from a zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_certificates/{customCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseIdOnly)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCustomCertificatesCustomCertificateId*(client: CloudflareClient,
                                                            customCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            body: PatchZonesZoneIdCustomCertificatesCustomCertificateIdRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle] {.async.} =
  ## Upload a new private key and/or PEM/CRT for the SSL certificate. Note: PATCHing
  ## a configuration for sni_custom certificates will result in a new resource id
  ## being returned, and the previous one being deleted.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/custom_certificates/{customCertificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
