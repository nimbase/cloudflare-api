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
  PostAccountsAccountIdDlpDocumentFingerprintsRequest = object
    description: Option[string]
    match_percent: int32
    name: string

proc getAccountsAccountIdDlpDocumentFingerprints*(client: CloudflareClient,
                                                  accountId: string): Future[JsonNode] {.async.} =
  ## Lists all document fingerprints configured for DLP scanning in the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/document_fingerprints")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDocumentFingerprints*(client: CloudflareClient,
                                                   accountId: string,
                                                   body: PostAccountsAccountIdDlpDocumentFingerprintsRequest): Future[JsonNode] {.async.} =
  ## Creates a new document fingerprint for DLP scanning. Document fingerprints
  ## detect documents that are structurally similar to the uploaded sample.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/document_fingerprints", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       documentFingerprintId: string): Future[JsonNode] {.async.} =
  ## Gets a document fingerprint and its latest upload status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/document_fingerprints/{documentFingerprintId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        documentFingerprintId: string,
                                                                        body: types.DlpUpdateDocumentFingerprint): Future[JsonNode] {.async.} =
  ## Updates metadata for an existing document fingerprint, such as its name or
  ## description.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/document_fingerprints/{documentFingerprintId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       documentFingerprintId: string): Future[JsonNode] {.async.} =
  ## Uploads a new document to create or update a fingerprint. The document structure
  ## is analyzed to enable detection of similar documents.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/document_fingerprints/{documentFingerprintId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          documentFingerprintId: string): Future[AsyncResponse] {.async.} =
  ## Removes a document fingerprint from DLP configuration. Documents matching this
  ## fingerprint will no longer be detected.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/document_fingerprints/{documentFingerprintId}")
  return res
