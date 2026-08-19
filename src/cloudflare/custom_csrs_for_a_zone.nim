# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCustomCsrs*(client: CloudflareClient,
                               zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                               page: float64 = default(float64),
                               perPage: float64 = default(float64)): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseCollection] {.async.} =
  ## List all custom Certificate Signing Requests (CSRs) for a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_csrs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCustomCsrs*(client: CloudflareClient,
                                zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                body: types.TlsCertificatesAndHostnamesCustomCsrCreateRequest): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseSingle] {.async.} =
  ## Generate a new custom Certificate Signing Request (CSR) for a zone. Cloudflare
  ## generates and securely stores the private key associated with the CSR. The CSR
  ## can then be provided to a Certificate Authority for signing. Once signed, the
  ## certificate is uploaded via the Custom SSL endpoint using the CSR ID.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/custom_csrs", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomCsrsCustomCsrId*(client: CloudflareClient,
                                          customCsrId: types.TlsCertificatesAndHostnamesCustomCsrIdentifier,
                                          zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseSingle] {.async.} =
  ## Retrieve details for a specific custom Certificate Signing Request (CSR).

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_csrs/{customCsrId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomCsrsCustomCsrId*(client: CloudflareClient,
                                             customCsrId: types.TlsCertificatesAndHostnamesCustomCsrIdentifier,
                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly] {.async.} =
  ## Delete a custom Certificate Signing Request (CSR) and its associated private
  ## key. A CSR cannot be deleted if any custom certificates still reference it.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_csrs/{customCsrId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly)
  else:
    raise newException(CloudflareClientError, body)
