# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  AuditLogDirectionOption* = enum
    directionDesc = "desc"
    directionAsc = "asc"


proc getAccountsAccountIdAuditLogs*(client: CloudflareClient,
                                    accountId: types.AaaIdentifier,
                                    id: string = default(string),
                                    `export`: bool = default(bool),
                                    actionType: string = default(string),
                                    actorIp: string = default(string),
                                    actorEmail: string = default(string),
                                    since: JsonNode = default(JsonNode),
                                    before: JsonNode = default(JsonNode),
                                    zoneName: string = default(string),
                                    direction: string = "desc",
                                    perPage: float64 = default(float64),
                                    page: float64 = default(float64),
                                    hideUserLogs: bool = false): Future[types.AaaAuditLogsResponseCollection2] {.async.} =
  ## Gets a list of audit logs for an account. Can be filtered by who made the
  ## change, on which zone, and the timeframe of the change.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["export"] = $`export`
  q["action.type"] = $actionType
  q["actor.ip"] = $actorIp
  q["actor.email"] = $actorEmail
  q["since"] = $since
  q["before"] = $before
  q["zone.name"] = $zoneName
  for v in direction: q["direction"] = $v
  q["per_page"] = $perPage
  q["page"] = $page
  q["hide_user_logs"] = $hideUserLogs
  let res = await client.httpGET(fmt"/accounts/{accountId}/audit_logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsAudit*(client: CloudflareClient, accountId: string,
                                    accountName: seq[string] = @[],
                                    actionResult: seq[string] = default(seq[string]),
                                    actionType: seq[string] = default(seq[string]),
                                    actorContext: seq[string] = default(seq[string]),
                                    actorEmail: seq[string] = @[],
                                    actorId: seq[string] = @[],
                                    actorIpAddress: seq[string] = @[],
                                    actorTokenId: seq[string] = @[],
                                    actorTokenName: seq[string] = @[],
                                    actorType: seq[string] = default(seq[string]),
                                    auditLogId: seq[string] = @[],
                                    id: seq[string] = @[],
                                    rawCfRayId: seq[string] = @[],
                                    rawMethod: seq[string] = @[],
                                    rawStatusCode: seq[string] = @[],
                                    rawUri: seq[string] = @[],
                                    resourceId: seq[string] = @[],
                                    resourceProduct: seq[string] = @[],
                                    resourceType: seq[string] = @[],
                                    resourceScope: seq[string] = default(seq[string]),
                                    productCategory: seq[string] = @[],
                                    zoneId: seq[string] = @[],
                                    zoneName: seq[string] = @[],
                                    accountNameNot: seq[string] = @[],
                                    actionResultNot: seq[string] = default(seq[string]),
                                    actionTypeNot: seq[string] = default(seq[string]),
                                    actorContextNot: seq[string] = default(seq[string]),
                                    actorEmailNot: seq[string] = @[],
                                    actorIdNot: seq[string] = @[],
                                    actorIpAddressNot: seq[string] = @[],
                                    actorTokenIdNot: seq[string] = @[],
                                    actorTokenNameNot: seq[string] = @[],
                                    actorTypeNot: seq[string] = default(seq[string]),
                                    auditLogIdNot: seq[string] = @[],
                                    idNot: seq[string] = @[],
                                    rawCfRayIdNot: seq[string] = @[],
                                    rawMethodNot: seq[string] = @[],
                                    rawStatusCodeNot: seq[string] = @[],
                                    rawUriNot: seq[string] = @[],
                                    resourceIdNot: seq[string] = @[],
                                    resourceProductNot: seq[string] = @[],
                                    resourceTypeNot: seq[string] = @[],
                                    resourceScopeNot: seq[string] = default(seq[string]),
                                    zoneIdNot: seq[string] = @[],
                                    zoneNameNot: seq[string] = @[],
                                    since: string, before: string,
                                    direction: string = "desc",
                                    limit: float64 = default(float64),
                                    cursor: string = default(string)): Future[types.AaaAuditLogsV2ResponseCollection] {.async.} =
  ## Gets a list of audit logs for an account.

  var q = initOrderedTable[string, string]()
  for v in accountName: q["account_name"] = $v
  q["action_result"] = $actionResult
  q["action_type"] = $actionType
  q["actor_context"] = $actorContext
  for v in actorEmail: q["actor_email"] = $v
  for v in actorId: q["actor_id"] = $v
  for v in actorIpAddress: q["actor_ip_address"] = $v
  for v in actorTokenId: q["actor_token_id"] = $v
  for v in actorTokenName: q["actor_token_name"] = $v
  q["actor_type"] = $actorType
  for v in auditLogId: q["audit_log_id"] = $v
  for v in id: q["id"] = $v
  for v in rawCfRayId: q["raw_cf_ray_id"] = $v
  for v in rawMethod: q["raw_method"] = $v
  for v in rawStatusCode: q["raw_status_code"] = $v
  for v in rawUri: q["raw_uri"] = $v
  for v in resourceId: q["resource_id"] = $v
  for v in resourceProduct: q["resource_product"] = $v
  for v in resourceType: q["resource_type"] = $v
  q["resource_scope"] = $resourceScope
  for v in productCategory: q["product_category"] = $v
  for v in zoneId: q["zone_id"] = $v
  for v in zoneName: q["zone_name"] = $v
  for v in accountNameNot: q["account_name.not"] = $v
  q["action_result.not"] = $actionResultNot
  q["action_type.not"] = $actionTypeNot
  q["actor_context.not"] = $actorContextNot
  for v in actorEmailNot: q["actor_email.not"] = $v
  for v in actorIdNot: q["actor_id.not"] = $v
  for v in actorIpAddressNot: q["actor_ip_address.not"] = $v
  for v in actorTokenIdNot: q["actor_token_id.not"] = $v
  for v in actorTokenNameNot: q["actor_token_name.not"] = $v
  q["actor_type.not"] = $actorTypeNot
  for v in auditLogIdNot: q["audit_log_id.not"] = $v
  for v in idNot: q["id.not"] = $v
  for v in rawCfRayIdNot: q["raw_cf_ray_id.not"] = $v
  for v in rawMethodNot: q["raw_method.not"] = $v
  for v in rawStatusCodeNot: q["raw_status_code.not"] = $v
  for v in rawUriNot: q["raw_uri.not"] = $v
  for v in resourceIdNot: q["resource_id.not"] = $v
  for v in resourceProductNot: q["resource_product.not"] = $v
  for v in resourceTypeNot: q["resource_type.not"] = $v
  q["resource_scope.not"] = $resourceScopeNot
  for v in zoneIdNot: q["zone_id.not"] = $v
  for v in zoneNameNot: q["zone_name.not"] = $v
  q["since"] = $since
  q["before"] = $before
  for v in direction: q["direction"] = $v
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/audit", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsV2ResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsAuditProductCategories*(client: CloudflareClient,
                                                     accountId: string): Future[types.AaaAuditLogsV2ProductCategoriesResponseCollection] {.async.} =
  ## Lists the available audit log product categories and the resource products each
  ## one expands to. Use these values with the product_category filter on the account
  ## audit logs endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/audit/product_categories")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsV2ProductCategoriesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsAuditIdHistory*(client: CloudflareClient,
                                             accountId: string, id: string,
                                             actionTime: string, since: string,
                                             before: string,
                                             direction: string = "desc",
                                             limit: float64 = default(float64),
                                             cursor: string = default(string)): Future[types.AaaAuditLogsV2HistoryResponseCollection] {.async.} =
  ## Returns the chronological change history for the resource identified by the
  ## given audit log entry.
  ##
  ## The endpoint first locates the source audit log entry by `id` (using
  ## `action_time` to narrow the lookup window), derives identifying filters from
  ## that entry, and then returns matching audit logs within the `since`/`before`
  ## window.
  ##
  ## The `result_info.history_status` field indicates the quality of the resource
  ## identification used:
  ## - `exact`: Resource was identified by the resource URI.
  ## - `approximate`: Resource was identified without the resource URI.
  ## - `unavailable`: The source audit log entry did not contain enough information
  ## to identify the resource; an empty result is returned.

  var q = initOrderedTable[string, string]()
  q["action_time"] = $actionTime
  q["since"] = $since
  q["before"] = $before
  for v in direction: q["direction"] = $v
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/audit/{id}/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsV2HistoryResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdLogsAudit*(client: CloudflareClient,
                                              organizationId: string,
                                              actionResult: seq[string] = default(seq[string]),
                                              actionType: seq[string] = default(seq[string]),
                                              actorContext: seq[string] = default(seq[string]),
                                              actorEmail: seq[string] = @[],
                                              actorId: seq[string] = @[],
                                              actorIpAddress: seq[string] = @[],
                                              actorTokenId: seq[string] = @[],
                                              actorTokenName: seq[string] = @[],
                                              actorType: seq[string] = default(seq[string]),
                                              id: seq[string] = @[],
                                              rawCfRayId: seq[string] = @[],
                                              rawMethod: seq[string] = @[],
                                              rawStatusCode: seq[string] = @[],
                                              rawUri: seq[string] = @[],
                                              resourceId: seq[string] = @[],
                                              resourceProduct: seq[string] = @[],
                                              resourceType: seq[string] = @[],
                                              resourceScope: seq[string] = default(seq[string]),
                                              actionResultNot: seq[string] = default(seq[string]),
                                              actionTypeNot: seq[string] = default(seq[string]),
                                              actorContextNot: seq[string] = default(seq[string]),
                                              actorEmailNot: seq[string] = @[],
                                              actorIdNot: seq[string] = @[],
                                              actorIpAddressNot: seq[string] = @[],
                                              actorTokenIdNot: seq[string] = @[],
                                              actorTokenNameNot: seq[string] = @[],
                                              actorTypeNot: seq[string] = default(seq[string]),
                                              idNot: seq[string] = @[],
                                              rawCfRayIdNot: seq[string] = @[],
                                              rawMethodNot: seq[string] = @[],
                                              rawStatusCodeNot: seq[string] = @[],
                                              rawUriNot: seq[string] = @[],
                                              resourceIdNot: seq[string] = @[],
                                              resourceProductNot: seq[string] = @[],
                                              resourceTypeNot: seq[string] = @[],
                                              resourceScopeNot: seq[string] = default(seq[string]),
                                              since: string, before: string,
                                              direction: string = "desc",
                                              limit: float64 = default(float64),
                                              cursor: string = default(string)): Future[types.AaaAuditLogsV2OrgResponseCollection] {.async.} =
  ## Gets a list of audit logs for an organization.

  var q = initOrderedTable[string, string]()
  q["action_result"] = $actionResult
  q["action_type"] = $actionType
  q["actor_context"] = $actorContext
  for v in actorEmail: q["actor_email"] = $v
  for v in actorId: q["actor_id"] = $v
  for v in actorIpAddress: q["actor_ip_address"] = $v
  for v in actorTokenId: q["actor_token_id"] = $v
  for v in actorTokenName: q["actor_token_name"] = $v
  q["actor_type"] = $actorType
  for v in id: q["id"] = $v
  for v in rawCfRayId: q["raw_cf_ray_id"] = $v
  for v in rawMethod: q["raw_method"] = $v
  for v in rawStatusCode: q["raw_status_code"] = $v
  for v in rawUri: q["raw_uri"] = $v
  for v in resourceId: q["resource_id"] = $v
  for v in resourceProduct: q["resource_product"] = $v
  for v in resourceType: q["resource_type"] = $v
  q["resource_scope"] = $resourceScope
  q["action_result.not"] = $actionResultNot
  q["action_type.not"] = $actionTypeNot
  q["actor_context.not"] = $actorContextNot
  for v in actorEmailNot: q["actor_email.not"] = $v
  for v in actorIdNot: q["actor_id.not"] = $v
  for v in actorIpAddressNot: q["actor_ip_address.not"] = $v
  for v in actorTokenIdNot: q["actor_token_id.not"] = $v
  for v in actorTokenNameNot: q["actor_token_name.not"] = $v
  q["actor_type.not"] = $actorTypeNot
  for v in idNot: q["id.not"] = $v
  for v in rawCfRayIdNot: q["raw_cf_ray_id.not"] = $v
  for v in rawMethodNot: q["raw_method.not"] = $v
  for v in rawStatusCodeNot: q["raw_status_code.not"] = $v
  for v in rawUriNot: q["raw_uri.not"] = $v
  for v in resourceIdNot: q["resource_id.not"] = $v
  for v in resourceProductNot: q["resource_product.not"] = $v
  for v in resourceTypeNot: q["resource_type.not"] = $v
  q["resource_scope.not"] = $resourceScopeNot
  q["since"] = $since
  q["before"] = $before
  for v in direction: q["direction"] = $v
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/organizations/{organizationId}/logs/audit", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsV2OrgResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdLogsAuditIdHistory*(client: CloudflareClient,
                                                       organizationId: string,
                                                       id: string,
                                                       actionTime: string,
                                                       since: string,
                                                       before: string,
                                                       direction: string = "desc",
                                                       limit: float64 = default(float64),
                                                       cursor: string = default(string)): Future[types.AaaAuditLogsV2OrgHistoryResponseCollection] {.async.} =
  ## Returns the chronological change history for the resource identified by the
  ## given organization-scoped audit log entry.
  ##
  ## The endpoint first locates the source audit log entry by `id` (using
  ## `action_time` to narrow the lookup window), derives identifying filters from
  ## that entry, and then returns matching audit logs within the `since`/`before`
  ## window.
  ##
  ## The `result_info.history_status` field indicates the quality of the resource
  ## identification used:
  ## - `exact`: Resource was identified by the resource URI.
  ## - `approximate`: Resource was identified without the resource URI.
  ## - `unavailable`: The source audit log entry did not contain enough information
  ## to identify the resource; an empty result is returned.

  var q = initOrderedTable[string, string]()
  q["action_time"] = $actionTime
  q["since"] = $since
  q["before"] = $before
  for v in direction: q["direction"] = $v
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/organizations/{organizationId}/logs/audit/{id}/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsV2OrgHistoryResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getUserAuditLogs*(client: CloudflareClient, id: string = default(string),
                       `export`: bool = default(bool),
                       actionType: string = default(string),
                       actorIp: string = default(string),
                       actorEmail: string = default(string),
                       since: JsonNode = default(JsonNode),
                       before: JsonNode = default(JsonNode),
                       zoneName: string = default(string),
                       direction: string = "desc",
                       perPage: float64 = default(float64),
                       page: float64 = default(float64),
                       hideUserLogs: bool = false): Future[types.AaaAuditLogsResponseCollection2] {.async.} =
  ## Gets a list of audit logs for a user account. Can be filtered by who made the
  ## change, on which zone, and the timeframe of the change.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["export"] = $`export`
  q["action.type"] = $actionType
  q["actor.ip"] = $actorIp
  q["actor.email"] = $actorEmail
  q["since"] = $since
  q["before"] = $before
  q["zone.name"] = $zoneName
  for v in direction: q["direction"] = $v
  q["per_page"] = $perPage
  q["page"] = $page
  q["hide_user_logs"] = $hideUserLogs
  let res = await client.httpGET("/user/audit_logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAuditLogsResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)
