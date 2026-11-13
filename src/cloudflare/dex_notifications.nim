# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  DexNotificationScopeOption* = enum
    scopeAccount = "account"
    scopeDevice = "device"

  DexNotificationStatusOption* = enum
    statusPending = "pending"
    statusSent = "sent"
    statusFailed = "failed"

  DexNotificationOutcomeOption* = enum
    outcomeDelivered = "delivered"
    outcomeFailed = "failed"
    outcomeExpired = "expired"


proc getAccountsAccountIdDexNotifications*(client: CloudflareClient,
                                           accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                           page: int64 = 1, perPage: int64 = 10,
                                           search: string = default(string),
                                           `from`: types.DigitalExperienceMonitoringTimestampDatetime = default(types.DigitalExperienceMonitoringTimestampDatetime),
                                           to: types.DigitalExperienceMonitoringTimestampDatetime = default(types.DigitalExperienceMonitoringTimestampDatetime),
                                           scope: DexNotificationScopeOption = scopeAccount,
                                           status: DexNotificationStatusOption = statusPending): Future[JsonNode] {.async.} =
  ## Lists notification sendouts created for an account within the 31-day history
  ## retention period.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["from"] = $`from`
  q["to"] = $to
  q["scope"] = $scope
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/notifications", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDexNotifications*(client: CloudflareClient,
                                            accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                            body: types.DigitalExperienceMonitoringCreateNotificationRequest): Future[JsonNode] {.async.} =
  ## Creates an account-wide notification or a notification for selected device
  ## registrations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dex/notifications", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexNotificationsNotificationIdOutcomes*(client: CloudflareClient,
                                                                 accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                                 notificationId: types.DigitalExperienceMonitoringUuid,
                                                                 perPage: int64 = 50,
                                                                 cursor: string = default(string),
                                                                 outcome: DexNotificationOutcomeOption = outcomeDelivered): Future[JsonNode] {.async.} =
  ## Lists observed device outcomes for a notification sendout. Sampling may omit
  ## outcomes; each result includes its sampling interval.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["outcome"] = $outcome
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/notifications/{notificationId}/outcomes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
