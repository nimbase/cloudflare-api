# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdSlurperJobs*(client: CloudflareClient,
                                      accountId: string,
                                      limit: int64 = default(int64),
                                      offset: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## Lists all R2 Super Slurper migration jobs for the account with their status.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/slurper/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSlurperJobs*(client: CloudflareClient,
                                       accountId: string,
                                       body: types.R2SlurperCreateJobRequest): Future[JsonNode] {.async.} =
  ## Creates a new R2 Super Slurper migration job to transfer objects from a source
  ## bucket (e.g. S3, GCS, R2) to R2.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/slurper/jobs", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperJobsAbortAll*(client: CloudflareClient,
                                              accountId: string): Future[JsonNode] {.async.} =
  ## Cancels all running R2 Super Slurper migration jobs for the account. Any objects
  ## in the middle of a transfer will finish, but no new objects will start
  ## transferring.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/jobs/abortAll")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSlurperJobsJobId*(client: CloudflareClient,
                                           accountId: string, jobId: string): Future[JsonNode] {.async.} =
  ## Retrieves detailed status and configuration for a specific R2 Super Slurper
  ## migration job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/slurper/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSlurperJobsJobId*(client: CloudflareClient,
                                              accountId: string, jobId: string): Future[JsonNode] {.async.} =
  ## Deletes a completed, aborted, or errored R2 Super Slurper migration job. Active
  ## jobs cannot be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/slurper/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperJobsJobIdAbort*(client: CloudflareClient,
                                                accountId: string, jobId: string): Future[JsonNode] {.async.} =
  ## Cancels a specific R2 Super Slurper migration job. Any objects in the middle of
  ## a transfer will finish, but no new objects will start transferring.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/jobs/{jobId}/abort")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSlurperJobsJobIdLogs*(client: CloudflareClient,
                                               accountId: string, jobId: string,
                                               limit: int64 = default(int64),
                                               offset: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## Gets log entries for an R2 Super Slurper migration job, showing migration status
  ## changes, errors, etc.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/slurper/jobs/{jobId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperJobsJobIdPause*(client: CloudflareClient,
                                                accountId: string, jobId: string): Future[JsonNode] {.async.} =
  ## Pauses a running R2 Super Slurper migration job. The job can be resumed later to
  ## continue transferring.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/jobs/{jobId}/pause")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSlurperJobsJobIdProgress*(client: CloudflareClient,
                                                   accountId: string,
                                                   jobId: string): Future[JsonNode] {.async.} =
  ## Retrieves current progress metrics for an R2 Super Slurper migration job

  let res = await client.httpGET(fmt"/accounts/{accountId}/slurper/jobs/{jobId}/progress")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperJobsJobIdResume*(client: CloudflareClient,
                                                 accountId: string,
                                                 jobId: string): Future[JsonNode] {.async.} =
  ## Resumes a paused R2 Super Slurper migration job, continuing the transfer from
  ## where it stopped.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/jobs/{jobId}/resume")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperSourceConnectivityPrecheck*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: types.R2SlurperSourceJobSchema): Future[JsonNode] {.async.} =
  ## Check whether tokens are valid against the source bucket

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/source/connectivity-precheck", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSlurperTargetConnectivityPrecheck*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: types.R2SlurperR2TargetSchema): Future[JsonNode] {.async.} =
  ## Check whether tokens are valid against the target bucket

  let res = await client.httpPUT(fmt"/accounts/{accountId}/slurper/target/connectivity-precheck", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
