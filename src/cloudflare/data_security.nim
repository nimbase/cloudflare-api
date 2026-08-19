# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdAnalyticsQueryDataSecurityContentFindingsTopN*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         body: types.ArtDataSecurityContentFindingsTopNQuery): Future[types.ArtTopNResponse] {.async.} =
  ## Returns the top N integrations ranked by total content findings.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/data-security/content-findings/top-n", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtTopNResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAnalyticsQueryDataSecurityFindingsSummary*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     body: types.ArtDataSecurityFindingsSummaryQuery): Future[types.ArtSummaryResponse] {.async.} =
  ## Returns aggregate current-period and previous-period totals for CASB findings.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/data-security/findings/summary", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAnalyticsQueryDataSecurityFindingsTimeseries*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        body: types.ArtDataSecurityFindingsTimeseriesQuery): Future[types.ArtDataSecurityFindingsTimeseriesResponse] {.async.} =
  ## Returns merged time-bucketed CASB findings.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/data-security/findings/timeseries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtDataSecurityFindingsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)
