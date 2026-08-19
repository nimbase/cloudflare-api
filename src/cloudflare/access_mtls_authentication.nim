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
  PostAccountsAccountIdAccessCertificatesRequest = object
    associated_hostnames: Option[types.AccessAssociatedHostnames]
    certificate: string
    name: types.AccessName7
  PutAccountsAccountIdAccessCertificatesSettingsRequest = object
    settings: seq[types.AccessSettings]
  PutAccountsAccountIdAccessCertificatesCertificateIdRequest = object
    associated_hostnames: types.AccessAssociatedHostnames
    name: Option[types.AccessName7]

proc getAccountsAccountIdAccessCertificates*(client: CloudflareClient,
                                             accountId: types.AccessIdentifier,
                                             page: int64 = 1,
                                             perPage: int64 = 50): Future[types.AccessResponseCollection5] {.async.} =
  ## Lists all mTLS root certificates.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection5)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessCertificates*(client: CloudflareClient,
                                              accountId: types.AccessIdentifier,
                                              body: PostAccountsAccountIdAccessCertificatesRequest): Future[types.AccessSingleResponse6] {.async.} =
  ## Adds a new mTLS root certificate to Access.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/certificates", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse6)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessCertificatesSettings*(client: CloudflareClient,
                                                     accountId: types.AccessIdentifier): Future[types.AccessResponseCollectionHostnames] {.async.} =
  ## List all mTLS hostname settings for this account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/certificates/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollectionHostnames)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessCertificatesSettings*(client: CloudflareClient,
                                                     accountId: types.AccessIdentifier,
                                                     body: PutAccountsAccountIdAccessCertificatesSettingsRequest): Future[types.AccessResponseCollectionHostnames] {.async.} =
  ## Updates an mTLS certificate's hostname settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/certificates/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessResponseCollectionHostnames)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                          certificateId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier): Future[types.AccessSingleResponse6] {.async.} =
  ## Fetches a single mTLS certificate.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse6)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                          certificateId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier,
                                                          body: PutAccountsAccountIdAccessCertificatesCertificateIdRequest): Future[types.AccessSingleResponse6] {.async.} =
  ## Updates a configured mTLS certificate.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/certificates/{certificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse6)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                             certificateId: types.AccessUuid,
                                                             accountId: types.AccessIdentifier): Future[types.AccessIdResponse3] {.async.} =
  ## Deletes an mTLS certificate.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
