# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessSamlCertificates*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier,
                                                 page: int64 = 1,
                                                 perPage: int64 = 25,
                                                 id: string = default(string)): Future[types.AccessCertificateSetListResponse] {.async.} =
  ## Returns a paginated list of the organization's SAML encryption certificate sets.
  ## Each certificate set includes the current and (if present) previous
  ## certificates.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["id"] = $id
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/saml_certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessCertificateSetListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessSamlCertificatesSamlCertSetId*(client: CloudflareClient,
                                                              accountId: types.AccessIdentifier,
                                                              samlCertSetId: types.AccessUuid): Future[types.AccessCertificateSetResponse] {.async.} =
  ## Retrieves a specific SAML encryption certificate set by its UID, including both
  ## current and previous certificates if available.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/saml_certificates/{samlCertSetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessCertificateSetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessSamlCertificatesSamlCertSetIdPem*(client: CloudflareClient,
                                                                 accountId: types.AccessIdentifier,
                                                                 samlCertSetId: types.AccessUuid): Future[AsyncResponse] {.async.} =
  ## Downloads the current SAML encryption certificate's public key in PEM format for
  ## the specified certificate set. This endpoint is useful for providing the
  ## certificate to Identity Providers for SAML assertion encryption configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/saml_certificates/{samlCertSetId}/pem")
  return res

proc postAccountsAccountIdAccessSamlCertificatesSamlCertSetIdRotate*(client: CloudflareClient,
                                                                     accountId: types.AccessIdentifier,
                                                                     samlCertSetId: types.AccessUuid): Future[types.AccessCertificateSetResponse] {.async.} =
  ## Rotates the SAML encryption certificates within the specified certificate set.
  ## This generates a new
  ## certificate and moves the current certificate to the previous slot. If a
  ## previous certificate exists,
  ## it will be deactivated and removed.
  ##
  ## This endpoint ensures zero-downtime rotation by maintaining both current and
  ## previous certificates
  ## during the transition period, allowing IdPs time to update their configurations.
  ## Automated rotation
  ## happens 30 days before a current certificate's expiration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/saml_certificates/{samlCertSetId}/rotate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessCertificateSetResponse)
  else:
    raise newException(CloudflareClientError, body)
