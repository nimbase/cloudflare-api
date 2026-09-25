# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseUsageStats*(client: CloudflareClient,
                                              accountId: string, since: string,
                                              until: string, page: int64 = 1,
                                              perPage: int64 = 100): Future[types.PayPerCrawlPPUUsageStatsResponse] {.async.} =
  ## Returns reported usage and the full gross value across all Pay Per Use zones in
  ## a publisher account over an explicit UTC range of at most 31 days. Usage from
  ## every domain and snapshotted price is summed by buyer. Ranges up to and
  ## including 7 days use hourly data points; longer ranges use daily data points.
  ## Because source data is aggregated hourly, both requested bounds are rounded down
  ## to the selected UTC interval and the resolved bounds are returned in the
  ## response. The resolved range must contain at least one complete interval. Empty
  ## periods are omitted. Buyers and their data points are paginated, while totals
  ## cover every buyer in the range. Values are raw usage counts and USD microcents;
  ## total_price_usd_microcents is the full value before the publisher revenue share.

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/usage-stats", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUUsageStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerUseUsageStats*(client: CloudflareClient, zoneId: string,
                                        since: string, until: string,
                                        page: int64 = 1, perPage: int64 = 100): Future[types.PayPerCrawlPPUUsageStatsResponse] {.async.} =
  ## Returns reported usage and the full gross value for one Pay Per Use zone over an
  ## explicit UTC range of at most 31 days. Usage from every snapshotted price is
  ## summed by buyer. Ranges up to and including 7 days use hourly data points;
  ## longer ranges use daily data points. Because source data is aggregated hourly,
  ## both requested bounds are rounded down to the selected UTC interval and the
  ## resolved bounds are returned in the response. The resolved range must contain at
  ## least one complete interval. Empty periods are omitted. Buyers and their data
  ## points are paginated, while totals cover every buyer in the range. Values are
  ## raw usage counts and USD microcents; total_price_usd_microcents is the full
  ## value before the publisher revenue share.

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-use/usage-stats", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUUsageStatsResponse)
  else:
    raise newException(CloudflareClientError, body)
