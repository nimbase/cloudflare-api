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
  PostZonesZoneIdClientCertificatesRequest = object
    csr: types.TlsCertificatesAndHostnamesCsr2
    validity_days: types.TlsCertificatesAndHostnamesValidityDays2
  PatchZonesZoneIdClientCertificatesClientCertificateIdRequest = object
    reactivate: Option[bool]
  ApiShieldClientCertificatesForAZoneStatusOption* = enum
    statusAll = "all"
    statusActive = "active"
    statusPendingReactivation = "pending_reactivation"
    statusPendingRevocation = "pending_revocation"
    statusRevoked = "revoked"


proc getZonesZoneIdCertificateAuthoritiesHostnameAssociations*(client: CloudflareClient,
                                                               zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                               mtlsCertificateId: string = default(string)): Future[types.TlsCertificatesAndHostnamesHostnameAssociationsResponse] {.async.} =
  ## List Hostname Associations.

  var q = initOrderedTable[string, string]()
  q["mtls_certificate_id"] = $mtlsCertificateId
  let res = await client.httpGET(fmt"/zones/{zoneId}/certificate_authorities/hostname_associations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesHostnameAssociationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCertificateAuthoritiesHostnameAssociations*(client: CloudflareClient,
                                                               zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                               body: types.TlsCertificatesAndHostnamesHostnameAssociation): Future[types.TlsCertificatesAndHostnamesHostnameAssociationsResponse] {.async.} =
  ## Replace Hostname Associations.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/certificate_authorities/hostname_associations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesHostnameAssociationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdClientCertificates*(client: CloudflareClient,
                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                       status: set[ApiShieldClientCertificatesForAZoneStatusOption] = {},
                                       page: float64 = default(float64),
                                       perPage: float64 = default(float64),
                                       limit: int64 = default(int64),
                                       offset: int64 = default(int64)): Future[types.TlsCertificatesAndHostnamesClientCertificateResponseCollection] {.async.} =
  ## List all of your Zone's API Shield mTLS Client Certificates by Status and/or
  ## using Pagination.

  var q = initOrderedTable[string, string]()
  for v in status: q["status"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/zones/{zoneId}/client_certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesClientCertificateResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdClientCertificates*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                        body: PostZonesZoneIdClientCertificatesRequest): Future[types.TlsCertificatesAndHostnamesClientCertificateResponseSingle] {.async.} =
  ## Create a new API Shield mTLS Client Certificate.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/client_certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesClientCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdClientCertificatesClientCertificateId*(client: CloudflareClient,
                                                          zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                          clientCertificateId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesClientCertificateResponseSingle] {.async.} =
  ## Get Details for a single mTLS API Shield Client Certificate.

  let res = await client.httpGET(fmt"/zones/{zoneId}/client_certificates/{clientCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesClientCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdClientCertificatesClientCertificateId*(client: CloudflareClient,
                                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                             clientCertificateId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesClientCertificateResponseSingle] {.async.} =
  ## Set a API Shield mTLS Client Certificate to pending_revocation status for
  ## processing to revoked status.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/client_certificates/{clientCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesClientCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdClientCertificatesClientCertificateId*(client: CloudflareClient,
                                                            zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            clientCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            body: PatchZonesZoneIdClientCertificatesClientCertificateIdRequest): Future[types.TlsCertificatesAndHostnamesClientCertificateResponseSingle] {.async.} =
  ## If a API Shield mTLS Client Certificate is in a pending_revocation state, you
  ## may reactivate it with this endpoint.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/client_certificates/{clientCertificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesClientCertificateResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
