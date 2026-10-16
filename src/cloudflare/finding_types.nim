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
  FindingTypeOrderOption* = enum
    orderCreated = "created"
    orderUpdated = "updated"
    orderMatchCount = "match_count"
    orderName = "name"
    orderVendor = "vendor"
    orderType = "type"
    orderOrigin = "origin"
    orderSeverity = "severity"

  FindingTypeDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdDataSecurityPostureFindingTypes*(client: CloudflareClient,
                                                          accountId: string,
                                                          page: int64 = default(int64),
                                                          perPage: int64 = default(int64),
                                                          vendors: seq[string] = @[],
                                                          types: seq[string] = @[],
                                                          origins: seq[string] = @[],
                                                          severities: seq[string] = @[],
                                                          search: string = default(string),
                                                          quarantined: bool = default(bool),
                                                          minUpdatedAt: string = default(string),
                                                          maxUpdatedAt: string = default(string),
                                                          order: FindingTypeOrderOption = orderCreated,
                                                          direction: FindingTypeDirectionOption = directionAsc): Future[types.PostureApiPaginatedFindingTypeList] {.async.} =
  ## List all available finding types with pagination support.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in vendors: q["vendors"] = $v
  for v in types: q["types"] = $v
  for v in origins: q["origins"] = $v
  for v in severities: q["severities"] = $v
  q["search"] = $search
  q["quarantined"] = $quarantined
  q["min_updated_at"] = $minUpdatedAt
  q["max_updated_at"] = $maxUpdatedAt
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/finding_types", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedFindingTypeList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingTypes*(client: CloudflareClient,
                                                           accountId: string,
                                                           body: types.PostureApiCreateFindingTypeRequest): Future[types.PostureApiCustomFindingTypeSingleResponse] {.async.} =
  ## Create a new custom finding type with policy definition.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/finding_types", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.PostureApiCustomFindingTypeSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureFindingTypesValidate*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   body: types.PostureApiCreateFindingTypeRequest): Future[types.PostureApiValidateFindingTypeResponse] {.async.} =
  ## Check a candidate custom finding type without creating it, so problems can
  ## be corrected before publishing. The request body is the same shape as
  ## `CreateFindingType`, and the candidate is checked against the same rules, so
  ## a valid result means the definition itself is sound. It is not a reservation:
  ## a create can still be rejected for a reason that does not belong to the
  ## definition, such as the account already holding the maximum number of custom
  ## finding types.
  ##
  ## A candidate that fails validation is still a **200** with
  ## `result.valid: false` and one entry in `result.errors` per problem — that is
  ## the answer this endpoint exists to give. `4xx` is reserved for a request
  ## that could not be processed at all, such as a body that will not parse.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/finding_types/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiValidateFindingTypeResponse)
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

proc putAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       findingTypeId: string,
                                                                       body: types.PostureApiUpdateFindingTypeRequest): Future[types.PostureApiCustomFindingTypeSingleResponse] {.async.} =
  ## Update an existing custom finding type.
  ##
  ## **Immutable fields**: asset_vendor, asset_class, expression, and category cannot
  ## be changed after creation.
  ##
  ## **Security**: Only custom finding types (not system-managed) can be updated.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/data-security/posture/finding_types/{findingTypeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiCustomFindingTypeSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeId*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          findingTypeId: string): Future[AsyncResponse] {.async.} =
  ## Delete an existing custom finding type.
  ##
  ## **Security**: Only custom finding types (not system-managed) can be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/data-security/posture/finding_types/{findingTypeId}")
  return res

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
