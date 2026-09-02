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
  GetAccountsAccountIdAbuseReportsResponse* = object
    errors: seq[types.AbuseReportsMessage]
    messages: seq[types.AbuseReportsMessage]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse* = object
    errors: seq[types.AbuseReportsMessage]
    messages: seq[types.AbuseReportsMessage]
    result: types.AbuseReportsAppealEligibility
    success: bool
  GetAccountsAccountIdAbuseReportsReportIdEmailsResponse* = object
    errors: seq[types.AbuseReportsMessage]
    messages: seq[types.AbuseReportsMessage]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse* = object
    errors: seq[types.AbuseReportsMessage]
    messages: seq[types.AbuseReportsMessage]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAbuseReportsReportParamResponse* = object
    errors: seq[types.AbuseReportsErrorMessage]
    messages: seq[types.AbuseReportsMessage]
    result: types.AbuseReportsAbuseReport
    success: bool
  TsengAbuseComplaintProcessorOtherSortOption* = enum
    sortTypeAsc = "type,asc"
    sortTypeDesc = "type,desc"
    sortEffectiveDateAsc = "effective_date,asc"
    sortEffectiveDateDesc = "effective_date,desc"
    sortStatusAsc = "status,asc"
    sortStatusDesc = "status,desc"
    sortEntityTypeAsc = "entity_type,asc"
    sortEntityTypeDesc = "entity_type,desc"


proc getAccountsAccountIdAbuseReports*(client: CloudflareClient,
                                       accountId: string,
                                       page: int64 = default(int64),
                                       perPage: int64 = default(int64),
                                       sort: string = default(string),
                                       domain: string = default(string),
                                       createdBefore: string = default(string),
                                       createdAfter: string = default(string),
                                       status: types.AbuseReportsReportStatus = default(types.AbuseReportsReportStatus),
                                       `type`: types.AbuseReportsReportType = default(types.AbuseReportsReportType),
                                       mitigationStatus: types.AbuseReportsMitigationStatus = default(types.AbuseReportsMitigationStatus)): Future[GetAccountsAccountIdAbuseReportsResponse] {.async.} =
  ## List the abuse reports for a given account

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["sort"] = $sort
  q["domain"] = $domain
  q["created_before"] = $createdBefore
  q["created_after"] = $createdAfter
  q["status"] = $status
  q["type"] = $`type`
  q["mitigation_status"] = $mitigationStatus
  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAbuseReportsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsSubmitted*(client: CloudflareClient,
                                                accountId: string,
                                                page: int64 = 1,
                                                perPage: int64 = 100,
                                                sort: string = default(string),
                                                id: string = default(string),
                                                domain: seq[string] = @[],
                                                createdBefore: string = default(string),
                                                createdAfter: string = default(string),
                                                status: seq[string] = @[],
                                                `type`: seq[string] = @[]): Future[types.AbuseReportsSubmittedAbuseReportListResponse] {.async.} =
  ## List abuse reports submitted by the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["sort"] = $sort
  q["id"] = $id
  for v in domain: q["domain"] = $v
  q["created_before"] = $createdBefore
  q["created_after"] = $createdAfter
  for v in status: q["status"] = $v
  for v in `type`: q["type"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/submitted", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AbuseReportsSubmittedAbuseReportListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsSubmittedReportId*(client: CloudflareClient,
                                                        accountId: string,
                                                        reportId: string): Future[types.AbuseReportsSubmittedAbuseReportDetailResponse] {.async.} =
  ## Retrieve a report submitted by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/submitted/{reportId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AbuseReportsSubmittedAbuseReportDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsSubmittedReportIdEmails*(client: CloudflareClient,
                                                              accountId: string,
                                                              reportId: string,
                                                              page: int64 = default(int64),
                                                              perPage: int64 = default(int64)): Future[types.AbuseReportsEmailListResponse] {.async.} =
  ## List successful emails sent to the submitter of a report submitted by the
  ## account. Does not include emails sent to customers or hosts.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/submitted/{reportId}/emails", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AbuseReportsEmailListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsReportIdAppealsEligibility*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 reportId: string): Future[GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse] {.async.} =
  ## Returns whether the report is currently appealable, along with the signals
  ## behind that decision: whether it already has an open appeal, how many appeals
  ## have been submitted against it, and whether it has at least one mitigation that
  ## an appeal could reverse.

  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/{reportId}/appeals/eligibility")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsReportIdEmails*(client: CloudflareClient,
                                                     accountId: string,
                                                     reportId: string,
                                                     page: int64 = default(int64),
                                                     perPage: int64 = default(int64)): Future[GetAccountsAccountIdAbuseReportsReportIdEmailsResponse] {.async.} =
  ## List emails sent to the customer for an abuse report. Returns all successful
  ## customer emails sent for the specified abuse report. Does not include emails
  ## sent to hosts or submitters.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/{reportId}/emails", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAbuseReportsReportIdEmailsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsReportIdMitigations*(client: CloudflareClient,
                                                          accountId: string,
                                                          reportId: string,
                                                          page: int64 = default(int64),
                                                          perPage: int64 = default(int64),
                                                          sort: TsengAbuseComplaintProcessorOtherSortOption,
                                                          `type`: types.AbuseReportsMitigationType = default(types.AbuseReportsMitigationType),
                                                          effectiveBefore: string = default(string),
                                                          effectiveAfter: string = default(string),
                                                          status: types.AbuseReportsMitigationStatus = default(types.AbuseReportsMitigationStatus),
                                                          entityType: types.AbuseReportsMitigatedEntityType = default(types.AbuseReportsMitigatedEntityType)): Future[GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse] {.async.} =
  ## List mitigations done to remediate the abuse report.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["sort"] = $sort
  q["type"] = $`type`
  q["effective_before"] = $effectiveBefore
  q["effective_after"] = $effectiveAfter
  q["status"] = $status
  q["entity_type"] = $entityType
  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/{reportId}/mitigations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAbuseReportsReportIdMitigationsAppeal*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 reportId: string,
                                                                 body: types.AbuseReportsMitigationAppealRequest): Future[types.AbuseReportsMitigationAppealResult] {.async.} =
  ## Request a review for mitigations on an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/abuse-reports/{reportId}/mitigations/appeal", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AbuseReportsMitigationAppealResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAbuseReportsReportParam*(client: CloudflareClient,
                                                  accountId: string,
                                                  reportParam: string): Future[GetAccountsAccountIdAbuseReportsReportParamResponse] {.async.} =
  ## Retrieve the details of an abuse report.

  let res = await client.httpGET(fmt"/accounts/{accountId}/abuse-reports/{reportParam}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAbuseReportsReportParamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAbuseReportsReportParam*(client: CloudflareClient,
                                                   accountId: string,
                                                   reportParam: types.AbuseReportsSubmissionReportType,
                                                   body: types.AbuseReportsSubmitReportRequest): Future[types.AbuseReportsSubmitReportResponse] {.async.} =
  ## Submit an abuse report of a particular type.
  ##
  ## Requires the abuse-reports entitlement on the account (Enterprise
  ## accounts have it by default; other accounts must request access) and an
  ## API token with the `Account > Abuse Reports > Edit` permission. If the
  ## account is not entitled, the request is rejected with an HTTP `401`
  ## response (see below).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/abuse-reports/{reportParam}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AbuseReportsSubmitReportResponse)
  else:
    raise newException(CloudflareClientError, body)
