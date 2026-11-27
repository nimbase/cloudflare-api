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
  ZeroTrustRiskScoringOrderByOption* = enum
    orderByLastEvent = "last_event"
    orderByEventCount = "event_count"
    orderByMaxRiskLevel = "max_risk_level"

  ZeroTrustRiskScoringDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdZtRiskScoringBehaviors*(client: CloudflareClient,
                                                 accountId: string): Future[types.RiskScoringBehaviorsResponse] {.async.} =
  ## Gets all risk behaviors for an account and their configuration. The response
  ## omits a disabled
  ## behavior when the account does not have the gates or entitlements for that
  ## behavior.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringBehaviorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZtRiskScoringBehaviors*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: types.RiskScoringUpdateBehaviors): Future[types.RiskScoringBehaviorsResponse] {.async.} =
  ## Updates the configuration of one or more risk behaviors for an account. The
  ## server skips an
  ## unknown behavior, and a behavior that the account does not have the gates or
  ## entitlements for.
  ## The response contains all behaviors for the account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringBehaviorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringBehaviorsHighDlp*(client: CloudflareClient,
                                                        accountId: string): Future[types.RiskScoringHighDlpBehaviorResponse] {.async.} =
  ## Gets the high_dlp risk behavior and its DLP configuration. Returns 404 when the
  ## behavior is
  ## disabled and the account does not have the gates or entitlements for it.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors/high_dlp")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringHighDlpBehaviorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZtRiskScoringBehaviorsHighDlp*(client: CloudflareClient,
                                                        accountId: string,
                                                        body: types.RiskScoringUpdateHighDlpBehavior): Future[types.RiskScoringHighDlpBehaviorResponse] {.async.} =
  ## Updates the high_dlp risk behavior and its DLP configuration. Returns 404 when
  ## the account does
  ## not have the gates or entitlements for the behavior.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors/high_dlp", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringHighDlpBehaviorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringBehaviorsBehaviorId*(client: CloudflareClient,
                                                           accountId: string,
                                                           behaviorId: BehaviorId): Future[types.RiskScoringBehaviorResponse] {.async.} =
  ## Gets one risk behavior that has no additional configuration. Returns 404 when
  ## the behavior is
  ## disabled and the account does not have the gates or entitlements for it.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors/{behaviorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringBehaviorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZtRiskScoringBehaviorsBehaviorId*(client: CloudflareClient,
                                                           accountId: string,
                                                           behaviorId: BehaviorId,
                                                           body: types.RiskScoringUpdateBehavior): Future[types.RiskScoringBehaviorResponse] {.async.} =
  ## Updates one risk behavior that has no additional configuration. Returns 404 when
  ## the account
  ## does not have the gates or entitlements for the behavior.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors/{behaviorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringBehaviorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringSummary*(client: CloudflareClient,
                                               accountId: string,
                                               page: int64 = 1,
                                               perPage: int64 = 25,
                                               orderBy: ZeroTrustRiskScoringOrderByOption = orderByLastEvent,
                                               direction: ZeroTrustRiskScoringDirectionOption = directionDesc): Future[types.RiskScoringRiskSummaryResponse] {.async.} =
  ## Gets the users in an account that have risk events, with the highest risk level,
  ## the event
  ## count, and the time of the last event for each user. The server reads risk
  ## events from at most
  ## 180 days before the current time, and after the last reset of each user.
  ## Returns 404 when the request reaches a server outside of the configured region
  ## of the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringRiskSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringUserId*(client: CloudflareClient,
                                              accountId: string, userId: string,
                                              timestampBetween: string = default(string),
                                              timeZone: string = default(string),
                                              page: int64 = 1,
                                              perPage: int64 = 25,
                                              orderBy: ZeroTrustRiskScoringOrderByOption = orderByLastEvent,
                                              direction: ZeroTrustRiskScoringDirectionOption = directionDesc): Future[types.RiskScoringRiskEventsResponse] {.async.} =
  ## Gets the risk level, the last reset time, and the risk events of one user. The
  ## server reads
  ## risk events from at most 180 days before the current time, and after the last
  ## reset of the user.
  ## Returns 404 when the request reaches a server outside of the configured region
  ## of the account.

  var q = initOrderedTable[string, string]()
  q["timestamp.between"] = $timestampBetween
  q["time_zone"] = $timeZone
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/{userId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringRiskEventsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringUserIdEventClusters*(client: CloudflareClient,
                                                           accountId: string,
                                                           userId: string,
                                                           timestampBetween: string = default(string),
                                                           timeZone: string = "UTC",
                                                           page: int64 = 1,
                                                           perPage: int64 = 10): Future[types.RiskScoringRiskEventClustersResponse] {.async.} =
  ## Lists the risk events of one user, grouped by calendar day in the requested time
  ## zone. Each
  ## cluster contains at most 25 events, oldest first. The time range is at most 30
  ## days. The server
  ## reads risk events from at most 180 days before the current time.
  ## Returns 404 when the request reaches a server outside of the configured region
  ## of the account.

  var q = initOrderedTable[string, string]()
  q["timestamp.between"] = $timestampBetween
  q["time_zone"] = $timeZone
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/{userId}/event_clusters", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringRiskEventClustersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdZtRiskScoringUserIdReset*(client: CloudflareClient,
                                                    accountId: string,
                                                    userId: string): Future[types.RiskScoringEmptyResponse] {.async.} =
  ## Resets the risk score of one user. Risk events before the reset do not count
  ## toward the score
  ## of the user.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/zt_risk_scoring/{userId}/reset")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RiskScoringEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
