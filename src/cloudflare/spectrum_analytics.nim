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
  SpectrumAnalyticTimeDeltaOption* = enum
    timeDeltaYear = "year"
    timeDeltaQuarter = "quarter"
    timeDeltaMonth = "month"
    timeDeltaWeek = "week"
    timeDeltaDay = "day"
    timeDeltaHour = "hour"
    timeDeltaDekaminute = "dekaminute"
    timeDeltaMinute = "minute"


proc getUserSpectrumAnalyticsZonesReport*(client: CloudflareClient,
                                          since: types.SpectrumAnalyticsSince = default(types.SpectrumAnalyticsSince),
                                          until: types.SpectrumAnalyticsUntil = default(types.SpectrumAnalyticsUntil),
                                          cdnTraffic: bool = true): Future[types.SpectrumAnalyticsZonesReportResponse] {.async.} =
  ## Retrieves a list of total bandwidth by zone over a given time period.

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["cdn_traffic"] = $cdnTraffic
  let res = await client.httpGET("/user/spectrum_analytics/zones/report", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumAnalyticsZonesReportResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpectrumAnalyticsAggregateCurrent*(client: CloudflareClient,
                                                      zoneId: types.SpectrumAnalyticsIdentifier,
                                                      appID: types.SpectrumAnalyticsAppIdParam = default(types.SpectrumAnalyticsAppIdParam),
                                                      coloName: string = default(string)): Future[types.SpectrumAnalyticsQueryResponseAggregate] {.async.} =
  ## Retrieves analytics aggregated from the last minute of usage on Spectrum
  ## applications underneath a given zone.

  var q = initOrderedTable[string, string]()
  q["appID"] = $appID
  q["colo_name"] = $coloName
  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/analytics/aggregate/current", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumAnalyticsQueryResponseAggregate)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpectrumAnalyticsEventsBytime*(client: CloudflareClient,
                                                  zoneId: types.SpectrumAnalyticsIdentifier,
                                                  dimensions: types.SpectrumAnalyticsDimensions = default(types.SpectrumAnalyticsDimensions),
                                                  sort: types.SpectrumAnalyticsSort = default(types.SpectrumAnalyticsSort),
                                                  until: types.SpectrumAnalyticsUntil = default(types.SpectrumAnalyticsUntil),
                                                  metrics: types.SpectrumAnalyticsMetrics = default(types.SpectrumAnalyticsMetrics),
                                                  filters: types.SpectrumAnalyticsFilters = default(types.SpectrumAnalyticsFilters),
                                                  since: types.SpectrumAnalyticsSince = default(types.SpectrumAnalyticsSince),
                                                  timeDelta: SpectrumAnalyticTimeDeltaOption): Future[types.SpectrumAnalyticsQueryResponseSingle] {.async.} =
  ## Retrieves a list of aggregate metrics grouped by time interval.

  var q = initOrderedTable[string, string]()
  q["dimensions"] = $dimensions
  q["sort"] = $sort
  q["until"] = $until
  q["metrics"] = $metrics
  q["filters"] = $filters
  q["since"] = $since
  q["time_delta"] = $timeDelta
  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/analytics/events/bytime", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumAnalyticsQueryResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpectrumAnalyticsEventsSummary*(client: CloudflareClient,
                                                   zoneId: types.SpectrumAnalyticsIdentifier,
                                                   dimensions: types.SpectrumAnalyticsDimensions = default(types.SpectrumAnalyticsDimensions),
                                                   sort: types.SpectrumAnalyticsSort = default(types.SpectrumAnalyticsSort),
                                                   until: types.SpectrumAnalyticsUntil = default(types.SpectrumAnalyticsUntil),
                                                   metrics: types.SpectrumAnalyticsMetrics = default(types.SpectrumAnalyticsMetrics),
                                                   filters: types.SpectrumAnalyticsFilters = default(types.SpectrumAnalyticsFilters),
                                                   since: types.SpectrumAnalyticsSince = default(types.SpectrumAnalyticsSince)): Future[types.SpectrumAnalyticsQueryResponseSingle] {.async.} =
  ## Retrieves a list of summarised aggregate metrics over a given time period.

  var q = initOrderedTable[string, string]()
  q["dimensions"] = $dimensions
  q["sort"] = $sort
  q["until"] = $until
  q["metrics"] = $metrics
  q["filters"] = $filters
  q["since"] = $since
  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/analytics/events/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumAnalyticsQueryResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
