# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAlertingV3DestinationsPagerduty*(client: CloudflareClient,
                                                          accountId: types.AaaAccountId): Future[types.AaaComponentsSchemasResponseCollection] {.async.} =
  ## Get a list of all configured PagerDuty services.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/destinations/pagerduty")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAlertingV3DestinationsPagerduty*(client: CloudflareClient,
                                                             accountId: types.AaaAccountId): Future[types.AaaApiResponseCommon2] {.async.} =
  ## Deletes all the PagerDuty Services connected to the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/alerting/v3/destinations/pagerduty")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3DestinationsPagerdutyConnect*(client: CloudflareClient,
                                                                  accountId: types.AaaAccountId): Future[types.AaaSensitiveIdResponse] {.async.} =
  ## Creates a new token for integrating with PagerDuty.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/destinations/pagerduty/connect")
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AaaSensitiveIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAlertingV3DestinationsPagerdutyConnectTokenId*(client: CloudflareClient,
                                                                        accountId: types.AaaAccountId,
                                                                        tokenId: types.AaaIntegrationToken): Future[types.AaaIdResponse] {.async.} =
  ## Links PagerDuty with the account using the integration token.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/destinations/pagerduty/connect/{tokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaIdResponse)
  else:
    raise newException(CloudflareClientError, body)
