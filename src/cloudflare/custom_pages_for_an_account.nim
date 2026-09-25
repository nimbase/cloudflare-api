# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PutAccountsAccountIdCustomPagesIdentifierRequest = object
    state: types.CustomPagesState
    url: types.CustomPagesUrl

proc getAccountsAccountIdCustomPages*(client: CloudflareClient,
                                      accountId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResultList] {.async.} =
  ## Lists all custom page configurations for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_pages")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCustomPagesPreviewTokens*(client: CloudflareClient,
                                                    accountId: types.CustomPagesIdentifier,
                                                    body: types.CustomPagesPreviewRequest): Future[types.CustomPagesPreviewTokenResult] {.async.} =
  ## Creates a signed JWT for previewing an account-level custom page before it is
  ## published.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/custom_pages/preview_tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesPreviewTokenResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCustomPagesIdentifier*(client: CloudflareClient,
                                                identifier: types.CustomPagesErrorPageType,
                                                accountId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Returns the configuration for a custom page type at the account level.

  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_pages/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCustomPagesIdentifier*(client: CloudflareClient,
                                                identifier: types.CustomPagesErrorPageType,
                                                accountId: types.CustomPagesIdentifier,
                                                body: PutAccountsAccountIdCustomPagesIdentifierRequest): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Updates the configuration for a custom page type at the account level.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/custom_pages/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)
