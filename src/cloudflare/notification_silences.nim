# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAlertingV3Silences*(client: CloudflareClient,
                                             accountId: types.AaaAccountId): Future[types.AaaSilencesComponentsSchemasResponseCollection] {.async.} =
  ## Gets a list of silences for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/silences")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSilencesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3Silences*(client: CloudflareClient,
                                              accountId: types.AaaAccountId): Future[types.AaaApiResponseCommon2] {.async.} =
  ## Creates a new silence for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/silences", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAlertingV3Silences*(client: CloudflareClient,
                                             accountId: types.AaaAccountId): Future[types.AaaSilencesComponentsSchemasResponseCollection] {.async.} =
  ## Updates existing silences for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/alerting/v3/silences", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSilencesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAlertingV3SilencesSilenceId*(client: CloudflareClient,
                                                      accountId: types.AaaAccountId,
                                                      silenceId: types.AaaSilenceId): Future[types.AaaSilenceComponentsSchemasResponseCollection] {.async.} =
  ## Gets a specific silence for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/silences/{silenceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSilenceComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAlertingV3SilencesSilenceId*(client: CloudflareClient,
                                                         accountId: types.AaaAccountId,
                                                         silenceId: types.AaaSilenceId): Future[types.AaaApiResponseCommon2] {.async.} =
  ## Deletes an existing silence for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/alerting/v3/silences/{silenceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)
