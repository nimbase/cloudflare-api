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
  SecurityCenterAuditLogFieldChangedOption* = enum
    fieldChangedStatus = "status"
    fieldChangedUserClassification = "user_classification"

  SecurityCenterAuditLogOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc getAccountsAccountIdSecurityCenterInsightsAuditLog*(client: CloudflareClient,
                                                         accountId: types.SecurityCenterIdentifier,
                                                         perPage: int64 = 25,
                                                         cursor: string = default(string),
                                                         fieldChanged: set[SecurityCenterAuditLogFieldChangedOption] = {},
                                                         changedBy: string = default(string),
                                                         since: string = default(string),
                                                         before: string = default(string),
                                                         order: string = "desc"): Future[types.SecurityCenterAuditLogResponse] {.async.} =
  ## Lists audit log entries for all Security Center insights in the account, showing
  ## changes to insight status and classification.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  for v in fieldChanged: q["field_changed"] = $v
  q["changed_by"] = $changedBy
  q["since"] = $since
  q["before"] = $before
  for v in order: q["order"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/audit-log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterAuditLogResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsightsIssueIdAuditLog*(client: CloudflareClient,
                                                                accountId: types.SecurityCenterIdentifier,
                                                                issueId: string,
                                                                perPage: int64 = 25,
                                                                cursor: string = default(string),
                                                                fieldChanged: set[SecurityCenterAuditLogFieldChangedOption] = {},
                                                                changedBy: string = default(string),
                                                                since: string = default(string),
                                                                before: string = default(string),
                                                                order: string = "desc"): Future[types.SecurityCenterAuditLogResponse] {.async.} =
  ## Lists audit log entries for a specific Security Center insight, showing changes
  ## to its status and classification over time.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  for v in fieldChanged: q["field_changed"] = $v
  q["changed_by"] = $changedBy
  q["since"] = $since
  q["before"] = $before
  for v in order: q["order"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/{issueId}/audit-log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterAuditLogResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsAuditLog*(client: CloudflareClient,
                                                   zoneId: types.SecurityCenterIdentifier,
                                                   perPage: int64 = 25,
                                                   cursor: string = default(string),
                                                   fieldChanged: set[SecurityCenterAuditLogFieldChangedOption] = {},
                                                   changedBy: string = default(string),
                                                   since: string = default(string),
                                                   before: string = default(string),
                                                   order: string = "desc"): Future[types.SecurityCenterAuditLogResponse] {.async.} =
  ## Lists audit log entries for all Security Center insights in a specific zone,
  ## showing changes to insight status and classification.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  for v in fieldChanged: q["field_changed"] = $v
  q["changed_by"] = $changedBy
  q["since"] = $since
  q["before"] = $before
  for v in order: q["order"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/audit-log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterAuditLogResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsIssueIdAuditLog*(client: CloudflareClient,
                                                          zoneId: types.SecurityCenterIdentifier,
                                                          issueId: string,
                                                          perPage: int64 = 25,
                                                          cursor: string = default(string),
                                                          fieldChanged: set[SecurityCenterAuditLogFieldChangedOption] = {},
                                                          changedBy: string = default(string),
                                                          since: string = default(string),
                                                          before: string = default(string),
                                                          order: string = "desc"): Future[types.SecurityCenterAuditLogResponse] {.async.} =
  ## Lists audit log entries for a specific Security Center insight within a zone,
  ## showing changes to its status and classification over time.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  for v in fieldChanged: q["field_changed"] = $v
  q["changed_by"] = $changedBy
  q["since"] = $since
  q["before"] = $before
  for v in order: q["order"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/{issueId}/audit-log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterAuditLogResponse)
  else:
    raise newException(CloudflareClientError, body)
