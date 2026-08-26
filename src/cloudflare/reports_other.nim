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
  GetAccountsAccountIdReportingIndustryResponse* = object
    errors: seq[types.ReportsError]
    messages: seq[types.ReportsMessage]
    result: types.ReportsAccountIndustrySingleResponse
    success: bool
  PatchAccountsAccountIdReportingIndustryResponse* = object
    errors: seq[types.ReportsError]
    messages: seq[types.ReportsMessage]
    result: types.ReportsAccountIndustryPatchResponse
    success: bool

proc getAccountsAccountIdReportingIndustry*(client: CloudflareClient,
                                            accountId: string): Future[GetAccountsAccountIdReportingIndustryResponse] {.async.} =
  ## Gets the industry classification for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/reporting/industry")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdReportingIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdReportingIndustry*(client: CloudflareClient,
                                              accountId: string,
                                              body: types.ReportsPatchAccountIndustryBody): Future[PatchAccountsAccountIdReportingIndustryResponse] {.async.} =
  ## Updates the industry classification for an account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/reporting/industry", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdReportingIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReportingPolicies*(client: CloudflareClient,
                                            accountId: string): Future[types.ReportsPoliciesListResponse] {.async.} =
  ## Lists all reporting policies for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/reporting/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ReportsPoliciesListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReportingPoliciesPolicyId*(client: CloudflareClient,
                                                    policyId: string,
                                                    accountId: string): Future[types.ReportsPolicySingleResponse] {.async.} =
  ## Gets a reporting policy by identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/reporting/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ReportsPolicySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReportingReports*(client: CloudflareClient,
                                           accountId: string): Future[types.ReportsReportsListResponse] {.async.} =
  ## Lists all generated reports for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/reporting/reports")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ReportsReportsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReportingReportsReportId*(client: CloudflareClient,
                                                   accountId: string,
                                                   reportId: string): Future[types.ReportsReportSingleResponse] {.async.} =
  ## Gets a generated report by identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/reporting/reports/{reportId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ReportsReportSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
