# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDataSecurityPostureFindingTypes*(client: CloudflareClient,
                                                          accountId: string,
                                                          page: int64 = default(int64),
                                                          perPage: int64 = default(int64),
                                                          vendors: seq[string] = @[],
                                                          search: string = default(string)): Future[types.PostureApiPaginatedFindingTypeList] {.async.} =
  ## List all available finding types with pagination support.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in vendors: q["vendors"] = $v
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/finding_types", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedFindingTypeList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       findingTypeId: string): Future[types.PostureApiFindingTypeResponse] {.async.} =
  ## Retrieve a specific finding type by its unique identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/finding_types/{findingTypeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiFindingTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeIdRemediationTypes*(client: CloudflareClient,
                                                                                       accountId: string,
                                                                                       findingTypeId: string,
                                                                                       integrationId: string = default(string),
                                                                                       cursor: string = default(string),
                                                                                       page: int64 = default(int64),
                                                                                       perPage: int64 = default(int64)): Future[types.PostureApiPaginatedRemediationTypeList] {.async.} =
  ## List all remediation types for a given finding type.
  ## This endpoint supports both cursor and offset pagination.
  ## Note that `cursor` and `page` are mutually exclusive.

  var q = initOrderedTable[string, string]()
  q["integration_id"] = $integrationId
  q["cursor"] = $cursor
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/finding_types/{findingTypeId}/remediation_types", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedRemediationTypeList)
  else:
    raise newException(CloudflareClientError, body)
