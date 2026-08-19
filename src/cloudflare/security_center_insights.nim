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
  PutAccountsAccountIdIntelAttackSurfaceReportIssuesIssueIdDismissRequest = object
    dismiss: Option[bool]
  PutAccountsAccountIdSecurityCenterInsightsIssueIdDismissRequest = object
    dismiss: Option[bool]
  PutZonesZoneIdSecurityCenterInsightsIssueIdDismissRequest = object
    dismiss: Option[bool]

proc getAccountsAccountIdIntelAttackSurfaceReportIssueTypes*(client: CloudflareClient,
                                                             accountId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Lists all available issue types in Security Center, describing categories of
  ## security issues.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/attack-surface-report/issue-types")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelAttackSurfaceReportIssues*(client: CloudflareClient,
                                                         accountId: types.SecurityCenterIdentifier,
                                                         dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                         issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                         issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                         product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                         severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                         subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                         issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                         issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                         productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                         severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                         subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                         page: JsonNode = default(JsonNode),
                                                         perPage: JsonNode = default(JsonNode)): Future[JsonNode] {.async.} =
  ## Lists all Security Center issues for the account, showing active security
  ## problems requiring attention.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/attack-surface-report/issues", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelAttackSurfaceReportIssuesClass*(client: CloudflareClient,
                                                              accountId: types.SecurityCenterIdentifier,
                                                              dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                              issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                              issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                              product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                              severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                              subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                              issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                              issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                              productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                              severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                              subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center issue counts aggregated by classification class.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/attack-surface-report/issues/class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelAttackSurfaceReportIssuesSeverity*(client: CloudflareClient,
                                                                 accountId: types.SecurityCenterIdentifier,
                                                                 dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                                 issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                                 issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                                 product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                                 severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                                 subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                                 issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                                 issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                                 productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                                 severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                                 subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center issue counts aggregated by severity level.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/attack-surface-report/issues/severity", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelAttackSurfaceReportIssuesType*(client: CloudflareClient,
                                                             accountId: types.SecurityCenterIdentifier,
                                                             dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                             issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                             issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                             product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                             severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                             subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                             issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                             issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                             productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                             severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                             subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center issue counts aggregated by issue type.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/attack-surface-report/issues/type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelAttackSurfaceReportIssuesIssueIdDismiss*(client: CloudflareClient,
                                                                       accountId: types.SecurityCenterIdentifier,
                                                                       issueId: string,
                                                                       body: PutAccountsAccountIdIntelAttackSurfaceReportIssuesIssueIdDismissRequest): Future[JsonNode] {.async.} =
  ## Deprecated endpoint for archiving Security Center insights. Use the newer
  ## archive-security-center-insight endpoint instead.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/attack-surface-report/issues/{issueId}/dismiss", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsights*(client: CloudflareClient,
                                                 accountId: types.SecurityCenterIdentifier,
                                                 dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                 issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                 issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                 product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                 severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                 subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                 issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                 issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                 productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                 severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                 subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                 page: JsonNode = default(JsonNode),
                                                 perPage: JsonNode = default(JsonNode)): Future[JsonNode] {.async.} =
  ## Lists all Security Center insights for the account, showing security findings
  ## and recommendations.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsightsClass*(client: CloudflareClient,
                                                      accountId: types.SecurityCenterIdentifier,
                                                      dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                      issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                      issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                      product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                      severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                      subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                      issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                      issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                      productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                      severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                      subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center insight counts aggregated by classification class.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsightsSeverity*(client: CloudflareClient,
                                                         accountId: types.SecurityCenterIdentifier,
                                                         dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                         issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                         issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                         product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                         severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                         subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                         issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                         issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                         productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                         severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                         subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center insight counts aggregated by severity level (critical,
  ## high, medium, low).

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/severity", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsightsType*(client: CloudflareClient,
                                                     accountId: types.SecurityCenterIdentifier,
                                                     dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                     issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                     issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                     product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                     severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                     subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                     issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                     issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                     productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                     severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                     subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves Security Center insight counts aggregated by insight type.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdSecurityCenterInsightsIssueIdClassification*(client: CloudflareClient,
                                                                        accountId: types.SecurityCenterIdentifier,
                                                                        issueId: string,
                                                                        body: types.SecurityCenterUserClassificationUpdate): Future[JsonNode] {.async.} =
  ## Updates the user classification for a Security Center insight. Valid values are
  ## 'false_positive' or 'accept_risk'. To reset, set classification to null. Cannot
  ## change directly between classification values - must reset to null first.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/security-center/insights/{issueId}/classification", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterInsightsIssueIdContext*(client: CloudflareClient,
                                                               accountId: types.SecurityCenterIdentifier,
                                                               issueId: string): Future[JsonNode] {.async.} =
  ## Returns the full context payload for an insight. This endpoint is used for
  ## insights with large payloads that are not included inline in the list response.

  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/{issueId}/context")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSecurityCenterInsightsIssueIdDismiss*(client: CloudflareClient,
                                                               accountId: types.SecurityCenterIdentifier,
                                                               issueId: string,
                                                               body: PutAccountsAccountIdSecurityCenterInsightsIssueIdDismissRequest): Future[JsonNode] {.async.} =
  ## Archives a Security Center insight for an account, removing it from the active
  ## insights list while preserving historical data.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/security-center/insights/{issueId}/dismiss", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterState*(client: CloudflareClient,
                                              accountId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Returns account-level Security Center state: whether scans are enabled for the
  ## account and whether the account was recently reactivated from a dormant state.

  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/state")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSecurityCenterState*(client: CloudflareClient,
                                              accountId: types.SecurityCenterIdentifier,
                                              body: types.SecurityCenterUpdateAccountStateRequest): Future[JsonNode] {.async.} =
  ## Updates account-level Security Center state. Currently supports enabling or
  ## disabling scans for the account. Returns the account's state after the update.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/security-center/state", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsights*(client: CloudflareClient,
                                           zoneId: types.SecurityCenterIdentifier,
                                           dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                           issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                           issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                           product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                           severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                           subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                           issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                           issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                           productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                           severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                           subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                           page: JsonNode = default(JsonNode),
                                           perPage: JsonNode = default(JsonNode)): Future[JsonNode] {.async.} =
  ## Lists Security Center insights for a specific zone, showing zone-level security
  ## findings.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsClass*(client: CloudflareClient,
                                                zoneId: types.SecurityCenterIdentifier,
                                                dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves zone-specific Security Center insight counts aggregated by
  ## classification class.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsSeverity*(client: CloudflareClient,
                                                   zoneId: types.SecurityCenterIdentifier,
                                                   dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                                   issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                   issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                   product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                   severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                   subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                                   issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                                   issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                                   productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                                   severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                                   subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves zone-specific Security Center insight counts aggregated by severity
  ## level.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/severity", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsType*(client: CloudflareClient,
                                               zoneId: types.SecurityCenterIdentifier,
                                               dismissed: types.SecurityCenterDismissed = default(types.SecurityCenterDismissed),
                                               issueClass: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                               issueType: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                               product: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                               severity: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                               subject: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects),
                                               issueClassNeq: types.SecurityCenterIssueClasses = default(types.SecurityCenterIssueClasses),
                                               issueTypeNeq: types.SecurityCenterIssueTypes = default(types.SecurityCenterIssueTypes),
                                               productNeq: types.SecurityCenterProducts = default(types.SecurityCenterProducts),
                                               severityNeq: types.SecurityCenterSeverityQueryParam = default(types.SecurityCenterSeverityQueryParam),
                                               subjectNeq: types.SecurityCenterSubjects = default(types.SecurityCenterSubjects)): Future[types.SecurityCenterValueCountsResponse] {.async.} =
  ## Retrieves zone-specific Security Center insight counts aggregated by insight
  ## type.

  var q = initOrderedTable[string, string]()
  q["dismissed"] = $dismissed
  q["issue_class"] = $issueClass
  q["issue_type"] = $issueType
  q["product"] = $product
  q["severity"] = $severity
  q["subject"] = $subject
  q["issue_class~neq"] = $issueClassNeq
  q["issue_type~neq"] = $issueTypeNeq
  q["product~neq"] = $productNeq
  q["severity~neq"] = $severityNeq
  q["subject~neq"] = $subjectNeq
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterValueCountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSecurityCenterInsightsIssueIdClassification*(client: CloudflareClient,
                                                                  zoneId: types.SecurityCenterIdentifier,
                                                                  issueId: string,
                                                                  body: types.SecurityCenterUserClassificationUpdate): Future[JsonNode] {.async.} =
  ## Updates the user classification for a zone-specific Security Center insight.
  ## Valid values are 'false_positive' or 'accept_risk'. To reset, set classification
  ## to null. Cannot change directly between classification values - must reset to
  ## null first.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/security-center/insights/{issueId}/classification", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSecurityCenterInsightsIssueIdDismiss*(client: CloudflareClient,
                                                         zoneId: types.SecurityCenterIdentifier,
                                                         issueId: string,
                                                         body: PutZonesZoneIdSecurityCenterInsightsIssueIdDismissRequest): Future[JsonNode] {.async.} =
  ## Archives a zone-specific Security Center insight, removing it from the active
  ## zone insights while preserving historical data.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/security-center/insights/{issueId}/dismiss", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
