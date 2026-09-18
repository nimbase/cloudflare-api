# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceRequest = object
    labels: Option[seq[string]]
    priority: Option[int64]
    requirement: string
    tlp: Option[string]
  PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsRequest = object
    dimension: string
    enabled: Option[bool]
    value: string
  PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsBacktestsRequest = object
    as_of: Option[string]
    backtest_days: Option[int64]
    candidate_limit: Option[int64]
    dataset_ids: Option[seq[string]]
    emerging_min_current_count: Option[int64]
    established_min_absolute_delta: Option[int64]
    established_min_prior_count: Option[int64]
    established_min_relative_delta: Option[float64]
    window_days: Option[int64]
  PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsEvaluationsRequest = object
    as_of: Option[string]
    candidate_limit: Option[int64]
    dataset_ids: Option[seq[string]]
    emerging_min_current_count: Option[int64]
    established_min_absolute_delta: Option[int64]
    established_min_prior_count: Option[int64]
    established_min_relative_delta: Option[float64]
    window_days: Option[int64]
  PatchAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsInterestIdRequest = object
    enabled: Option[bool]
    value: Option[string]
  PutAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdRequest = object
    labels: Option[seq[string]]
    priority: Option[int64]
    requirement: Option[string]
    tlp: Option[string]
  PriorityIntelligenceRequirementEnabledOption* = enum
    enabledTrue = "true"
    enabledFalse = "false"


proc getAccountsAccountIdCloudforceOneV2PriorityIntelligence*(client: CloudflareClient,
                                                              accountId: string,
                                                              page: int64 = 1,
                                                              perPage: int64 = 20): Future[AsyncResponse] {.async.} =
  ## Lists free-form Priority Intelligence Requirements for the account. Results are
  ## scoped to the authenticated account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence", q)
  return res

proc postAccountsAccountIdCloudforceOneV2PriorityIntelligence*(client: CloudflareClient,
                                                               accountId: string,
                                                               body: PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceRequest): Future[AsyncResponse] {.async.} =
  ## Creates a new PIR for the account. Subject to the account's annual PIR quota
  ## from the cfone.priority_intelligence_requirement_limit entitlement.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence", body)
  return res

proc getAccountsAccountIdCloudforceOneV2PriorityIntelligenceConstants*(client: CloudflareClient,
                                                                       accountId: string): Future[AsyncResponse] {.async.} =
  ## Requirements is the existing free-form PIR method. Interests is the experimental
  ## structured-interest method, evaluated independently from requirements.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/constants")
  return res

proc getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterests*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       page: int64 = 1,
                                                                       perPage: int64 = 20,
                                                                       enabled: PriorityIntelligenceRequirementEnabledOption = enabledTrue): Future[AsyncResponse] {.async.} =
  ## Lists structured account interests for Priority Intelligence Option 2. Filter by
  ## enabled state and paginate results.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["enabled"] = $enabled
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests", q)
  return res

proc postAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterests*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        body: PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsRequest): Future[AsyncResponse] {.async.} =
  ## Creates a structured account interest used by Priority Intelligence Option 2
  ## evaluations. Interests are evaluated independently from free-form PIR
  ## requirements.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests", body)
  return res

proc postAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsBacktests*(client: CloudflareClient,
                                                                                 accountId: string,
                                                                                 body: PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsBacktestsRequest): Future[AsyncResponse] {.async.} =
  ## Uses bounded full-span top-N candidates and daily event-date buckets. Results
  ## are conservative rather than an exact historical replay.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/backtests", body)
  return res

proc getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsBacktestsBacktestId*(client: CloudflareClient,
                                                                                          accountId: string,
                                                                                          backtestId: string): Future[AsyncResponse] {.async.} =
  ## Returns a previously completed account-interest backtest by ID. The backtest
  ## must belong to this account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/backtests/{backtestId}")
  return res

proc postAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsEvaluations*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   body: PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsEvaluationsRequest): Future[AsyncResponse] {.async.} =
  ## Compares the trailing event-date window with the preceding window. Results are
  ## precision-gated to enabled account interests. Late ingestion can cause an older
  ## event to appear in a later evaluation, so results describe changes in
  ## event-dated intelligence rather than exact adversary-activity timing.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/evaluations", body)
  return res

proc getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsEvaluationsEvaluationId*(client: CloudflareClient,
                                                                                              accountId: string,
                                                                                              evaluationId: string): Future[AsyncResponse] {.async.} =
  ## Returns a previously completed live account-interest evaluation by ID. The
  ## evaluation must belong to this account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/evaluations/{evaluationId}")
  return res

proc deleteAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsInterestId*(client: CloudflareClient,
                                                                                    accountId: string,
                                                                                    interestId: string): Future[AsyncResponse] {.async.} =
  ## Deletes a structured account interest so later Priority Intelligence Option 2
  ## evaluations no longer include it.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/{interestId}")
  return res

proc patchAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsInterestId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   interestId: string,
                                                                                   body: PatchAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsInterestIdRequest): Future[AsyncResponse] {.async.} =
  ## Updates a structured account interest used by Priority Intelligence Option 2
  ## evaluations. Changing the value re-resolves the interest against the current
  ## catalog.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/interests/{interestId}", body)
  return res

proc postAccountsAccountIdCloudforceOneV2PriorityIntelligenceQuota*(client: CloudflareClient,
                                                                    accountId: string): Future[AsyncResponse] {.async.} =
  ## Returns the account's annual PIR quota including total allowed, remaining, and
  ## anniversary dates.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/quota")
  return res

proc getAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityId*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        priorityId: string): Future[AsyncResponse] {.async.} =
  ## Returns a single free-form Priority Intelligence Requirement for the
  ## authenticated account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/{priorityId}")
  return res

proc putAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityId*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        priorityId: string,
                                                                        body: PutAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdRequest): Future[AsyncResponse] {.async.} =
  ## Updates a free-form Priority Intelligence Requirement for the authenticated
  ## account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/{priorityId}", body)
  return res

proc deleteAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityId*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           priorityId: string): Future[AsyncResponse] {.async.} =
  ## Soft-deletes a PIR. The PIR will no longer count against quota.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/priority-intelligence/{priorityId}")
  return res
