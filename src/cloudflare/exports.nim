# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdDataSecurityPostureContentExport*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: types.PostureApiContentExportRequest): Future[types.PostureApiExportJobResponse] {.async.} =
  ## Creates a CSV export for content and accepts optional filters in the payload.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/content/export", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiExportJobResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureExports*(client: CloudflareClient,
                                                     accountId: string,
                                                     page: int64 = default(int64),
                                                     perPage: int64 = default(int64),
                                                     status: types.PostureApiStatusEnum = default(types.PostureApiStatusEnum)): Future[types.PostureApiPaginatedExportJobList] {.async.} =
  ## List all export jobs for a given requestor's organization

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/exports", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedExportJobList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureExportsId*(client: CloudflareClient,
                                                       accountId: string,
                                                       id: string): Future[types.PostureApiExportJobResponse] {.async.} =
  ## Retrieves a single export job by its unique identifier

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/exports/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiExportJobResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsExport*(client: CloudflareClient,
                                                             accountId: string,
                                                             body: types.PostureApiFindingExportFilterRequest): Future[types.PostureApiExportJobResponse] {.async.} =
  ## Creates a CSV export for findings and accepts optional filters in the payload.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/export", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiExportJobResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsStorageNamespaceIdInstancesExport*(client: CloudflareClient,
                                                                                        accountId: string,
                                                                                        storageNamespaceId: string,
                                                                                        body: types.PostureApiFindingInstanceExportFilterRequest): Future[types.PostureApiExportJobResponse] {.async.} =
  ## Creates a CSV export for Finding instances and accepts optional filters in the
  ## payload.
  ##
  ## The `storage_namespace_id` path parameter is derived from the finding ID by
  ## base64-decoding it
  ## (which yields `integration_id:finding_type_id`) and replacing the colon with a
  ## hyphen.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/{storageNamespaceId}/instances/export", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiExportJobResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureRemediationsJobsExport*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     body: types.PostureApiRemediationJobsExportFilterRequest): Future[types.PostureApiExportJobResponse] {.async.} =
  ## Creates a CSV export for remediation jobs and accepts optional filters in the
  ## payload.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/remediations/jobs/export", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiExportJobResponse)
  else:
    raise newException(CloudflareClientError, body)
