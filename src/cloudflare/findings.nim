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
  FindingDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  FindingObservationOption* = enum
    observationActivity = "Activity"
    observationInsight = "Insight"
    observationIssue = "Issue"

  FindingOrderOption* = enum
    orderFindingName = "finding.name"
    orderInstanceCount = "instance_count"
    orderIntegrationName = "integration.name"
    orderLatestAfflictionDate = "latest_affliction_date"
    orderSeverity = "severity"

  FindingProductOption* = enum
    productCloud = "Cloud"
    productSaas = "Saas"

  FindingSeverityOption* = enum
    severityCritical = "Critical"
    severityHigh = "High"
    severityMedium = "Medium"
    severityLow = "Low"

  FindingTypeOption* = enum
    typeContent = "Content"
    typePosture = "Posture"


proc getAccountsAccountIdDataSecurityPostureFindings*(client: CloudflareClient,
                                                      accountId: string,
                                                      cursor: string = default(string),
                                                      direction: set[FindingDirectionOption] = {},
                                                      ignored: bool = default(bool),
                                                      integrationId: string = default(string),
                                                      maxAfflictionDate: string = default(string),
                                                      minAfflictionDate: string = default(string),
                                                      observation: set[FindingObservationOption] = {},
                                                      order: set[FindingOrderOption] = {},
                                                      page: int64 = default(int64),
                                                      perPage: int64 = default(int64),
                                                      product: set[FindingProductOption] = {},
                                                      search: string = default(string),
                                                      severity: set[FindingSeverityOption] = {},
                                                      `type`: set[FindingTypeOption] = {},
                                                      vendor: types.PostureApiVendorsEnum = default(types.PostureApiVendorsEnum),
                                                      findingTypeIds: string = default(string)): Future[types.PostureApiPaginatedFindingList] {.async.} =
  ## List all security findings that have been identified as being problematic.
  ## This will return a list of findings regardless if they have been ignored or not.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  for v in direction: q["direction"] = $v
  q["ignored"] = $ignored
  q["integration_id"] = $integrationId
  q["max_affliction_date"] = $maxAfflictionDate
  q["min_affliction_date"] = $minAfflictionDate
  for v in observation: q["observation"] = $v
  for v in order: q["order"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  for v in product: q["product"] = $v
  q["search"] = $search
  for v in severity: q["severity"] = $v
  for v in `type`: q["type"] = $v
  q["vendor"] = $vendor
  q["finding_type_ids"] = $findingTypeIds
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/findings", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedFindingList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsIgnore*(client: CloudflareClient,
                                                             accountId: string,
                                                             body: types.PostureApiFindingBulkActionRequest): Future[types.PostureApiFindingResponse] {.async.} =
  ## Given a list of findings, mark as ignored. Does nothing if Finding is already
  ## ignored.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/ignore", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsUnignore*(client: CloudflareClient,
                                                               accountId: string,
                                                               body: types.PostureApiFindingBulkActionRequest): Future[types.PostureApiFindingResponse] {.async.} =
  ## Ability to un-ignore a Finding if it's previously been ignored. Does nothing if
  ## the Finding is not ignored.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/unignore", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureFindingsFindingId*(client: CloudflareClient,
                                                               accountId: string,
                                                               findingId: string): Future[types.PostureApiFindingResponse] {.async.} =
  ## Gets a security Finding that has been identified as being problematic.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureFindingsFindingIdInstances*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        archived: bool = default(bool),
                                                                        findingId: string,
                                                                        cursor: string = default(string),
                                                                        direction: set[FindingDirectionOption] = {},
                                                                        maxAfflictionDate: string = default(string),
                                                                        minAfflictionDate: string = default(string),
                                                                        order: set[FindingOrderOption] = {},
                                                                        page: int64 = default(int64),
                                                                        perPage: int64 = default(int64),
                                                                        search: string = default(string),
                                                                        remediationStatuses: seq[string] = default(seq[string]),
                                                                        findingInstanceIds: seq[string] = @[],
                                                                        assetIds: seq[string] = @[]): Future[types.PostureApiPaginatedFindingInstanceList] {.async.} =
  ## Lists all security finding instances for a given security finding.

  var q = initOrderedTable[string, string]()
  q["archived"] = $archived
  q["cursor"] = $cursor
  for v in direction: q["direction"] = $v
  q["max_affliction_date"] = $maxAfflictionDate
  q["min_affliction_date"] = $minAfflictionDate
  for v in order: q["order"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["remediation_statuses"] = $remediationStatuses
  for v in findingInstanceIds: q["finding_instance_ids"] = $v
  for v in assetIds: q["asset_ids"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedFindingInstanceList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesArchive*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                findingId: string,
                                                                                body: types.PostureApiFindingInstanceBulkActionRequest): Future[types.PostureApiFindingInstanceResponse] {.async.} =
  ## Archive one or more finding instances.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/instances/archive", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingInstanceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesUnarchive*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  findingId: string,
                                                                                  body: types.PostureApiFindingInstanceBulkActionRequest): Future[types.PostureApiFindingInstanceResponse] {.async.} =
  ## Remove the archive marking from one or more finding instances.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/instances/unarchive", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingInstanceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesInstanceId*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  findingId: string,
                                                                                  instanceId: string): Future[types.PostureApiFindingInstanceResponse] {.async.} =
  ## Gets a security Finding instance by id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/instances/{instanceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingInstanceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsFindingIdResetFindingSeverity*(client: CloudflareClient,
                                                                                    accountId: string,
                                                                                    findingId: string): Future[types.PostureApiFindingResponse] {.async.} =
  ## If a Finding's severity has been changed, reset it back to default value.
  ## Does nothing if no override exists.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/reset_finding_severity")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingsFindingIdTuneFindingSeverity*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   findingId: string,
                                                                                   body: types.PostureApiTuneFindingSeverityRequest): Future[types.PostureApiFindingResponse] {.async.} =
  ## Update the severity of a Finding.
  ## This will update the `severity_override` field on the Finding payload with the
  ## new severity value.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/findings/{findingId}/tune_finding_severity", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingResponse)
  else:
    raise newException(CloudflareClientError, body)
