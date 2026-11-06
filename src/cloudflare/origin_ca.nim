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
  PostCertificatesRequest = object
    csr: types.TlsCertificatesAndHostnamesCsr
    hostnames: types.TlsCertificatesAndHostnamesHostnames
    request_type: types.TlsCertificatesAndHostnamesRequestType
    requested_validity: Option[types.TlsCertificatesAndHostnamesRequestedValidity]
    zone_id: Option[string]

proc getCertificates*(client: CloudflareClient,
                      zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                      page: float64 = default(float64),
                      perPage: float64 = default(float64)): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection2] {.async.} =
  ## List all existing Origin CA certificates for a given zone. Revoked certificates
  ## are not included. You can use an Origin CA Key as your User Service Key or an
  ## API token when calling this endpoint ([see above](#requests)).

  var q = initOrderedTable[string, string]()
  q["zone_id"] = $zoneId
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postCertificates*(client: CloudflareClient, body: PostCertificatesRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle2] {.async.} =
  ## Create an Origin CA certificate. For `keyless-certificate` requests, `zone_id`
  ## is required and the response contains only `id`, `certificate`, and
  ## `expires_on`. You can use an Origin CA Key as your User Service Key or an API
  ## token when calling this endpoint ([see above](#requests)).

  let res = await client.httpPOST("/certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc getCertificatesCertificateId*(client: CloudflareClient,
                                   certificateId: types.TlsCertificatesAndHostnamesOriginCaCertificateIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle2] {.async.} =
  ## Get an existing Origin CA certificate by its serial number. You can use an
  ## Origin CA Key as your User Service Key or an API token when calling this
  ## endpoint ([see above](#requests)).

  let res = await client.httpGET(fmt"/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc deleteCertificatesCertificateId*(client: CloudflareClient,
                                      certificateId: types.TlsCertificatesAndHostnamesOriginCaCertificateIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateRevokeResponse] {.async.} =
  ## Revoke an existing Origin CA certificate by its serial number. You can use an
  ## Origin CA Key as your User Service Key or an API token when calling this
  ## endpoint ([see above](#requests)).

  let res = await client.httpDELETE(fmt"/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateRevokeResponse)
  else:
    raise newException(CloudflareClientError, body)
