# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayCustomProvidersResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayCustomProvidersRequest = object
    base_url: string
    beta: Option[bool]
    curl_example: Option[string]
    description: Option[string]
    enable: Option[bool]
    headers: Option[string]
    js_example: Option[string]
    link: Option[string]
    name: string
    position: Option[int64]
    slug: string
  PostAccountsAccountIdAiGatewayCustomProvidersResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayCustomProvidersIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiGatewayCustomProvidersIdRequest = object
    base_url: Option[string]
    beta: Option[bool]
    curl_example: Option[string]
    description: Option[string]
    enable: Option[bool]
    headers: Option[string]
    js_example: Option[string]
    link: Option[string]
    logo: Option[string]
    name: Option[string]
    position: Option[int64]
    slug: Option[string]
  PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayCustomProviders*(client: CloudflareClient,
                                                   accountId: string,
                                                   page: int64 = 1,
                                                   perPage: int64 = 20,
                                                   beta: bool = default(bool),
                                                   enable: bool = default(bool),
                                                   search: string = default(string)): Future[GetAccountsAccountIdAiGatewayCustomProvidersResponse] {.async.} =
  ## Lists the custom providers configured for the account, ordered by position and
  ## then name.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["beta"] = $beta
  q["enable"] = $enable
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/custom-providers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayCustomProvidersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayCustomProviders*(client: CloudflareClient,
                                                    accountId: string,
                                                    body: PostAccountsAccountIdAiGatewayCustomProvidersRequest): Future[PostAccountsAccountIdAiGatewayCustomProvidersResponse] {.async.} =
  ## Creates an account-level custom provider that forwards AI Gateway requests to
  ## the HTTPS base URL you supply. Requests reference the provider as
  ## `custom-{slug}`, so the slug must be unique within the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/custom-providers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayCustomProvidersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayCustomProvidersId*(client: CloudflareClient,
                                                     accountId: string,
                                                     id: string): Future[GetAccountsAccountIdAiGatewayCustomProvidersIdResponse] {.async.} =
  ## Retrieves a custom provider, including its slug, base URL, and custom headers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/custom-providers/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayCustomProvidersIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayCustomProvidersId*(client: CloudflareClient,
                                                        accountId: string,
                                                        id: string): Future[DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse] {.async.} =
  ## Deletes a custom provider and every pricing rule that belongs to it.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/custom-providers/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayCustomProvidersIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiGatewayCustomProvidersId*(client: CloudflareClient,
                                                       accountId: string,
                                                       id: string,
                                                       body: PatchAccountsAccountIdAiGatewayCustomProvidersIdRequest): Future[PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse] {.async.} =
  ## Updates the specified fields of a custom provider. Changes clear cached entries
  ## for the provider.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/custom-providers/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse)
  else:
    raise newException(CloudflareClientError, body)
