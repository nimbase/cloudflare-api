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
  GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse* = object
    data: JsonNode
    success: bool

proc getAccountsAccountIdRealtimeKitAppIdAnalyticsDaywise*(client: CloudflareClient,
                                                           accountId: types.RealtimekitAccountIdentifier,
                                                           appId: types.RealtimekitAppId,
                                                           startDate: string = default(string),
                                                           endDate: string = default(string)): Future[GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse] {.async.} =
  ## Returns day-wise session and recording analytics data of an App for the
  ## specified time range start_date to end_date. If start_date and end_date are not
  ## provided, the default time range is set from 30 days ago to the current date.

  var q = initOrderedTable[string, string]()
  q["start_date"] = $startDate
  q["end_date"] = $endDate
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/analytics/daywise", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdAnalyticsDaywiseResponse)
  else:
    raise newException(CloudflareClientError, body)
