# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpDataTagCategories*(client: CloudflareClient,
                                               accountId: string): Future[JsonNode] {.async.} =
  ## Lists data tag categories configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_categories")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDataTagCategories*(client: CloudflareClient,
                                                accountId: string,
                                                body: types.DlpNewDataTagCategory): Future[JsonNode] {.async.} =
  ## Creates a data tag category, optionally from a template.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/data_tag_categories", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDataTagCategoriesCategoryId*(client: CloudflareClient,
                                                         accountId: string,
                                                         categoryId: string): Future[JsonNode] {.async.} =
  ## Gets a data tag category and its tags.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpDataTagCategoriesCategoryId*(client: CloudflareClient,
                                                         accountId: string,
                                                         categoryId: string,
                                                         body: types.DlpDataTagCategoryUpdate): Future[JsonNode] {.async.} =
  ## Updates a data tag category and its tags.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpDataTagCategoriesCategoryId*(client: CloudflareClient,
                                                            accountId: string,
                                                            categoryId: string): Future[JsonNode] {.async.} =
  ## Deletes a data tag category and its tags.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/data_tag_categories/{categoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
