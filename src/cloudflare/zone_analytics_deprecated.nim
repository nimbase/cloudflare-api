# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdentifierAnalyticsColos*(client: CloudflareClient,
                                           zoneIdentifier: types.ZoneAnalyticsApiIdentifier,
                                           until: types.ZoneAnalyticsApiUntil = default(types.ZoneAnalyticsApiUntil),
                                           since: JsonNode = default(JsonNode),
                                           continuous: bool = true): Future[types.ZoneAnalyticsApiColoResponse] {.async.} =
  ## This view provides a breakdown of analytics data by datacenter. Note: This is
  ## available to Enterprise customers only.

  var q = initOrderedTable[string, string]()
  q["until"] = $until
  q["since"] = $since
  q["continuous"] = $continuous
  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/analytics/colos", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZoneAnalyticsApiColoResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdentifierAnalyticsDashboard*(client: CloudflareClient,
                                               zoneIdentifier: types.ZoneAnalyticsApiIdentifier,
                                               until: types.ZoneAnalyticsApiUntil = default(types.ZoneAnalyticsApiUntil),
                                               since: JsonNode = default(JsonNode),
                                               continuous: bool = true): Future[types.ZoneAnalyticsApiDashboardResponse] {.async.} =
  ## The dashboard view provides both totals and timeseries data for the given zone
  ## and time period across the entire Cloudflare network.

  var q = initOrderedTable[string, string]()
  q["until"] = $until
  q["since"] = $since
  q["continuous"] = $continuous
  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/analytics/dashboard", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZoneAnalyticsApiDashboardResponse)
  else:
    raise newException(CloudflareClientError, body)
