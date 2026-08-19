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
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsRequest = object
    description: Option[string]
  PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdRequest = object
    action: string
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdAiSearchInstancesIdJobs*(client: CloudflareClient,
                                                  id: string, accountId: string,
                                                  page: int64 = 1,
                                                  perPage: int64 = 20): Future[GetAccountsAccountIdAiSearchInstancesIdJobsResponse] {.async.} =
  ## Lists indexing jobs for an AI Search instance.

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
  ## Cancel an in-progress indexing job for an AI Search instance.

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

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobs*(client: CloudflareClient,
                                                                id: string,
                                                                accountId: string,
                                                                page: int64 = 1,
                                                                perPage: int64 = 20,
                                                                name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse] {.async.} =
  ## Lists indexing jobs for an AI Search instance.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespacesNameInstancesIdJobs*(client: CloudflareClient,
                                                                 id: string,
                                                                 accountId: string,
                                                                 name: string,
                                                                 body: PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsRequest): Future[PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse] {.async.} =
  ## Creates a new indexing job for an AI Search instance.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobId*(client: CloudflareClient,
                                                                     id: string,
                                                                     jobId: string,
                                                                     accountId: string,
                                                                     name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse] {.async.} =
  ## Retrieves details for a specific AI Search indexing job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobId*(client: CloudflareClient,
                                                                       id: string,
                                                                       jobId: string,
                                                                       accountId: string,
                                                                       name: string,
                                                                       body: PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdRequest): Future[PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse] {.async.} =
  ## Cancel an in-progress indexing job for an AI Search instance.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/jobs/{jobId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogs*(client: CloudflareClient,
                                                                         id: string,
                                                                         jobId: string,
                                                                         accountId: string,
                                                                         page: int64 = 1,
                                                                         perPage: int64 = 20,
                                                                         name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse] {.async.} =
  ## Lists log entries for an AI Search indexing job.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}/jobs/{jobId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameInstancesIdJobsJobIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
