# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  RemediationOrderOption* = enum
    orderCreatedAt = "created_at"
    orderAfflictionDate = "affliction_date"
    orderIntegrationName = "integration_name"
    orderStatus = "status"
    orderLastUpdatedAt = "last_updated_at"
    orderAssetName = "asset_name"
    orderFindingTypeName = "finding_type_name"

  RemediationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdDataSecurityPostureRemediationsJobs*(client: CloudflareClient,
                                                              accountId: string,
                                                              cursor: string = default(string),
                                                              page: int64 = default(int64),
                                                              perPage: int64 = default(int64),
                                                              search: string = default(string),
                                                              minUpdatedAt: string = default(string),
                                                              maxUpdatedAt: string = default(string),
                                                              status: types.PostureApiRemediationJobStatusEnum = default(types.PostureApiRemediationJobStatusEnum),
                                                              triggeredByActor: seq[string] = @[],
                                                              integrationId: string = default(string),
                                                              order: RemediationOrderOption,
                                                              direction: RemediationDirectionOption): Future[types.PostureApiPaginatedRemediationJobList] {.async.} =
  ## List all remediation jobs tied to a specific Cloudflare Account. Note that
  ## `cursor` and `page` are mutually exclusive.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["min_updated_at"] = $minUpdatedAt
  q["max_updated_at"] = $maxUpdatedAt
  q["status"] = $status
  for v in triggeredByActor: q["triggered_by_actor"] = $v
  q["integration_id"] = $integrationId
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/remediations/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedRemediationJobList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureRemediationsJobs*(client: CloudflareClient,
                                                               accountId: string,
                                                               body: types.PostureApiRemediationJobsCreateRequest): Future[types.PostureApiCreateRemediationJobResponse] {.async.} =
  ## Create one or more remediation jobs tied to a specific Cloudflare Account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/remediations/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiCreateRemediationJobResponse)
  else:
    raise newException(CloudflareClientError, body)
