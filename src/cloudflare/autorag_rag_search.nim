# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdAutoragRagsIdAiSearchRequest = object
    filters: Option[JsonNode]
    max_num_results: Option[int64]
    model: Option[JsonNode]
    query: string
    ranking_options: Option[JsonNode]
    reranking: Option[JsonNode]
    rewrite_query: Option[bool]
    stream: Option[bool]
    system_prompt: Option[string]
  PostAccountsAccountIdAutoragRagsIdAiSearchResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAutoragRagsIdSearchRequest = object
    filters: Option[JsonNode]
    max_num_results: Option[int64]
    query: string
    ranking_options: Option[JsonNode]
    reranking: Option[JsonNode]
    rewrite_query: Option[bool]
  PostAccountsAccountIdAutoragRagsIdSearchResponse* = object
    result: JsonNode
    success: bool

proc postAccountsAccountIdAutoragRagsIdAiSearch*(client: CloudflareClient,
                                                 id: string, accountId: string,
                                                 body: PostAccountsAccountIdAutoragRagsIdAiSearchRequest): Future[PostAccountsAccountIdAutoragRagsIdAiSearchResponse] {.async.} =
  ## Runs an AI Search query against an AutoRAG.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/autorag/rags/{id}/ai-search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAutoragRagsIdAiSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAutoragRagsIdSearch*(client: CloudflareClient,
                                               id: string, accountId: string,
                                               body: PostAccountsAccountIdAutoragRagsIdSearchRequest): Future[PostAccountsAccountIdAutoragRagsIdSearchResponse] {.async.} =
  ## Searches an AutoRAG.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/autorag/rags/{id}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAutoragRagsIdSearchResponse)
  else:
    raise newException(CloudflareClientError, body)
