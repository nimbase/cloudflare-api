# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneEventsDatasetCreateRequest = object
    is_public: bool
    name: string
  PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse* = object
    is_analytics: bool
    is_public: bool
    name: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse* = object
    is_analytics: bool
    is_public: bool
    name: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdRequest = object
    is_public: bool
    name: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse* = object
    is_analytics: bool
    is_public: bool
    name: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse* = object
    name: string
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdRequest = object
    is_public: bool
    name: string
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse* = object
    is_analytics: bool
    is_public: bool
    name: string
    uuid: string

proc getAccountsAccountIdCloudforceOneEventsDataset*(client: CloudflareClient,
                                                     accountId: string,
                                                     includeDeleted: bool = default(bool)): Future[seq[JsonNode]] {.async.} =
  ## Lists all threat event datasets configured in Cloudforce One.

  var q = initOrderedTable[string, string]()
  q["includeDeleted"] = $includeDeleted
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetCreate*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: PostAccountsAccountIdCloudforceOneEventsDatasetCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse] {.async.} =
  ## Creates a new threat event dataset in Cloudforce One for organizing related
  ## threat events.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetId*(client: CloudflareClient,
                                                              accountId: string,
                                                              datasetId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse] {.async.} =
  ## Retrieves details for a specific threat event dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetId*(client: CloudflareClient,
                                                               accountId: string,
                                                               datasetId: string,
                                                               body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse] {.async.} =
  ## Updates an existing dataset

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 datasetId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse] {.async.} =
  ## Soft-deletes a dataset given a datasetId.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsDatasetDatasetId*(client: CloudflareClient,
                                                                accountId: string,
                                                                datasetId: string,
                                                                body: PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse] {.async.} =
  ## Partially updates a threat event dataset in Cloudforce One, modifying specific
  ## fields without replacing the entire dataset configuration.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)
  else:
    raise newException(CloudflareClientError, body)
