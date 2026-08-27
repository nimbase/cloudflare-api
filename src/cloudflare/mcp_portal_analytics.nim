# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse* = object
    result: JsonNode
    success: bool
  McpPortalAnalyticGranularityOption* = enum
    granularityDaily = "daily"
    granularityMonthly = "monthly"

  McpPortalAnalyticAggregateOption* = enum
    aggregateTrue = "true"
    aggregateFalse = "false"


proc getAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseries*(client: CloudflareClient,
                                                                                         accountId: string,
                                                                                         portalId: string,
                                                                                         granularity: McpPortalAnalyticGranularityOption = granularityDaily,
                                                                                         aggregate: McpPortalAnalyticAggregateOption = aggregateFalse,
                                                                                         tz: string = "utc",
                                                                                         days: int64 = default(int64)): Future[GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse] {.async.} =
  ## Returns daily or monthly tool-call counts for a portal.

  var q = initOrderedTable[string, string]()
  q["granularity"] = $granularity
  q["aggregate"] = $aggregate
  q["tz"] = $tz
  q["days"] = $days
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/analytics/portals/{portalId}/tool-calls/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpAnalyticsPortalsPortalIdToolCallsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseries*(client: CloudflareClient,
                                                                                         accountId: string,
                                                                                         serverId: string,
                                                                                         granularity: McpPortalAnalyticGranularityOption = granularityDaily,
                                                                                         aggregate: McpPortalAnalyticAggregateOption = aggregateFalse,
                                                                                         tz: string = "utc",
                                                                                         days: int64 = default(int64)): Future[GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse] {.async.} =
  ## Returns daily or monthly tool-call counts for a server.

  var q = initOrderedTable[string, string]()
  q["granularity"] = $granularity
  q["aggregate"] = $aggregate
  q["tz"] = $tz
  q["days"] = $days
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/analytics/servers/{serverId}/tool-calls/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpAnalyticsServersServerIdToolCallsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseries*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          granularity: McpPortalAnalyticGranularityOption = granularityDaily,
                                                                          aggregate: McpPortalAnalyticAggregateOption = aggregateFalse,
                                                                          tz: string = "utc",
                                                                          days: int64 = default(int64)): Future[GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse] {.async.} =
  ## Returns daily or monthly tool-call counts across the account.

  var q = initOrderedTable[string, string]()
  q["granularity"] = $granularity
  q["aggregate"] = $aggregate
  q["tz"] = $tz
  q["days"] = $days
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/analytics/tool-calls/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpAnalyticsToolCallsTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)
