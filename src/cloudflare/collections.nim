# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2CollectionsResponse* = object
    pagination: JsonNode
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdCloudforceOneV2CollectionsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    success: bool
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdRequest = object
    metadata: Option[JsonNode]
    name: Option[string]
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsRequest = object
    default: Option[JsonNode]
    name: string
    required: Option[bool]
    `type`: string
  PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse* = object
    result: JsonNode
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdRequest = object
    name: Option[string]
    position: Option[float64]
    required: Option[bool]
    `type`: Option[string]
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse* = object
    result: JsonNode
  GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse* = object
    pagination: JsonNode
    result: seq[JsonNode]
    success: bool
  GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdRequest = object
    data: JsonNode
  PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdCloudforceOneV2Collections*(client: CloudflareClient,
                                                     accountId: string,
                                                     page: float64 = default(float64),
                                                     limit: float64 = default(float64)): Future[GetAccountsAccountIdCloudforceOneV2CollectionsResponse] {.async.} =
  ## Retrieves all collections for an account with pagination

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/collections", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CollectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2Collections*(client: CloudflareClient,
                                                      accountId: string): Future[PostAccountsAccountIdCloudforceOneV2CollectionsResponse] {.async.} =
  ## Creates a collection with four patterns: schema-only (empty collection),
  ## rows-only (inferred schema), schema+rows (validated data), or file upload
  ## (CSV/JSON/JSONL)

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/collections", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2CollectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2CollectionsCollectionId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 collectionId: string): Future[GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse] {.async.} =
  ## Retrieves a single collection by ID with its schema and metadata

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    collectionId: string): Future[DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse] {.async.} =
  ## Deletes a collection and all its items. This action cannot be undone. The
  ## Durable Object storage is deleted asynchronously.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2CollectionsCollectionId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   collectionId: string,
                                                                   body: PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse] {.async.} =
  ## Updates collection name and/or metadata. Schema (columns) cannot be modified.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumns*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         collectionId: string,
                                                                         body: PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsRequest): Future[PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse] {.async.} =
  ## Adds a new column to an existing collection schema. Existing items will have
  ## NULL for the new column unless a default value is provided.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/columns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   collectionId: string,
                                                                                   columnId: string): Future[DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse] {.async.} =
  ## Delete a column from the collection schema. Data is preserved as orphaned UUID
  ## keys (forensic safety) and filtered from API responses.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/columns/{columnId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnId*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  collectionId: string,
                                                                                  columnId: string,
                                                                                  body: PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse] {.async.} =
  ## Update name, type, required, or position of a column.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/columns/{columnId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdColumnsColumnIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdExport*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       collectionId: string,
                                                                       includeIds: bool = default(bool)): Future[AsyncResponse] {.async.} =
  ## Streams collection data in the requested format. Supports CSV (default), JSONL,
  ## or Markdown via Accept header. Queries items in batches of 1000 to avoid
  ## memory/timeout limits.

  var q = initOrderedTable[string, string]()
  q["include_ids"] = $includeIds
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/export", q)
  return res

proc getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItems*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      collectionId: string,
                                                                      cursor: string = default(string),
                                                                      limit: float64 = default(float64),
                                                                      q: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse] {.async.} =
  ## Retrieves items from a collection with keyset pagination and optional
  ## column-based filters

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["limit"] = $limit
  q["q"] = $q
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/items", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemId*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            collectionId: string,
                                                                            itemId: string): Future[GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse] {.async.} =
  ## Retrieve a single item from a collection by its identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemId*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               collectionId: string,
                                                                               itemId: string): Future[DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse] {.async.} =
  ## Delete an item from a collection by its identifier.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemId*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              collectionId: string,
                                                                              itemId: string,
                                                                              body: PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse] {.async.} =
  ## Update an item in a collection with partial data.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/items/{itemId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItemsItemIdResponse)
  else:
    raise newException(CloudflareClientError, body)
