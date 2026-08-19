# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAutoragRagsIdJobsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdAutoragRagsIdJobs*(client: CloudflareClient, id: string,
                                            accountId: string, page: int64 = 1,
                                            perPage: int64 = 20): Future[GetAccountsAccountIdAutoragRagsIdJobsResponse] {.async.} =
  ## Lists jobs for an AutoRAG.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/autorag/rags/{id}/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAutoragRagsIdJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAutoragRagsIdJobsJobId*(client: CloudflareClient,
                                                 id: string, jobId: string,
                                                 accountId: string): Future[GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse] {.async.} =
  ## Returns details for an AutoRAG job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/autorag/rags/{id}/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAutoragRagsIdJobsJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAutoragRagsIdJobsJobIdLogs*(client: CloudflareClient,
                                                     id: string, jobId: string,
                                                     accountId: string,
                                                     page: int64 = 1,
                                                     perPage: int64 = 20): Future[GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse] {.async.} =
  ## Lists logs for an AutoRAG job.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/autorag/rags/{id}/jobs/{jobId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAutoragRagsIdJobsJobIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
