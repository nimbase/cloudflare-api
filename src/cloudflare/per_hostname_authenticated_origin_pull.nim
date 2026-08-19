# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PutZonesZoneIdOriginTlsClientAuthHostnamesRequest = object
    config: types.TlsCertificatesAndHostnamesConfig
  PostZonesZoneIdOriginTlsClientAuthHostnamesCertificatesRequest = object
    certificate: types.TlsCertificatesAndHostnamesCertificate6
    private_key: types.TlsCertificatesAndHostnamesPrivateKey3
  PerHostnameAuthenticatedOriginPullStatusOption* = enum
    statusActive = "active"
    statusPendingDeployment = "pending_deployment"
    statusPendingDeletion = "pending_deletion"
    statusDeleted = "deleted"
    statusDeploymentTimedOut = "deployment_timed_out"
    statusDeletionTimedOut = "deletion_timed_out"
    statusAll = "all"


proc getZonesZoneIdOriginTlsClientAuthHostnames*(client: CloudflareClient,
                                                 zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                 page: float64 = default(float64),
                                                 perPage: float64 = default(float64),
                                                 status: set[PerHostnameAuthenticatedOriginPullStatusOption] = {}): Future[types.TlsCertificatesAndHostnamesHostnameAssocResponseCollection] {.async.} =
  ## List certificate ID - hostname associations for the given zone. Shows which
  ## hostnames are associated to which certificates for authenticated origin pulls.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in status: q["status"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesHostnameAssocResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdOriginTlsClientAuthHostnames*(client: CloudflareClient,
                                                 zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                 body: PutZonesZoneIdOriginTlsClientAuthHostnamesRequest): Future[types.TlsCertificatesAndHostnamesHostnameAopResponseCollection] {.async.} =
  ## Associate a hostname to a certificate and enable, disable or invalidate the
  ## association. If disabled, client certificate will not be sent to the hostname
  ## even if activated at the zone level. 100 maximum associations on a single
  ## certificate are allowed. Note: Use a null value for parameter *enabled* to
  ## invalidate the association.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesHostnameAopResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginTlsClientAuthHostnamesCertificates*(client: CloudflareClient,
                                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection4] {.async.} =
  ## Lists all client certificates configured for per-hostname authenticated origin
  ## pulls on the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames/certificates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection4)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdOriginTlsClientAuthHostnamesCertificates*(client: CloudflareClient,
                                                              zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                              body: PostZonesZoneIdOriginTlsClientAuthHostnamesCertificatesRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle4] {.async.} =
  ## Upload a certificate to be used for client authentication on a hostname. 10
  ## hostname certificates per zone are allowed.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames/certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle4)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginTlsClientAuthHostnamesCertificatesCertificateId*(client: CloudflareClient,
                                                                          certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                          zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle4] {.async.} =
  ## Get the certificate by ID to be used for client authentication on a hostname.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle4)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdOriginTlsClientAuthHostnamesCertificatesCertificateId*(client: CloudflareClient,
                                                                             certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle4] {.async.} =
  ## Removes a client certificate used for authenticated origin pulls on a specific
  ## hostname.
  ## Note: Before deleting the certificate, you must first invalidate the hostname
  ## for client authentication by sending a PUT request with `enabled` set to null.
  ## After invalidating the association, the certificate can be safely deleted.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle4)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginTlsClientAuthHostnamesHostname*(client: CloudflareClient,
                                                         hostname: types.TlsCertificatesAndHostnamesHostname2,
                                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesHostnameAopSingleResponse] {.async.} =
  ## Retrieves the client certificate authentication status for a specific hostname,
  ## showing whether authenticated origin pulls are enabled.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/hostnames/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesHostnameAopSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
