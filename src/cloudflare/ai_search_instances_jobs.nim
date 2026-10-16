# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchInstancesIdJobsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchInstancesIdJobsRequest = object
    description: Option[string]
  PostAccountsAccountIdAiSearchInstancesIdJobsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdRequest = object
    action: string
  PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsRequest = object
    description: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdRequest = object
    action: string
  PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdAiSearchInstancesIdJobs*(client: CloudflareClient,
                                                  id: string, accountId: string,
                                                  page: int64 = 1,
                                                  perPage: int64 = 20): Future[GetAccountsAccountIdAiSearchInstancesIdJobsResponse] {.async.} =
  ## Lists indexing jobs for an AI Search instance.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchInstancesIdJobs*(client: CloudflareClient,
                                                   id: string, accountId: string,
                                                   body: PostAccountsAccountIdAiSearchInstancesIdJobsRequest): Future[PostAccountsAccountIdAiSearchInstancesIdJobsResponse] {.async.} =
  ## Creates a new indexing job for an AI Search instance.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/instances/{id}/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchInstancesIdJobsJobId*(client: CloudflareClient,
                                                       id: string, jobId: string,
                                                       accountId: string): Future[GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse] {.async.} =
  ## Retrieves details for a specific AI Search indexing job.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchInstancesIdJobsJobId*(client: CloudflareClient,
                                                         id: string,
                                                         jobId: string,
                                                         accountId: string,
                                                         body: PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdRequest): Future[PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse] {.async.} =
  ## Cancels an in-progress indexing job for an AI Search instance.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/instances/{id}/jobs/{jobId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchInstancesIdJobsJobIdLogs*(client: CloudflareClient,
                                                           id: string,
                                                           jobId: string,
                                                           accountId: string,
                                                           page: int64 = 1,
                                                           perPage: int64 = 20): Future[GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse] {.async.} =
  ## Lists log entries for an AI Search indexing job.
  ##
  ## Deprecated: use
  ## /accounts/{account_id}/ai-search/namespaces/{namespace}/instances (and
  ## descendant paths) instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/instances/{id}/jobs/{jobId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchInstancesIdJobsJobIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobs*(client: CloudflareClient,
                                                                     id: string,
                                                                     accountId: string,
                                                                     namespace: string,
                                                                     page: int64 = 1,
                                                                     perPage: int64 = 20): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse] {.async.} =
  ## Lists indexing jobs for an AI Search instance.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobs*(client: CloudflareClient,
                                                                      id: string,
                                                                      accountId: string,
                                                                      namespace: string,
                                                                      body: PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsRequest): Future[PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse] {.async.} =
  ## Creates a new indexing job for an AI Search instance.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobId*(client: CloudflareClient,
                                                                          id: string,
                                                                          jobId: string,
                                                                          accountId: string,
                                                                          namespace: string): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse] {.async.} =
  ## Retrieves details for a specific AI Search indexing job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobId*(client: CloudflareClient,
                                                                            id: string,
                                                                            jobId: string,
                                                                            accountId: string,
                                                                            namespace: string,
                                                                            body: PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdRequest): Future[PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse] {.async.} =
  ## Cancels an in-progress indexing job for an AI Search instance.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/jobs/{jobId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogs*(client: CloudflareClient,
                                                                              id: string,
                                                                              jobId: string,
                                                                              accountId: string,
                                                                              namespace: string,
                                                                              page: int64 = 1,
                                                                              perPage: int64 = 20): Future[GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse] {.async.} =
  ## Lists log entries for an AI Search indexing job.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{namespace}/instances/{id}/jobs/{jobId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNamespaceInstancesIdJobsJobIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
