# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchInstancesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchInstancesRequest = object
    ai_gateway_id: Option[string]
    ai_search_model: Option[string]
    cache: Option[bool]
    cache_threshold: Option[string]
    cache_ttl: Option[JsonNode]
    chunk: Option[bool]
    chunk_overlap: Option[int64]
    chunk_size: Option[int64]
    custom_metadata: Option[seq[JsonNode]]
    embedding_model: Option[string]
    fusion_method: Option[string]
    hybrid_search_enabled: Option[bool]
    id: string
    index_method: Option[JsonNode]
    indexing_options: Option[JsonNode]
    max_num_results: Option[int64]
    metadata: Option[JsonNode]
    public_endpoint_params: Option[JsonNode]
    reranking: Option[bool]
    reranking_model: Option[string]
    retrieval_options: Option[JsonNode]
    rewrite_model: Option[string]
    rewrite_query: Option[bool]
    score_threshold: Option[float64]
    source: Option[string]
    source_params: Option[JsonNode]
    sync_interval: Option[JsonNode]
    token_id: Option[string]
    `type`: Option[string]
  PostAccountsAccountIdAiSearchInstancesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchInstancesIdRequest = object
    ai_gateway_id: Option[string]
    ai_search_model: Option[string]
    cache: Option[bool]
    cache_threshold: Option[string]
    cache_ttl: Option[JsonNode]
    chunk: Option[bool]
    chunk_overlap: Option[int64]
    chunk_size: Option[int64]
    custom_metadata: Option[seq[JsonNode]]
    embedding_model: Option[string]
    fusion_method: Option[string]
    index_method: Option[JsonNode]
    indexing_options: Option[JsonNode]
    max_num_results: Option[int64]
    metadata: Option[JsonNode]
    paused: Option[bool]
    public_endpoint_params: Option[JsonNode]
    reranking: Option[bool]
    reranking_model: Option[string]
    retrieval_options: Option[JsonNode]
    rewrite_model: Option[string]
    rewrite_query: Option[bool]
    score_threshold: Option[float64]
    source: Option[string]
    source_params: Option[JsonNode]
    summarization: Option[bool]
    summarization_model: Option[string]
    sync_interval: Option[JsonNode]
    system_prompt_ai_search: Option[string]
    system_prompt_index_summarization: Option[string]
    system_prompt_rewrite_query: Option[string]
    token_id: Option[string]
  PutAccountsAccountIdAiSearchInstancesIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchInstancesIdChatCompletionsRequest = object
    ai_search_options: Option[JsonNode]
    messages: seq[JsonNode]
    model: Option[string]
    stream: Option[bool]
  PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse* = object
    choices: seq[JsonNode]
    chunks: seq[JsonNode]
    id: string
    model: string
    `object`: string
  PostAccountsAccountIdAiSearchInstancesIdSearchRequest = object
    ai_search_options: Option[JsonNode]
    messages: Option[seq[JsonNode]]
    query: Option[string]
  PostAccountsAccountIdAiSearchInstancesIdSearchResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchInstancesIdStatsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNameInstancesRequest = object
    ai_gateway_id: Option[string]
    ai_search_model: Option[string]
    cache: Option[bool]
    cache_threshold: Option[string]
    cache_ttl: Option[JsonNode]
    chunk: Option[bool]
    chunk_overlap: Option[int64]
    chunk_size: Option[int64]
    custom_metadata: Option[seq[JsonNode]]
    embedding_model: Option[string]
    fusion_method: Option[string]
    hybrid_search_enabled: Option[bool]
    id: string
    index_method: Option[JsonNode]
    indexing_options: Option[JsonNode]
    max_num_results: Option[int64]
    metadata: Option[JsonNode]
    public_endpoint_params: Option[JsonNode]
    reranking: Option[bool]
    reranking_model: Option[string]
    retrieval_options: Option[JsonNode]
    rewrite_model: Option[string]
    rewrite_query: Option[bool]
    score_threshold: Option[float64]
    source: Option[string]
    source_params: Option[JsonNode]
    sync_interval: Option[JsonNode]
    token_id: Option[string]
    `type`: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchNamespacesNameInstancesIdRequest = object
    ai_gateway_id: Option[string]
    ai_search_model: Option[string]
    cache: Option[bool]
    cache_threshold: Option[string]
    cache_ttl: Option[JsonNode]
    chunk: Option[bool]
    chunk_overlap: Option[int64]
    chunk_size: Option[int64]
    custom_metadata: Option[seq[JsonNode]]
    embedding_model: Option[string]
    fusion_method: Option[string]
    index_method: Option[JsonNode]
    indexing_options: Option[JsonNode]
    max_num_results: Option[int64]
    metadata: Option[JsonNode]
    paused: Option[bool]
    public_endpoint_params: Option[JsonNode]
    reranking: Option[bool]
    reranking_model: Option[string]
    retrieval_options: Option[JsonNode]
    rewrite_model: Option[string]
    rewrite_query: Option[bool]
    score_threshold: Option[float64]
    source: Option[string]
    source_params: Option[JsonNode]
    summarization: Option[bool]
    summarization_model: Option[string]
    sync_interval: Option[JsonNode]
    system_prompt_ai_search: Option[string]
    system_prompt_index_summarization: Option[string]
    system_prompt_rewrite_query: Option[string]
    token_id: Option[string]
  PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsRequest = object
    ai_search_options: Option[JsonNode]
    messages: seq[JsonNode]
    model: Option[string]
    stream: Option[bool]
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse* = object
    choices: seq[JsonNode]
    chunks: seq[JsonNode]
    id: string
    model: string
    `object`: string
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse* = object
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchRequest = object
    ai_search_options: Option[JsonNode]
    messages: Option[seq[JsonNode]]
    query: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse* = object
    result: JsonNode
    success: bool
  AiSearchInstanceOrderByOption* = enum
    orderByCreatedAt = "created_at"

  AiSearchInstanceOrderByDirectionOption* = enum
    orderByDirectionAsc = "asc"
    orderByDirectionDesc = "desc"


proc getAccountsAccountIdAiSearchInstances*(client: CloudflareClient,
                                            accountId: string, page: int64 = 1,
                                            perPage: int64 = 20,
                                            search: string = default(string),
                                            namespace: string = default(string),
                                            orderBy: AiSearchInstanceOrderByOption = orderByCreatedAt,
                                            orderByDirection: AiSearchInstanceOrderByDirectionOption = orderByDirectionDesc): Future[GetAccountsAccountIdAiSearchInstancesResponse] {.async.} =
  ## List all AI Search instances in the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["namespace"] = $namespace
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchInstances*(client: CloudflareClient,
                                             accountId: string,
                                             body: PostAccountsAccountIdAiSearchInstancesRequest): Future[PostAccountsAccountIdAiSearchInstancesResponse] {.async.} =
  ## Create a new AI Search instance with the given configuration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/instances", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAiSearchInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchInstancesId*(client: CloudflareClient,
                                              accountId: string, id: string): Future[GetAccountsAccountIdAiSearchInstancesIdResponse] {.async.} =
  ## Retrieve the configuration and status of an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchInstancesId*(client: CloudflareClient,
                                              accountId: string, id: string,
                                              body: PutAccountsAccountIdAiSearchInstancesIdRequest): Future[PutAccountsAccountIdAiSearchInstancesIdResponse] {.async.} =
  ## Update the configuration of an AI Search instance.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/instances/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchInstancesId*(client: CloudflareClient,
                                                 accountId: string, id: string): Future[DeleteAccountsAccountIdAiSearchInstancesIdResponse] {.async.} =
  ## Permanently delete an AI Search instance and all its indexed data.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchInstancesIdChatCompletions*(client: CloudflareClient,
                                                              id: string,
                                                              accountId: string,
                                                              body: PostAccountsAccountIdAiSearchInstancesIdChatCompletionsRequest): Future[PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse] {.async.} =
  ## Performs a chat completion request against an AI Search instance, using indexed
  ## content as context for generating responses.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/instances/{id}/chat/completions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchInstancesIdChatCompletionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchInstancesIdSearch*(client: CloudflareClient,
                                                     id: string,
                                                     accountId: string,
                                                     body: PostAccountsAccountIdAiSearchInstancesIdSearchRequest): Future[PostAccountsAccountIdAiSearchInstancesIdSearchResponse] {.async.} =
  ## Executes a semantic search query against an AI Search instance to find relevant
  ## indexed content.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/instances/{id}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchInstancesIdSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchInstancesIdStats*(client: CloudflareClient,
                                                   id: string, accountId: string): Future[GetAccountsAccountIdAiSearchInstancesIdStatsResponse] {.async.} =
  ## Retrieve usage and indexing statistics for an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstances*(client: CloudflareClient,
                                                          accountId: string,
                                                          page: int64 = 1,
                                                          perPage: int64 = 20,
                                                          search: string = default(string),
                                                          namespace: string = default(string),
                                                          orderBy: AiSearchInstanceOrderByOption = orderByCreatedAt,
                                                          orderByDirection: AiSearchInstanceOrderByDirectionOption = orderByDirectionDesc,
                                                          name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse] {.async.} =
  ## List all AI Search instances in the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["namespace"] = $namespace
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstances*(client: CloudflareClient,
                                                           accountId: string,
                                                           name: string,
                                                           body: PostAccountsAccountIdAiSearchNamespacesNameInstancesRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse] {.async.} =
  ## Create a new AI Search instance with the given configuration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesId*(client: CloudflareClient,
                                                            accountId: string,
                                                            id: string,
                                                            name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse] {.async.} =
  ## Retrieve the configuration and status of an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchNamespacesNameInstancesId*(client: CloudflareClient,
                                                            accountId: string,
                                                            id: string,
                                                            name: string,
                                                            body: PutAccountsAccountIdAiSearchNamespacesNameInstancesIdRequest): Future[PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse] {.async.} =
  ## Update the configuration of an AI Search instance.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchNamespacesNameInstancesId*(client: CloudflareClient,
                                                               accountId: string,
                                                               id: string,
                                                               name: string): Future[DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse] {.async.} =
  ## Permanently delete an AI Search instance and all its indexed data.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletions*(client: CloudflareClient,
                                                                            id: string,
                                                                            accountId: string,
                                                                            name: string,
                                                                            body: PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse] {.async.} =
  ## Performs a chat completion request against an AI Search instance, using indexed
  ## content as context for generating responses.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/chat/completions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesIdChatCompletionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCache*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       id: string,
                                                                       name: string): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse] {.async.} =
  ## Purges all cached search results for an AI Search instance. A new internal cache
  ## key is generated, immediately orphaning all prior cached entries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/purge_cache")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesIdPurgeCacheResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstancesIdSearch*(client: CloudflareClient,
                                                                   id: string,
                                                                   accountId: string,
                                                                   name: string,
                                                                   body: PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse] {.async.} =
  ## Executes a semantic search query against an AI Search instance to find relevant
  ## indexed content.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesIdSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdStats*(client: CloudflareClient,
                                                                 id: string,
                                                                 accountId: string,
                                                                 name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse] {.async.} =
  ## Retrieve usage and indexing statistics for an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdStatsResponse)
  else:
    raise newException(CloudflareClientError, body)
