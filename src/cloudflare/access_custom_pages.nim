# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessCustomPages*(client: CloudflareClient,
                                            accountId: types.AccessIdentifier,
                                            page: int64 = 1, perPage: int64 = 50): Future[types.AccessResponseCollection10] {.async.} =
  ## List custom pages

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/custom_pages", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection10)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessCustomPages*(client: CloudflareClient,
                                             accountId: types.AccessIdentifier,
                                             body: types.AccessCustomPage): Future[types.AccessSingleResponseWithoutHtml] {.async.} =
  ## Create a custom page

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/custom_pages", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponseWithoutHtml)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessCustomPagesValidate*(client: CloudflareClient,
                                                     accountId: types.AccessIdentifier,
                                                     body: types.AccessCustomPageValidate): Future[types.AccessValidateResponse] {.async.} =
  ## Validate a Liquid template and return its errors and warnings without persisting
  ## it.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/custom_pages/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessValidateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessCustomPagesCustomPageId*(client: CloudflareClient,
                                                        customPageId: types.AccessUuid,
                                                        accountId: types.AccessIdentifier): Future[types.AccessSingleResponse11] {.async.} =
  ## Fetches a custom page and also returns its HTML.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/custom_pages/{customPageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse11)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessCustomPagesCustomPageId*(client: CloudflareClient,
                                                        customPageId: types.AccessUuid,
                                                        accountId: types.AccessIdentifier,
                                                        body: types.AccessCustomPage): Future[types.AccessSingleResponseWithoutHtml] {.async.} =
  ## Update a custom page

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/custom_pages/{customPageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponseWithoutHtml)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessCustomPagesCustomPageId*(client: CloudflareClient,
                                                           customPageId: types.AccessUuid,
                                                           accountId: types.AccessIdentifier): Future[types.AccessIdResponse3] {.async.} =
  ## Delete a custom page

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/custom_pages/{customPageId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
