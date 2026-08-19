# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDevicesResilienceDisconnect*(client: CloudflareClient,
                                                      accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesGlobalWarpOverrideResponse] {.async.} =
  ## Fetch the Global WARP override state.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/resilience/disconnect")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesGlobalWarpOverrideResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesResilienceDisconnect*(client: CloudflareClient,
                                                       accountId: types.TeamsDevicesIdentifier,
                                                       body: types.TeamsDevicesGlobalWarpOverrideRequest): Future[types.TeamsDevicesGlobalWarpOverrideResponse] {.async.} =
  ## Sets the Global WARP override state.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/resilience/disconnect", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesGlobalWarpOverrideResponse)
  else:
    raise newException(CloudflareClientError, body)
