# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessLogsScimUpdates*(client: CloudflareClient,
                                                accountId: types.AccessIdentifier,
                                                limit: types.AccessLimit = default(types.AccessLimit),
                                                direction: types.AccessDirection = default(types.AccessDirection),
                                                since: types.AccessSince = default(types.AccessSince),
                                                until: types.AccessUntil = default(types.AccessUntil),
                                                idpId: types.AccessIdpId,
                                                status: types.AccessStatus2 = default(types.AccessStatus2),
                                                resourceType: types.AccessResourceType = default(types.AccessResourceType),
                                                requestMethod: types.AccessRequestMethod = default(types.AccessRequestMethod),
                                                resourceUserEmail: types.AccessResourceUserEmail = default(types.AccessResourceUserEmail),
                                                resourceGroupName: types.AccessResourceGroupName = default(types.AccessResourceGroupName),
                                                cfResourceId: types.AccessCfResourceId3 = default(types.AccessCfResourceId3),
                                                idpResourceId: types.AccessIdpResourceId3 = default(types.AccessIdpResourceId3),
                                                page: int64 = 1,
                                                perPage: int64 = 20): Future[types.AccessScimUpdateLogsResponse] {.async.} =
  ## Lists Access SCIM update logs that maintain a record of updates made to User and
  ## Group resources synced to Cloudflare via the System for Cross-domain Identity
  ## Management (SCIM).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["direction"] = $direction
  q["since"] = $since
  q["until"] = $until
  q["idp_id"] = $idpId
  q["status"] = $status
  q["resource_type"] = $resourceType
  q["request_method"] = $requestMethod
  q["resource_user_email"] = $resourceUserEmail
  q["resource_group_name"] = $resourceGroupName
  q["cf_resource_id"] = $cfResourceId
  q["idp_resource_id"] = $idpResourceId
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/logs/scim/updates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUpdateLogsResponse)
  else:
    raise newException(CloudflareClientError, body)
