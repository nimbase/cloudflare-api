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
  GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse* = object
    categories: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateRequest = object
    description: Option[string]
    name: string
    schema: Option[seq[types.CloudforceOneEventsFieldDefinition]]
  PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse* = object
    created_at: string
    description: string
    name: string
    schema: seq[types.CloudforceOneEventsFieldDefinition]
      ## Parsed FieldDefinition[] defining custom fields for this category, or null if
      ## none.
    updated_at: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse* = object
    created_at: string
    description: string
    name: string
    schema: seq[types.CloudforceOneEventsFieldDefinition]
      ## Parsed FieldDefinition[] defining custom fields for this category, or null if
      ## none.
    updated_at: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidRequest = object
    description: Option[string]
    name: Option[string]
    schema: Option[seq[types.CloudforceOneEventsFieldDefinition]]
  PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse* = object
    created_at: string
    description: string
    name: string
    schema: seq[types.CloudforceOneEventsFieldDefinition]
      ## Parsed FieldDefinition[] defining custom fields for this category, or null if
      ## none.
    updated_at: string
    uuid: string

proc getAccountsAccountIdCloudforceOneEventsTagsCategories*(client: CloudflareClient,
                                                            accountId: string,
                                                            search: string = default(string)): Future[GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse] {.async.} =
  ## Returns all Source-of-Truth tag categories for an account.

  var q = initOrderedTable[string, string]()
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsTagsCategoriesCreate*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   body: PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse] {.async.} =
  ## Creates a new Source-of-Truth tag category for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsTagsCategoriesCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuid*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        categoryUuid: string): Future[GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse] {.async.} =
  ## Returns a single Source-of-Truth tag category by UUID, including its full
  ## schema.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/{categoryUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuid*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           categoryUuid: string): Future[DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse] {.async.} =
  ## Deletes a Source-of-Truth tag category by UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/{categoryUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuid*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          categoryUuid: string,
                                                                          body: PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidRequest): Future[PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse] {.async.} =
  ## Updates a Source-of-Truth tag category by UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/{categoryUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)
