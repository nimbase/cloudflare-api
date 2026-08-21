# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsRequest = object
    key: string
    next_action: string
    wait_for_completion: Option[bool]
  PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdRequest = object
    next_action: string
    wait_for_completion: Option[bool]
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  AiSearchInstancesItemSortByOption* = enum
    sortByStatus = "status"
    sortByModifiedAt = "modified_at"

  AiSearchInstancesItemStatusOption* = enum
    statusQueued = "queued"
    statusRunning = "running"
    statusCompleted = "completed"
    statusError = "error"
    statusSkipped = "skipped"
    statusOutdated = "outdated"


proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdItems*(client: CloudflareClient,
                                                                 id: string,
                                                                 accountId: string,
                                                                 page: int64 = 1,
                                                                 perPage: int64 = 20,
                                                                 search: string = default(string),
                                                                 sortBy: AiSearchInstancesItemSortByOption = sortByStatus,
                                                                 status: AiSearchInstancesItemStatusOption,
                                                                 source: string = default(string),
                                                                 metadataFilter: string = default(string),
                                                                 itemId: string = default(string),
                                                                 key: string = default(string),
                                                                 name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse] {.async.} =
  ## Lists indexed items in an AI Search instance.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["sort_by"] = $sortBy
  q["status"] = $status
  q["source"] = $source
  q["metadata_filter"] = $metadataFilter
  q["item_id"] = $itemId
  q["key"] = $key
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstancesIdItems*(client: CloudflareClient,
                                                                  id: string,
                                                                  accountId: string,
                                                                  name: string): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse] {.async.} =
  ## Uploads a file to a managed AI Search instance via multipart/form-data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchNamespacesNameInstancesIdItems*(client: CloudflareClient,
                                                                 id: string,
                                                                 accountId: string,
                                                                 name: string,
                                                                 body: PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsRequest): Future[PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse] {.async.} =
  ## Creates or updates an indexed item in an AI Search instance.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemId*(client: CloudflareClient,
                                                                       id: string,
                                                                       itemId: string,
                                                                       accountId: string,
                                                                       name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse] {.async.} =
  ## Retrieves a specific indexed item from an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemId*(client: CloudflareClient,
                                                                          id: string,
                                                                          itemId: string,
                                                                          accountId: string,
                                                                          name: string): Future[DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse] {.async.} =
  ## Deletes a file from a managed AI Search instance and triggers a reindex.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemId*(client: CloudflareClient,
                                                                         id: string,
                                                                         itemId: string,
                                                                         accountId: string,
                                                                         name: string,
                                                                         body: PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdRequest): Future[PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse] {.async.} =
  ## Syncs an item to an AI Search instance index.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunks*(client: CloudflareClient,
                                                                             id: string,
                                                                             itemId: string,
                                                                             accountId: string,
                                                                             limit: int64 = 20,
                                                                             offset: int64 = 0,
                                                                             name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse] {.async.} =
  ## Lists chunks for a specific item in an AI Search instance, including their text
  ## content.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}/chunks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdChunksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdDownload*(client: CloudflareClient,
                                                                               id: string,
                                                                               itemId: string,
                                                                               accountId: string,
                                                                               name: string): Future[AsyncResponse] {.async.} =
  ## Downloads the raw file content for a specific item from the managed AI Search
  ## instance storage.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}/download")
  return res

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogs*(client: CloudflareClient,
                                                                           id: string,
                                                                           itemId: string,
                                                                           accountId: string,
                                                                           limit: int64 = 50,
                                                                           cursor: string = default(string),
                                                                           name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse] {.async.} =
  ## Lists processing logs for a specific item in an AI Search instance.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/items/{itemId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdItemsItemIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
