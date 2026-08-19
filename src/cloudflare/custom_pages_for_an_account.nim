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
  PutAccountsAccountIdentifierCustomPagesIdentifierRequest = object
    state: types.CustomPagesState
    url: types.CustomPagesUrl

proc getAccountsAccountIdentifierCustomPages*(client: CloudflareClient,
                                              accountIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResultList] {.async.} =
  ## Fetches all the custom pages at the account level.

  let res = await client.httpGET(fmt"/accounts/{accountIdentifier}/custom_pages")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdentifierCustomPagesPreviewTokens*(client: CloudflareClient,
                                                            accountIdentifier: types.CustomPagesIdentifier,
                                                            body: types.CustomPagesPreviewRequest): Future[types.CustomPagesPreviewTokenResult] {.async.} =
  ## Creates a signed JWT token used to preview custom pages before they are
  ## published.

  let res = await client.httpPOST(fmt"/accounts/{accountIdentifier}/custom_pages/preview_tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesPreviewTokenResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdentifierCustomPagesIdentifier*(client: CloudflareClient,
                                                        identifier: types.CustomPagesErrorPageType,
                                                        accountIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Fetches the details of a custom page.

  let res = await client.httpGET(fmt"/accounts/{accountIdentifier}/custom_pages/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdentifierCustomPagesIdentifier*(client: CloudflareClient,
                                                        identifier: types.CustomPagesErrorPageType,
                                                        accountIdentifier: types.CustomPagesIdentifier,
                                                        body: PutAccountsAccountIdentifierCustomPagesIdentifierRequest): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Updates the configuration of an existing custom page.

  let res = await client.httpPUT(fmt"/accounts/{accountIdentifier}/custom_pages/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)
