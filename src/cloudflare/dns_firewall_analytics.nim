# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDnsFirewallDnsFirewallIdDnsAnalyticsReport*(client: CloudflareClient,
                                                                     dnsFirewallId: types.DnsAnalyticsIdentifier,
                                                                     accountId: types.DnsAnalyticsIdentifier,
                                                                     metrics: types.DnsAnalyticsMetrics = default(types.DnsAnalyticsMetrics),
                                                                     dimensions: types.DnsAnalyticsDimensions = default(types.DnsAnalyticsDimensions),
                                                                     since: types.DnsAnalyticsSince = default(types.DnsAnalyticsSince),
                                                                     until: types.DnsAnalyticsUntil = default(types.DnsAnalyticsUntil),
                                                                     limit: types.DnsAnalyticsLimit = default(types.DnsAnalyticsLimit),
                                                                     sort: types.DnsAnalyticsSort = default(types.DnsAnalyticsSort),
                                                                     filters: types.DnsAnalyticsFilters = default(types.DnsAnalyticsFilters)): Future[JsonNode] {.async.} =
  ## Retrieves a list of summarised aggregate metrics over a given time period.
  ##
  ## See [Analytics APIproperties](https://developers.cloudflare.com/dns/reference/a
  ## nalytics-api-properties/) for detailed information about the available query
  ## parameters.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["dimensions"] = $dimensions
  q["since"] = $since
  q["until"] = $until
  q["limit"] = $limit
  q["sort"] = $sort
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}/dns_analytics/report", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDnsFirewallDnsFirewallIdDnsAnalyticsReportBytime*(client: CloudflareClient,
                                                                           dnsFirewallId: types.DnsAnalyticsIdentifier,
                                                                           accountId: types.DnsAnalyticsIdentifier,
                                                                           metrics: types.DnsAnalyticsMetrics = default(types.DnsAnalyticsMetrics),
                                                                           dimensions: types.DnsAnalyticsDimensions = default(types.DnsAnalyticsDimensions),
                                                                           since: types.DnsAnalyticsSince = default(types.DnsAnalyticsSince),
                                                                           until: types.DnsAnalyticsUntil = default(types.DnsAnalyticsUntil),
                                                                           limit: types.DnsAnalyticsLimit = default(types.DnsAnalyticsLimit),
                                                                           sort: types.DnsAnalyticsSort = default(types.DnsAnalyticsSort),
                                                                           filters: types.DnsAnalyticsFilters = default(types.DnsAnalyticsFilters),
                                                                           timeDelta: types.DnsAnalyticsTimeDelta = default(types.DnsAnalyticsTimeDelta)): Future[JsonNode] {.async.} =
  ## Retrieves a list of aggregate metrics grouped by time interval.
  ##
  ## See [Analytics APIproperties](https://developers.cloudflare.com/dns/reference/a
  ## nalytics-api-properties/) for detailed information about the available query
  ## parameters.

  var q = initOrderedTable[string, string]()
  q["metrics"] = $metrics
  q["dimensions"] = $dimensions
  q["since"] = $since
  q["until"] = $until
  q["limit"] = $limit
  q["sort"] = $sort
  q["filters"] = $filters
  q["time_delta"] = $timeDelta
  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}/dns_analytics/report/bytime", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
