# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsRequest = object
    ai_search_options: JsonNode
    messages: seq[JsonNode]
    model: Option[string]
    stream: Option[bool]
  PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse* = object
    choices: seq[JsonNode]
    chunks: seq[JsonNode]
    errors: seq[JsonNode]
    id: string
    model: string
    `object`: string
  PostAccountsAccountIdAiSearchNamespacesNameSearchRequest = object
    ai_search_options: JsonNode
    messages: Option[seq[JsonNode]]
    query: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNameSearchResponse* = object
    result: JsonNode
    success: bool

proc postAccountsAccountIdAiSearchNamespacesNameChatCompletions*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 name: string,
                                                                 body: PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse] {.async.} =
  ## Performs a chat completion request against multiple AI Search instances in
  ## parallel, merging retrieved content as context for generating a response.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/chat/completions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameChatCompletionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameSearch*(client: CloudflareClient,
                                                        accountId: string,
                                                        name: string,
                                                        body: PostAccountsAccountIdAiSearchNamespacesNameSearchRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameSearchResponse] {.async.} =
  ## Performs a semantic search query against multiple AI Search instances in
  ## parallel, merging the retrieved results into a single ranked response.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameSearchResponse)
  else:
    raise newException(CloudflareClientError, body)
