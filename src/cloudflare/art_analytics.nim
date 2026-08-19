# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdAnalyticsQueryDatasetSummary*(client: CloudflareClient,
                                                        accountId: string,
                                                        dataset: string,
                                                        body: types.ArtQuerySummary): Future[types.ArtSummaryResponse] {.async.} =
  ## Returns aggregate summary stats for a dataset. Includes current-period and
  ## previous-period totals for trend comparison.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/{dataset}/summary", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAnalyticsQueryDatasetTimeseries*(client: CloudflareClient,
                                                           accountId: string,
                                                           dataset: string,
                                                           body: types.ArtQueryTimeseries): Future[types.ArtTimeseriesResponse] {.async.} =
  ## Returns time-bucketed analytics data for a dataset. Includes time slots, each
  ## containing the requested stats, group-by dimensions, and resolution-controlled
  ## bucket size (e.g. `hour`, `day`).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/{dataset}/timeseries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAnalyticsQueryDatasetTopN*(client: CloudflareClient,
                                                     accountId: string,
                                                     dataset: string,
                                                     body: types.ArtQueryTopN): Future[types.ArtTopNResponse] {.async.} =
  ## Returns the top N results for a dataset by a specified stat. Includes an array
  ## of result rows, each containing the requested stats and group-by dimensions.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/analytics/query/{dataset}/top-n", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArtTopNResponse)
  else:
    raise newException(CloudflareClientError, body)
