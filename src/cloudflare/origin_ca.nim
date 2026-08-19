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

proc getCertificates*(client: CloudflareClient,
                      zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                      page: float64 = default(float64),
                      perPage: float64 = default(float64),
                      limit: int64 = default(int64),
                      offset: int64 = default(int64)): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection2] {.async.} =
  ## List all existing Origin CA certificates for a given zone. You can use an Origin
  ## CA Key as your User Service Key or an API token when calling this endpoint ([see
  ## above](#requests)).

  var q = initOrderedTable[string, string]()
  q["zone_id"] = $zoneId
  q["page"] = $page
  q["per_page"] = $perPage
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET("/certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postCertificates*(client: CloudflareClient, body: PostCertificatesRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle2] {.async.} =
  ## Create an Origin CA certificate. You can use an Origin CA Key as your User
  ## Service Key or an API token when calling this endpoint ([see above](#requests)).

  let res = await client.httpPOST("/certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc getCertificatesCertificateId*(client: CloudflareClient,
                                   certificateId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle2] {.async.} =
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
                                      certificateId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateRevokeResponse] {.async.} =
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
