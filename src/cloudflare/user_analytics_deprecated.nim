# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getUserAnalyticsDashboard*(client: CloudflareClient,
                                since: types.ZoneAnalyticsApiSince = default(types.ZoneAnalyticsApiSince),
                                until: types.ZoneAnalyticsApiUntil = default(types.ZoneAnalyticsApiUntil),
                                continuous: bool = true): Future[types.ZoneAnalyticsApiUserDashboardResponse] {.async.} =
  ## The user analytics dashboard provides totals and timeseries data aggregated
  ## across all zones owned by the authenticated user for the given time period.
  ## Only zones for which the user has the `#analytics:read` permission are included.
  ##
  ## This endpoint is deprecated. Please use the GraphQL Analytics API instead:
  ## https://developers.cloudflare.com/analytics/graphql-api/

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["continuous"] = $continuous
  let res = await client.httpGET("/user/analytics/dashboard", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZoneAnalyticsApiUserDashboardResponse)
  else:
    raise newException(CloudflareClientError, body)
