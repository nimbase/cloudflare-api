# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdDlpDatasetsRequest = object
    case_sensitive: Option[bool]
    description: Option[string]
    encoding_version: Option[int32]
    name: string
    secret: Option[bool]
  PutAccountsAccountIdDlpDatasetsDatasetIdRequest = object
    case_sensitive: Option[bool]
    description: Option[string]
    name: Option[string]

proc getAccountsAccountIdDlpDatasets*(client: CloudflareClient,
                                      accountId: string): Future[JsonNode] {.async.} =
  ## Lists all DLP datasets configured for the account, including custom word lists
  ## and EDM datasets.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/datasets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDatasets*(client: CloudflareClient,
                                       accountId: string,
                                       body: PostAccountsAccountIdDlpDatasetsRequest): Future[JsonNode] {.async.} =
  ## Creates a new DLP (Data Loss Prevention) dataset for storing custom detection
  ## patterns. Datasets can contain exact match data, word lists, or EDM (Exact Data
  ## Match) configurations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/datasets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDatasetsDatasetId*(client: CloudflareClient,
                                               accountId: string,
                                               datasetId: string): Future[JsonNode] {.async.} =
  ## Gets a dataset and its latest upload status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpDatasetsDatasetId*(client: CloudflareClient,
                                               accountId: string,
                                               datasetId: string,
                                               body: PutAccountsAccountIdDlpDatasetsDatasetIdRequest): Future[JsonNode] {.async.} =
  ## Updates the configuration of an existing DLP dataset, such as its name,
  ## description, or detection settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpDatasetsDatasetId*(client: CloudflareClient,
                                                  accountId: string,
                                                  datasetId: string): Future[AsyncResponse] {.async.} =
  ## This deletes all versions of the dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}")
  return res

proc postAccountsAccountIdDlpDatasetsDatasetIdUpload*(client: CloudflareClient,
                                                      accountId: string,
                                                      datasetId: string): Future[JsonNode] {.async.} =
  ## Creates a new version of a DLP dataset, allowing you to stage changes before
  ## activation. Used for single-column EDM and custom word lists.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}/upload")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDatasetsDatasetIdUploadVersion*(client: CloudflareClient,
                                                             accountId: string,
                                                             datasetId: string,
                                                             version: int64): Future[JsonNode] {.async.} =
  ## This is used for single-column EDMv1 and Custom Word Lists. The EDM format
  ## can only be created in the Cloudflare dashboard. For other clients, this
  ## operation can only be used for non-secret Custom Word Lists. The body must
  ## be a UTF-8 encoded, newline (NL or CRNL) separated list of words to be matched.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}/upload/{version}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDatasetsDatasetIdVersionsVersion*(client: CloudflareClient,
                                                               accountId: string,
                                                               datasetId: string,
                                                               version: int64): Future[JsonNode] {.async.} =
  ## This is used for multi-column EDMv2 datasets. The EDMv2 format can only be
  ## created in the Cloudflare dashboard. The columns in the response appear in
  ## the same order as in the request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}/versions/{version}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDatasetsDatasetIdVersionsVersionEntriesEntryId*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             datasetId: string,
                                                                             version: int64,
                                                                             entryId: string): Future[JsonNode] {.async.} =
  ## This is used for multi-column EDMv2 datasets. The EDMv2 format can only be
  ## created in the Cloudflare dashboard.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/datasets/{datasetId}/versions/{version}/entries/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
