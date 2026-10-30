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
  PostAccountsAccountIdCloudforceOneEventsCategoriesCreateRequest = object
    kill_chain: float64
    mitre_attack: Option[seq[string]]
    mitre_capec: Option[seq[string]]
    name: string
    shortname: Option[string]
  PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdRequest = object
    kill_chain: Option[float64]
    mitre_attack: Option[seq[string]]
    mitre_capec: Option[seq[string]]
    name: Option[string]
    shortname: Option[string]
  PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdRequest = object
    kill_chain: Option[float64]
    mitre_attack: Option[seq[string]]
    mitre_capec: Option[seq[string]]
    name: Option[string]
    shortname: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdRequest = object
    kill_chain: Option[float64]
    mitre_attack: Option[seq[string]]
    mitre_capec: Option[seq[string]]
    name: Option[string]
    shortname: Option[string]
  PostAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdRequest = object
    kill_chain: Option[float64]
    mitre_attack: Option[seq[string]]
    mitre_capec: Option[seq[string]]
    name: Option[string]
    shortname: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse* = object
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    name: string
    shortname: string
    uuid: string

proc getAccountsAccountIdCloudforceOneEventsCategories*(client: CloudflareClient,
                                                        accountId: string,
                                                        datasetIds: seq[string] = @[]): Future[seq[JsonNode]] {.async.} =
  ## Lists the event categories used by events in the datasets given by `datasetIds`,
  ## or in the default dataset when `datasetIds` is omitted. Dataset scope values are
  ## not supported. To list every category, use `threat-intel events categories
  ## catalog list`.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsCategoriesCatalog*(client: CloudflareClient,
                                                               accountId: string): Future[seq[JsonNode]] {.async.} =
  ## Lists every event category in the catalog, whether or not an event uses it. To
  ## list only the categories used in specific datasets, use `threat-intel events
  ## categories list`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/categories/catalog")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsCategoriesCreate*(client: CloudflareClient,
                                                               accountId: string,
                                                               body: PostAccountsAccountIdCloudforceOneEventsCategoriesCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse] {.async.} =
  ## Creates an event category for classifying events. `name` and `killChain` are
  ## required.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/categories/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsCategoriesCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsCategoriesCategoryId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  categoryId: string): Future[GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse] {.async.} =
  ## Legacy. Use `threat-intel events categories get` (`GET
  ## /events/event-categories/by-id/{category_id}`) instead. Available through
  ## 2026-11-28.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/categories/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsCategoriesCategoryId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   categoryId: string,
                                                                   body: PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse] {.async.} =
  ## Legacy. Use `threat-intel events categories update` (`POST
  ## /events/event-categories/by-id/{category_id}`) instead. Available through
  ## 2026-11-28.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/categories/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     categoryId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse] {.async.} =
  ## Legacy. Use `threat-intel events categories delete` (`DELETE
  ## /events/event-categories/by-id/{category_id}`) instead. Available through
  ## 2026-11-28.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/categories/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsCategoriesCategoryId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    categoryId: string,
                                                                    body: PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse] {.async.} =
  ## Legacy. Use `threat-intel events categories update` (`PATCH
  ## /events/event-categories/by-id/{category_id}`) instead. Available through
  ## 2026-11-28.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/categories/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryId*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           categoryId: string): Future[GetAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse] {.async.} =
  ## Returns an event category by its ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/event-categories/by-id/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryId*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            categoryId: string,
                                                                            body: PostAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse] {.async.} =
  ## Updates the given fields of an event category and leaves the other fields
  ## unchanged.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/event-categories/by-id/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryId*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              categoryId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse] {.async.} =
  ## Deletes an event category by its ID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/event-categories/by-id/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryId*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             categoryId: string,
                                                                             body: PatchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse] {.async.} =
  ## Updates the given fields of an event category and leaves the other fields
  ## unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/event-categories/by-id/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsEventCategoriesByIdCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdResourceLibraryCategories*(client: CloudflareClient,
                                                    accountId: string,
                                                    limit: int64 = 25,
                                                    offset: int64 = 0,
                                                    cursor: string = default(string)): Future[types.AlexandriaGetCategoriesResponse] {.async.} =
  ## List the categories available for classifying applications, ordered by name.
  ## Results are paginated by `offset` or `cursor`.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/resource-library/categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdResourceLibraryCategoriesId*(client: CloudflareClient,
                                                      accountId: string,
                                                      id: types.AlexandriaCategoryId): Future[types.AlexandriaGetCategoryResponse] {.async.} =
  ## Retrieve an application category by its numeric ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/resource-library/categories/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetCategoryResponse)
  else:
    raise newException(CloudflareClientError, body)
