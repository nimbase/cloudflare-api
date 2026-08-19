# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchTokensResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchTokensRequest = object
    cf_api_id: string
    cf_api_key: string
    legacy: Option[bool]
    name: string
  PostAccountsAccountIdAiSearchTokensResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchTokensIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchTokensIdRequest = object
    cf_api_id: string
    cf_api_key: string
    legacy: Option[bool]
    name: string
  PutAccountsAccountIdAiSearchTokensIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchTokensIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiSearchTokens*(client: CloudflareClient,
                                         accountId: string, page: int64 = 1,
                                         perPage: int64 = 20,
                                         search: string = default(string)): Future[GetAccountsAccountIdAiSearchTokensResponse] {.async.} =
  ## List stored AI Search credentials in the account without exposing their secrets.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchTokens*(client: CloudflareClient,
                                          accountId: string,
                                          body: PostAccountsAccountIdAiSearchTokensRequest): Future[PostAccountsAccountIdAiSearchTokensResponse] {.async.} =
  ## Create a stored Cloudflare credential for an AI Search instance to access its
  ## data source.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/tokens", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAiSearchTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchTokensId*(client: CloudflareClient,
                                           accountId: string, id: string): Future[GetAccountsAccountIdAiSearchTokensIdResponse] {.async.} =
  ## Retrieve a stored AI Search credential without exposing its secret.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/tokens/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchTokensIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchTokensId*(client: CloudflareClient,
                                           accountId: string, id: string,
                                           body: PutAccountsAccountIdAiSearchTokensIdRequest): Future[PutAccountsAccountIdAiSearchTokensIdResponse] {.async.} =
  ## Replace a stored AI Search credential and invalidate cached credentials for
  ## instances that use it.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/tokens/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchTokensIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchTokensId*(client: CloudflareClient,
                                              accountId: string, id: string): Future[DeleteAccountsAccountIdAiSearchTokensIdResponse] {.async.} =
  ## Permanently delete a stored AI Search credential. Credentials in use by an
  ## instance cannot be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/tokens/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchTokensIdResponse)
  else:
    raise newException(CloudflareClientError, body)
