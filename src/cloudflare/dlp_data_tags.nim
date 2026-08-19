# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTags*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 categoryId: string): Future[JsonNode] {.async.} =
  ## Lists data tags in a category.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}/data_tags")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTags*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  categoryId: string,
                                                                  body: types.DlpNewDataTag): Future[JsonNode] {.async.} =
  ## Creates a data tag in a category.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}/data_tags", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      categoryId: string,
                                                                      tagId: string): Future[JsonNode] {.async.} =
  ## Gets a data tag from a category.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}/data_tags/{tagId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      categoryId: string,
                                                                      tagId: string,
                                                                      body: types.DlpDataTagUpdate): Future[JsonNode] {.async.} =
  ## Updates a data tag in a category.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}/data_tags/{tagId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpDataTagCategoriesCategoryIdDataTagsTagId*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         categoryId: string,
                                                                         tagId: string): Future[JsonNode] {.async.} =
  ## Deletes a data tag from a category.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}/data_tags/{tagId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
