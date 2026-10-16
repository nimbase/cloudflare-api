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
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesRequest = object
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
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdRequest = object
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
  PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsRequest = object
    ai_search_options: Option[JsonNode]
    messages: seq[JsonNode]
    model: Option[string]
    stream: Option[bool]
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse* = object
    choices: seq[JsonNode]
    chunks: seq[JsonNode]
    id: string
    model: string
    `object`: string
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse* = object
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchRequest = object
    ai_search_options: Option[JsonNode]
    messages: Option[seq[JsonNode]]
    query: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse* = object
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
                                            hostname: string = default(string),
                                            namespace: string = default(string),
                                            orderBy: AiSearchInstanceOrderByOption = orderByCreatedAt,
                                            orderByDirection: AiSearchInstanceOrderByDirectionOption = orderByDirectionDesc): Future[GetAccountsAccountIdAiSearchInstancesResponse] {.async.} =
  ## Lists all AI Search instances in the account.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["hostname"] = $hostname
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
  ## Create a new AI Search instance with the given configuration. If type is omitted
  ## or null, a non-blank HTTP(S) source infers web-crawler and any other source
  ## infers r2; r2 sources must name an existing bucket. A missing or blank source
  ## without a type creates a managed upload-only instance.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

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
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

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
  ## Updates the configuration of an AI Search instance.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/instances/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchInstancesId*(client: CloudflareClient,
                                                 accountId: string, id: string): Future[DeleteAccountsAccountIdAiSearchInstancesIdResponse] {.async.} =
  ## Deletes an AI Search instance and all its indexed data permanently.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

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
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

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
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

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
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstances*(client: CloudflareClient,
                                                               accountId: string,
                                                               namespace: string,
                                                               page: int64 = 1,
                                                               perPage: int64 = 20,
                                                               search: string = default(string),
                                                               hostname: string = default(string),
                                                               orderBy: AiSearchInstanceOrderByOption = orderByCreatedAt,
                                                               orderByDirection: AiSearchInstanceOrderByDirectionOption = orderByDirectionDesc): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse] {.async.} =
  ## Lists all AI Search instances in the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["hostname"] = $hostname
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstances*(client: CloudflareClient,
                                                                accountId: string,
                                                                namespace: string,
                                                                body: PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesRequest): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse] {.async.} =
  ## Create a new AI Search instance with the given configuration. If type is omitted
  ## or null, a non-blank HTTP(S) source infers web-crawler and any other source
  ## infers r2; r2 sources must name an existing bucket. A missing or blank source
  ## without a type creates a managed upload-only instance.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 id: string,
                                                                 namespace: string): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse] {.async.} =
  ## Retrieve the configuration and status of an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchNamespacesNamespaceInstancesId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 id: string,
                                                                 namespace: string,
                                                                 body: PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdRequest): Future[PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse] {.async.} =
  ## Updates the configuration of an AI Search instance.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    id: string,
                                                                    namespace: string): Future[DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse] {.async.} =
  ## Deletes an AI Search instance and all its indexed data permanently.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletions*(client: CloudflareClient,
                                                                                 id: string,
                                                                                 accountId: string,
                                                                                 namespace: string,
                                                                                 body: PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsRequest): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse] {.async.} =
  ## Performs a chat completion request against an AI Search instance, using indexed
  ## content as context for generating responses.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/chat/completions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdChatCompletionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCache*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            id: string,
                                                                            namespace: string): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse] {.async.} =
  ## Purges all cached search results for an AI Search instance. A new internal cache
  ## key is generated, immediately orphaning all prior cached entries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/purge_cache")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdPurgeCacheResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearch*(client: CloudflareClient,
                                                                        id: string,
                                                                        accountId: string,
                                                                        namespace: string,
                                                                        body: PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchRequest): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse] {.async.} =
  ## Executes a semantic search query against an AI Search instance to find relevant
  ## indexed content.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStats*(client: CloudflareClient,
                                                                      id: string,
                                                                      accountId: string,
                                                                      namespace: string): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse] {.async.} =
  ## Retrieve usage and indexing statistics for an AI Search instance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdStatsResponse)
  else:
    raise newException(CloudflareClientError, body)
