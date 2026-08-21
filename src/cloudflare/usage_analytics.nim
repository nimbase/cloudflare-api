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
  UsageAnalyticTimeDeltaOption* = enum
    timeDeltaHour = "hour"
    timeDeltaDay = "day"
    timeDeltaWeek = "week"
    timeDeltaMonth = "month"
    timeDeltaQuarter = "quarter"
    timeDeltaYear = "year"


proc getAccountsAccountIdBillingUsage*(client: CloudflareClient,
                                       accountId: types.UsageAnalyticsIdentifier,
                                       metrics: string = default(string),
                                       since: string = default(string),
                                       until: string = default(string),
                                       timeDelta: UsageAnalyticTimeDeltaOption = timeDeltaHour,
                                       limit: int64 = 100,
                                       filters: string = default(string)): Future[types.UsageAnalyticsBillingUsageResponse] {.async.} =
  ## Retrieve billing usage analytics for an account. Returns time-series data for
  ## all billable product metrics including Stream, Media (Images), Rate Limiting,
  ## Load Balancing, Argo, Workers, Workers KV, Image Resizing, and Spectrum.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  q["limit"] = $limit
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.UsageAnalyticsBillingUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMediaUsage*(client: CloudflareClient,
                                     accountId: types.UsageAnalyticsIdentifier,
                                     metrics: string = default(string),
                                     since: string = default(string),
                                     until: string = default(string),
                                     timeDelta: UsageAnalyticTimeDeltaOption = timeDeltaHour,
                                     limit: int64 = 100,
                                     filters: string = default(string)): Future[types.UsageAnalyticsStreamUsageResponse] {.async.} =
  ## Retrieve Media usage analytics for an account. This endpoint shares the same
  ## backend handler as the Stream usage endpoint and returns identical Stream
  ## metrics (streamMinutesViewed). The gateway rewrites this path to the shared
  ## usage handler.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  q["limit"] = $limit
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/media/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.UsageAnalyticsStreamUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamUsage*(client: CloudflareClient,
                                      accountId: types.UsageAnalyticsIdentifier,
                                      metrics: string = default(string),
                                      since: string = default(string),
                                      until: string = default(string),
                                      timeDelta: UsageAnalyticTimeDeltaOption = timeDeltaHour,
                                      limit: int64 = 100,
                                      filters: string = default(string)): Future[types.UsageAnalyticsStreamUsageResponse] {.async.} =
  ## Retrieve Stream usage analytics for an account. Returns time-series data for
  ## Stream billable minutes viewed across all zones in the account. The gateway
  ## rewrites this path before forwarding to the backend usage handler.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  q["limit"] = $limit
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.UsageAnalyticsStreamUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdMediaUsage*(client: CloudflareClient,
                               zoneId: types.UsageAnalyticsIdentifier,
                               metrics: string = default(string),
                               since: string = default(string),
                               until: string = default(string),
                               timeDelta: UsageAnalyticTimeDeltaOption = timeDeltaHour,
                               limit: int64 = 100,
                               filters: string = default(string)): Future[types.UsageAnalyticsStreamUsageResponse] {.async.} =
  ## Retrieve Media usage analytics for a zone. This endpoint shares the same backend
  ## handler as the Stream usage endpoint and returns identical Stream metrics
  ## (streamMinutesViewed). The gateway resolves the zone to its owning account and
  ## rewrites this path to the shared usage handler.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  q["limit"] = $limit
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/zones/{zoneId}/media/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.UsageAnalyticsStreamUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdStreamUsage*(client: CloudflareClient,
                                zoneId: types.UsageAnalyticsIdentifier,
                                metrics: string = default(string),
                                since: string = default(string),
                                until: string = default(string),
                                timeDelta: UsageAnalyticTimeDeltaOption = timeDeltaHour,
                                limit: int64 = 100,
                                filters: string = default(string)): Future[types.UsageAnalyticsStreamUsageResponse] {.async.} =
  ## Retrieve Stream usage analytics for a zone. Returns time-series data for Stream
  ## billable minutes viewed. The gateway resolves the zone to its owning account and
  ## rewrites this path before forwarding to the backend usage handler.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  q["limit"] = $limit
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/zones/{zoneId}/stream/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.UsageAnalyticsStreamUsageResponse)
  else:
    raise newException(CloudflareClientError, body)
