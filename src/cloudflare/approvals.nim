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
  ApprovalLatestOnlyOption* = enum
    latestOnlyTrue = "true"
    latestOnlyFalse = "false"

  ApprovalReviewerScopeOption* = enum
    reviewerScopeDefault = "default"
    reviewerScopeEmail = "email"
    reviewerScopeUnresolved = "unresolved"

  ApprovalChangeTypeOption* = enum
    changeTypeCreate = "create"
    changeTypeUpdate = "update"
    changeTypeDelete = "delete"


proc getAccountsAccountIdCloudforceOneRulesApprovals*(client: CloudflareClient,
                                                      accountId: string,
                                                      status: JsonNode = default(JsonNode),
                                                      latestOnly: string = "false",
                                                      limit: float64 = default(float64),
                                                      offset: float64 = default(float64),
                                                      reviewerScope: set[ApprovalReviewerScopeOption] = {},
                                                      changeType: set[ApprovalChangeTypeOption] = {}): Future[types.CloudforceOneRuleApprovalsListResponse] {.async.} =
  ## List rule approvals with optional status, revision, reviewer-scope, and
  ## mutation-type filtering.

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  for v in latestOnly: q["latest_only"] = $v
  q["limit"] = $limit
  q["offset"] = $offset
  for v in reviewerScope: q["reviewer_scope"] = $v
  for v in changeType: q["change_type"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/approvals", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRuleApprovalsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesApprovalsId*(client: CloudflareClient,
                                                        accountId: string,
                                                        id: string): Future[types.CloudforceOneRuleApprovalDetailResponse] {.async.} =
  ## Get a single rule approval with current rule data

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/approvals/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRuleApprovalDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesApprovalsIdResubmit*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 id: string,
                                                                 body: types.CloudforceOneResubmitApprovalRequest): Future[types.CloudforceOneResubmitApprovalResponse] {.async.} =
  ## Create a new pending revision from a rejected rule approval. Only the original
  ## requester may resubmit the latest revision.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/approvals/{id}/resubmit", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.CloudforceOneResubmitApprovalResponse)
  else:
    raise newException(CloudflareClientError, body)
