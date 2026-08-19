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
  PostAccountsAccountIdAddressingPrefixesRequest = object
    asn: types.AddressingAsn
    cidr: types.AddressingCidr
    delegate_loa_creation: Option[types.AddressingDelegateLoaCreation]
    description: Option[types.AddressingDescription]
    loa_document_id: Option[types.AddressingLoaDocumentIdentifier]
  PatchAccountsAccountIdAddressingPrefixesPrefixIdRequest = object
    description: types.AddressingDescription

proc postAccountsAccountIdAddressingLoaDocuments*(client: CloudflareClient,
                                                  accountId: types.AddressingAccountIdentifier): Future[types.AddressingLoaUploadResponse] {.async.} =
  ## Submit LOA document (pdf format) under the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/loa_documents")
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AddressingLoaUploadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingLoaDocumentsLoaDocumentIdDownload*(client: CloudflareClient,
                                                                      loaDocumentId: types.AddressingLoaDocumentIdentifier,
                                                                      accountId: types.AddressingAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Download specified LOA document under the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/loa_documents/{loaDocumentId}/download")
  return res

proc getAccountsAccountIdAddressingPrefixes*(client: CloudflareClient,
                                             accountId: types.AddressingAccountIdentifier): Future[types.AddressingResponseCollection] {.async.} =
  ## List all prefixes owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingPrefixes*(client: CloudflareClient,
                                              accountId: types.AddressingAccountIdentifier,
                                              body: PostAccountsAccountIdAddressingPrefixesRequest): Future[types.AddressingSingleResponse] {.async.} =
  ## Add a new prefix under the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/prefixes", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AddressingSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingPrefixesPrefixId*(client: CloudflareClient,
                                                     prefixId: types.AddressingPrefixIdentifier,
                                                     accountId: types.AddressingAccountIdentifier): Future[types.AddressingSingleResponse] {.async.} =
  ## List a particular prefix owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingPrefixesPrefixId*(client: CloudflareClient,
                                                        prefixId: types.AddressingPrefixIdentifier,
                                                        accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseSingle] {.async.} =
  ## Delete an unapproved prefix owned by the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAddressingPrefixesPrefixId*(client: CloudflareClient,
                                                       prefixId: types.AddressingPrefixIdentifier,
                                                       accountId: types.AddressingAccountIdentifier,
                                                       body: PatchAccountsAccountIdAddressingPrefixesPrefixIdRequest): Future[types.AddressingSingleResponse] {.async.} =
  ## Modify the description for a prefix owned by the account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingPrefixesPrefixIdValidate*(client: CloudflareClient,
                                                              prefixId: types.AddressingPrefixIdentifier,
                                                              accountId: types.AddressingAccountIdentifier): Future[types.AddressingSingleResponse] {.async.} =
  ## Triggers a new prefix validation. The checks are run asynchronously and include
  ## IRR, RPKI, and prefix ownership.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/validate")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AddressingSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
