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
  ## Lists all AI Gateway evaluator types configured for the account.

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
  ## Creates a new AI Gateway.

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
  ## Retrieves details for a specific AI Gateway dataset.

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
  ## Deletes an AI Gateway dataset.

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
  ## Updates an existing AI Gateway dataset.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/custom-providers/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayCustomProvidersIdResponse)
  else:
    raise newException(CloudflareClientError, body)
