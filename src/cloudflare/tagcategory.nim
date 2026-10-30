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
  GetAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse* = object
    created_at: string
    description: string
    name: string
    schema: seq[types.CloudforceOneEventsFieldDefinition]
      ## Parsed FieldDefinition[] defining custom fields for this category, or null if
      ## none.
    updated_at: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidRequest = object
    description: Option[string]
    name: Option[string]
    schema: Option[seq[types.CloudforceOneEventsFieldDefinition]]
  PatchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse* = object
    created_at: string
    description: string
    name: string
    schema: seq[types.CloudforceOneEventsFieldDefinition]
      ## Parsed FieldDefinition[] defining custom fields for this category, or null if
      ## none.
    updated_at: string
    uuid: string
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

proc getAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuid*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       categoryUuid: string): Future[GetAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse] {.async.} =
  ## Returns a tag category by its UUID, including the custom fields defined in its
  ## `schema`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tag-categories/{categoryUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuid*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          categoryUuid: string): Future[DeleteAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse] {.async.} =
  ## Deletes a tag category by its UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/tag-categories/{categoryUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuid*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         categoryUuid: string,
                                                                         body: PatchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidRequest): Future[PatchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse] {.async.} =
  ## Updates the given fields of a tag category and leaves the other fields
  ## unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tag-categories/{categoryUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTagsCategories*(client: CloudflareClient,
                                                            accountId: string,
                                                            search: string = default(string)): Future[GetAccountsAccountIdCloudforceOneEventsTagsCategoriesResponse] {.async.} =
  ## Lists the account's tag categories. Use `search` to filter them.

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
  ## Creates a tag category. Use `schema` to define the custom fields its tags can
  ## have.

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
  ## Legacy. Use `threat-intel tags categories get` (`GET
  ## /events/tag-categories/{category_uuid}`) instead. Available through 2026-11-28.

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
  ## Legacy. Use `threat-intel tags categories delete` (`DELETE
  ## /events/tag-categories/{category_uuid}`) instead. Available through 2026-11-28.

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
  ## Legacy. Use `threat-intel tags categories update` (`PATCH
  ## /events/tag-categories/{category_uuid}`) instead. Available through 2026-11-28.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/{categoryUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagsCategoriesCategoryUuidResponse)
  else:
    raise newException(CloudflareClientError, body)
