# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchRequest = object
    cursor: Option[string]
    filter: Option[JsonNode]
    limit: Option[int64]
    q: Option[string]
    sort: Option[JsonNode]
  PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse* = object
    pagination: JsonNode
    result: seq[JsonNode]
    success: bool

proc postAccountsAccountIdCloudforceOneV2CollectionsCollectionIdItems*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       collectionId: string): Future[JsonNode] {.async.} =
  ## Create one or more items in a collection. Supports single item (data field) or
  ## bulk creation (data array). Item data is validated against the collection
  ## schema.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/items", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearch*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        collectionId: string,
                                                                        body: PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchRequest): Future[PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse] {.async.} =
  ## Search collection items with advanced filtering. Supports operators (eq, neq,
  ## gt, lt, gte, lte, contains, is_empty, is_not_empty) and AND/OR logic for complex
  ## queries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/collections/{collectionId}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2CollectionsCollectionIdSearchResponse)
  else:
    raise newException(CloudflareClientError, body)
