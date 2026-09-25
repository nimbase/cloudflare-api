# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdPayPerUseUsageReports*(client: CloudflareClient,
                                                 accountId: string): Future[types.PayPerCrawlUsageReportCreatedResponse] {.async.} =
  ## Validates and submits a usage report for an active Pay Per Use participant. The
  ## complete report is rejected if any item is invalid.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-use/usage-reports")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlUsageReportCreatedResponse)
  else:
    raise newException(CloudflareClientError, body)
