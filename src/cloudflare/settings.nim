# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCniSettings*(client: CloudflareClient,
                                      accountId: string): Future[types.NscSettings] {.async.} =
  ## Retrieves current settings configuration for the specified resource or service.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscSettings)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCniSettings*(client: CloudflareClient,
                                      accountId: string,
                                      body: types.NscSettingsRequest): Future[types.NscSettings] {.async.} =
  ## Updates configuration settings for the specified resource or service.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cni/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscSettings)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdNetworkqualitySettings*(client: CloudflareClient,
                                                 accountId: string): Future[types.NetworkqualitySettingsSuccess] {.async.} =
  ## Returns Network Quality Test settings for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/networkquality/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NetworkqualitySettingsSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdNetworkqualitySettings*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: types.NetworkqualitySettingsUpdate): Future[types.NetworkqualitySettingsSuccess] {.async.} =
  ## Updates Network Quality Test settings for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/networkquality/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NetworkqualitySettingsSuccess)
  else:
    raise newException(CloudflareClientError, body)
