# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdWorkersObservabilityIssuesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdWorkersObservabilityIssuesAutomationsRequest = object
    after_inactivity_seconds: Option[int64]
    after_occurrences: Option[int64]
    enabled: Option[bool]
    name: Option[string]
    policy_id: string
    service: Option[string]
  PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdRequest = object
    after_inactivity_seconds: Option[int64]
    after_occurrences: Option[int64]
    enabled: Option[bool]
    name: Option[string]
    policy_id: string
    service: Option[string]
  PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdRequest = object
    status: string
  PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsRequest = object
    policy_id: Option[string]
  PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityIssueOccurrence]
    result_info: JsonNode
    success: bool
  IssueOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"

  IssueOrderByOption* = enum
    orderById = "id"
    orderByService = "service"
    orderByFingerprint = "fingerprint"
    orderByTitle = "title"
    orderByType = "type"
    orderByStatus = "status"
    orderByStatusUpdated = "statusUpdated"
    orderByCount = "count"
    orderByFirstObserved = "firstObserved"
    orderByLastObserved = "lastObserved"
    orderByCreated = "created"
    orderByUpdated = "updated"

  IssueStatusOption* = enum
    statusActive = "active"
    statusResolved = "resolved"
    statusIgnored = "ignored"


proc getAccountsAccountIdWorkersObservabilityIssues*(client: CloudflareClient,
                                                     page: int64 = default(int64),
                                                     perPage: int64 = default(int64),
                                                     order: IssueOrderOption = orderAsc,
                                                     orderBy: IssueOrderByOption = orderById,
                                                     search: string = default(string),
                                                     service: string = default(string),
                                                     status: IssueStatusOption = statusActive): Future[GetAccountsAccountIdWorkersObservabilityIssuesResponse] {.async.} =
  ## List detected issues.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["perPage"] = $perPage
  q["order"] = $order
  q["orderBy"] = $orderBy
  q["search"] = $search
  q["service"] = $service
  q["status"] = $status
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/issues", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityIssuesAutomations*(client: CloudflareClient,
                                                                service: string = default(string)): Future[GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse] {.async.} =
  ## List account and service issue automations.

  var q = initOrderedTable[string, string]()
  q["service"] = $service
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/issues/automations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityIssuesAutomations*(client: CloudflareClient,
                                                                 body: PostAccountsAccountIdWorkersObservabilityIssuesAutomationsRequest): Future[PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse] {.async.} =
  ## Create an account or service issue automation.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/issues/automations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityIssuesAutomationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationId*(client: CloudflareClient,
                                                                            automationId: string): Future[GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse] {.async.} =
  ## Retrieve an issue automation.

  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/issues/automations/{automationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationId*(client: CloudflareClient,
                                                                            automationId: string,
                                                                            body: PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdRequest): Future[PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse] {.async.} =
  ## Replace an issue automation configuration.

  let res = await client.httpPUT(fmt"/accounts/{account_id}/workers/observability/issues/automations/{automationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationId*(client: CloudflareClient,
                                                                               automationId: string): Future[DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse] {.async.} =
  ## Delete an issue automation while preserving its historical runs.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/workers/observability/issues/automations/{automationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkersObservabilityIssuesAutomationsAutomationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityIssuesSummary*(client: CloudflareClient,
                                                            service: string = default(string)): Future[GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse] {.async.} =
  ## Retrieve aggregate issue counts for the account.

  var q = initOrderedTable[string, string]()
  q["service"] = $service
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/issues/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityIssuesIssueId*(client: CloudflareClient,
                                                            issueId: string): Future[GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse] {.async.} =
  ## Retrieve an issue.

  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/issues/{issueId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersObservabilityIssuesIssueId*(client: CloudflareClient,
                                                              issueId: string,
                                                              body: PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdRequest): Future[PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse] {.async.} =
  ## Modify an issue status.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/workers/observability/issues/{issueId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkersObservabilityIssuesIssueIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRuns*(client: CloudflareClient,
                                                                             issueId: string,
                                                                             body: PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsRequest): Future[PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse] {.async.} =
  ## Send the issue to one ANS policy, or every matching Real-Time Issue policy when
  ## no policy ID is provided.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/workers/observability/issues/{issueId}/notification-runs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityIssuesIssueIdNotificationRunsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrences*(client: CloudflareClient,
                                                                       issueId: string,
                                                                       cursor: string = default(string),
                                                                       perPage: int64 = default(int64)): Future[GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse] {.async.} =
  ## List the retained error occurrences grouped into an issue, newest first.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/issues/{issueId}/occurrences", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityIssuesIssueIdOccurrencesResponse)
  else:
    raise newException(CloudflareClientError, body)
