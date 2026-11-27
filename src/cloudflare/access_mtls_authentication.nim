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
  PostAccountOrZoneAccountOrZoneIdAccessCertificatesRequest = object
    associated_hostnames: Option[types.AccessAssociatedHostnames]
    certificate: string
    name: types.AccessName7
  PutAccountOrZoneAccountOrZoneIdAccessCertificatesSettingsRequest = object
    settings: seq[types.AccessSettings]
  PutAccountOrZoneAccountOrZoneIdAccessCertificatesCertificateIdRequest = object
    associated_hostnames: types.AccessAssociatedHostnames
    name: Option[types.AccessName7]

proc getAccountsAccountIdAccessCertificates*(client: CloudflareClient,
                                             accountId: types.AccessIdentifier,
                                             page: int64 = 1,
                                             perPage: int64 = 50): Future[types.AccessResponseCollection6] {.async.} =
  ## Lists all mTLS root certificates.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection6)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessCertificates*(client: CloudflareClient,
                                              accountId: types.AccessIdentifier,
                                              body: PostAccountsAccountIdAccessCertificatesRequest): Future[types.AccessSingleResponse7] {.async.} =
  ## Adds a new mTLS root certificate to Access.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/certificates", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse7)
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
                                                          accountId: types.AccessIdentifier): Future[types.AccessSingleResponse7] {.async.} =
  ## Fetches a single mTLS certificate.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                          certificateId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier,
                                                          body: PutAccountsAccountIdAccessCertificatesCertificateIdRequest): Future[types.AccessSingleResponse7] {.async.} =
  ## Updates a configured mTLS certificate.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/certificates/{certificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse7)
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

proc getAccountOrZoneAccountOrZoneIdAccessCertificates*(client: CloudflareClient,
                                                        accountOrZone: AccountOrZone,
                                                        accountOrZoneId: types.AccessIdentifier,
                                                        page: int64 = 1,
                                                        perPage: int64 = 50): Future[types.AccessResponseCollection6] {.async.} =
  ## Lists all mTLS root certificates.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection6)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountOrZoneAccountOrZoneIdAccessCertificates*(client: CloudflareClient,
                                                         accountOrZone: AccountOrZone,
                                                         accountOrZoneId: types.AccessIdentifier,
                                                         body: PostAccountOrZoneAccountOrZoneIdAccessCertificatesRequest): Future[types.AccessSingleResponse7] {.async.} =
  ## Adds a new mTLS root certificate to Access.

  let res = await client.httpPOST(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountOrZoneAccountOrZoneIdAccessCertificatesSettings*(client: CloudflareClient,
                                                                accountOrZone: AccountOrZone,
                                                                accountOrZoneId: types.AccessIdentifier): Future[types.AccessResponseCollectionHostnames] {.async.} =
  ## List all mTLS hostname settings for this account or zone.

  let res = await client.httpGET(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollectionHostnames)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountOrZoneAccountOrZoneIdAccessCertificatesSettings*(client: CloudflareClient,
                                                                accountOrZone: AccountOrZone,
                                                                accountOrZoneId: types.AccessIdentifier,
                                                                body: PutAccountOrZoneAccountOrZoneIdAccessCertificatesSettingsRequest): Future[types.AccessResponseCollectionHostnames] {.async.} =
  ## Updates an mTLS certificate's hostname settings.

  let res = await client.httpPUT(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessResponseCollectionHostnames)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountOrZoneAccountOrZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                                     accountOrZone: AccountOrZone,
                                                                     certificateId: types.AccessUuid,
                                                                     accountOrZoneId: types.AccessIdentifier): Future[types.AccessSingleResponse7] {.async.} =
  ## Fetches a single mTLS certificate.

  let res = await client.httpGET(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountOrZoneAccountOrZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                                     accountOrZone: AccountOrZone,
                                                                     certificateId: types.AccessUuid,
                                                                     accountOrZoneId: types.AccessIdentifier,
                                                                     body: PutAccountOrZoneAccountOrZoneIdAccessCertificatesCertificateIdRequest): Future[types.AccessSingleResponse7] {.async.} =
  ## Updates a configured mTLS certificate.

  let res = await client.httpPUT(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates/{certificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountOrZoneAccountOrZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                                        accountOrZone: AccountOrZone,
                                                                        certificateId: types.AccessUuid,
                                                                        accountOrZoneId: types.AccessIdentifier): Future[types.AccessIdResponse3] {.async.} =
  ## Deletes an mTLS certificate.

  let res = await client.httpDELETE(fmt"/{accountOrZone}/{accountOrZoneId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
