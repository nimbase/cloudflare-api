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
  GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse* = object
    account: JsonNode
      ## The account's default datasets, or null if they are not set.
    effective: JsonNode
      ## The datasets that event searches use when `datasetId` is omitted.
    user: JsonNode
      ## Your default datasets, or null if you have not set them.
  PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesRequest = object
    dataset_ids: seq[string]
    scope: string
  PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse* = object
    account: JsonNode
      ## The account's default datasets, or null if they are not set.
    effective: JsonNode
      ## The datasets that event searches use when `datasetId` is omitted.
    user: JsonNode
      ## Your default datasets, or null if you have not set them.
  DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse* = object
    account: JsonNode
      ## The account's default datasets, or null if they are not set.
    effective: JsonNode
      ## The datasets that event searches use when `datasetId` is omitted.
    user: JsonNode
      ## Your default datasets, or null if you have not set them.
  DatasetScopeOption* = enum
    scopeUser = "user"
    scopeAccount = "account"


proc getAccountsAccountIdCloudforceOneEventsDataset*(client: CloudflareClient,
                                                     accountId: string,
                                                     includeDeleted: bool = default(bool)): Future[seq[JsonNode]] {.async.} =
  ## Lists the account's datasets. Set `includeDeleted` to include deleted datasets.

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
  ## Creates a dataset for grouping events. Set `isPublic` to true to let anyone
  ## search it; otherwise only the account can.

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
  ## Returns a dataset by its ID.

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
  ## Updates a dataset's `name` and `isPublic` setting. Both fields are required.

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
  ## Deletes a dataset. To see deleted datasets, use `threat-intel datasets list`
  ## with `includeDeleted`.

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
  ## Updates a dataset's `name` and `isPublic` setting. Both fields are required.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetsPreferences*(client: CloudflareClient,
                                                                 accountId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse] {.async.} =
  ## Returns your default datasets, the account's default datasets, and the datasets
  ## that event searches currently use when `datasetId` is omitted.
  ## `unresolvableDatasetIds` lists saved datasets you can no longer read.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/datasets/preferences")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneEventsDatasetsPreferences*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 body: PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesRequest): Future[PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse] {.async.} =
  ## Sets the datasets to use when a request omits `datasetId`, for you (`scope`
  ## `user`) or for the account (`scope` `account`). Your own default datasets take
  ## precedence over the account's. Every dataset must exist and be readable by the
  ## account, and the list cannot mix analytics and intelligence datasets.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/events/datasets/preferences", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetsPreferences*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    scope: DatasetScopeOption): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse] {.async.} =
  ## Removes your default datasets (`scope` `user`) or the account's (`scope`
  ## `account`). After you remove your own, requests that omit `datasetId` use the
  ## account's default datasets, if set.

  var q = initOrderedTable[string, string]()
  q["scope"] = $scope
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/datasets/preferences", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetsPreferencesResponse)
  else:
    raise newException(CloudflareClientError, body)
