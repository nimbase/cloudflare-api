# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdZtRiskScoringBehaviors*(client: CloudflareClient,
                                                 accountId: string): Future[JsonNode] {.async.} =
  ## Retrieves configured risk score behaviors that define how user actions affect
  ## their overall risk score.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZtRiskScoringBehaviors*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: types.DlpUpdateBehaviors): Future[JsonNode] {.async.} =
  ## Updates risk score behavior configurations, defining weights and thresholds for
  ## risk calculation.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zt_risk_scoring/behaviors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringSummary*(client: CloudflareClient,
                                               accountId: string): Future[JsonNode] {.async.} =
  ## Gets an aggregate summary of risk scores across the account, including
  ## distribution and trends.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/summary")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringUserId*(client: CloudflareClient,
                                              accountId: string, userId: string): Future[JsonNode] {.async.} =
  ## Retrieves the detailed risk score breakdown for a specific user, including
  ## contributing factors.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/{userId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdZtRiskScoringUserIdReset*(client: CloudflareClient,
                                                    accountId: string,
                                                    userId: string): Future[JsonNode] {.async.} =
  ## Resets risk scores for specified users, clearing their accumulated risk history.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/zt_risk_scoring/{userId}/reset")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
