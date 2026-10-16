# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsRequest = object
    key: string
    next_action: string
    wait_for_completion: Option[bool]
  PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdRequest = object
    next_action: string
    wait_for_completion: Option[bool]
  PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse* = object
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


proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItems*(client: CloudflareClient,
                                                                      id: string,
                                                                      accountId: string,
                                                                      namespace: string,
                                                                      page: int64 = 1,
                                                                      perPage: int64 = 20,
                                                                      search: string = default(string),
                                                                      sortBy: AiSearchInstancesItemSortByOption = sortByStatus,
                                                                      status: AiSearchInstancesItemStatusOption = statusQueued,
                                                                      source: string = default(string),
                                                                      metadataFilter: string = default(string),
                                                                      itemId: string = default(string),
                                                                      key: string = default(string)): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse] {.async.} =
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
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItems*(client: CloudflareClient,
                                                                       id: string,
                                                                       accountId: string,
                                                                       namespace: string): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse] {.async.} =
  ## Uploads a file to a managed AI Search instance via multipart/form-data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItems*(client: CloudflareClient,
                                                                      id: string,
                                                                      accountId: string,
                                                                      namespace: string,
                                                                      body: PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsRequest): Future[PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse] {.async.} =
  ## Creates or updates an indexed item in an AI Search instance.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemId*(client: CloudflareClient,
                                                                            id: string,
                                                                            itemId: string,
                                                                            accountId: string,
                                                                            namespace: string): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse] {.async.} =
  ## Retrieves a specific indexed item from an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemId*(client: CloudflareClient,
                                                                               id: string,
                                                                               itemId: string,
                                                                               accountId: string,
                                                                               namespace: string): Future[DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse] {.async.} =
  ## Deletes a file from a managed AI Search instance and removes its indexed data.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemId*(client: CloudflareClient,
                                                                              id: string,
                                                                              itemId: string,
                                                                              accountId: string,
                                                                              namespace: string,
                                                                              body: PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdRequest): Future[PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse] {.async.} =
  ## Synchronizes an item to an AI Search instance index.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunks*(client: CloudflareClient,
                                                                                  id: string,
                                                                                  itemId: string,
                                                                                  accountId: string,
                                                                                  namespace: string,
                                                                                  limit: int64 = 20,
                                                                                  offset: int64 = 0): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse] {.async.} =
  ## Lists chunks for a specific item in an AI Search instance, including their text
  ## content.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}/chunks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdChunksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdDownload*(client: CloudflareClient,
                                                                                    id: string,
                                                                                    itemId: string,
                                                                                    accountId: string,
                                                                                    namespace: string): Future[AsyncResponse] {.async.} =
  ## Downloads the raw file content for a specific item from the managed AI Search
  ## instance storage.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}/download")
  return res

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogs*(client: CloudflareClient,
                                                                                id: string,
                                                                                itemId: string,
                                                                                accountId: string,
                                                                                namespace: string,
                                                                                limit: int64 = 50,
                                                                                cursor: string = default(string)): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse] {.async.} =
  ## Lists processing logs for a specific item in an AI Search instance.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/items/{itemId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdItemsItemIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
