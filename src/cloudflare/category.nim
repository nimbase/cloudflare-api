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

proc getAccountsAccountIdCloudforceOneEventsCategories*(client: CloudflareClient,
                                                        accountId: string,
                                                        datasetIds: seq[string] = @[]): Future[seq[JsonNode]] {.async.} =
  ## Lists all threat event categories configured for classifying and organizing
  ## threat events.

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
  ## Lists categories

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
  ## Creates a new threat event category in Cloudforce One for organizing and
  ## classifying threat events.

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
  ## Retrieves details for a specific threat event category.

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
  ## Updates a category

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
  ## Removes a threat event category from Cloudforce One.

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
  ## Partially updates a threat event category in Cloudforce One, modifying specific
  ## fields without replacing the entire category.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/categories/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsCategoriesCategoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdResourceLibraryCategories*(client: CloudflareClient,
                                                    accountId: string,
                                                    limit: int64 = 25,
                                                    offset: int64 = 0): Future[types.AlexandriaGetCategoriesResponse] {.async.} =
  ## List application categories.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
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
  ## Get application category by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/resource-library/categories/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetCategoryResponse)
  else:
    raise newException(CloudflareClientError, body)
