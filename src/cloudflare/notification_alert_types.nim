# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAlertingV3AvailableAlerts*(client: CloudflareClient,
                                                    accountId: types.AaaAccountId): Future[types.AaaAlertsResponseCollection] {.async.} =
  ## Gets a list of all alert types for which an account is eligible.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/available_alerts")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaAlertsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
