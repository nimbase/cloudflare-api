# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdZerotrustRegion*(client: CloudflareClient,
                                          accountId: types.TunnelAccountId): Future[types.TunnelActiveAccountRegionResponseSingle] {.async.} =
  ## Gets the region that the account is using for Cloudflare One. `region_key` is
  ## `null` if the account has not selected a region.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/region")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelActiveAccountRegionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZerotrustRegion*(client: CloudflareClient,
                                          accountId: types.TunnelAccountId,
                                          body: types.TunnelPutAccountRegionBody): Future[types.TunnelActiveAccountRegionResponseSingle] {.async.} =
  ## Selects the region that the account uses for Cloudflare One. The region must be
  ## one of the account's available regions. Selecting the active region again has no
  ## effect.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zerotrust/region", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelActiveAccountRegionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdZerotrustRegion*(client: CloudflareClient,
                                             accountId: types.TunnelAccountId): Future[types.TunnelActiveAccountRegionResponseSingle] {.async.} =
  ## Clears the account's active region. This operation is idempotent. Clearing an
  ## account without an active region returns success with a `null` `region_key`.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/zerotrust/region")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelActiveAccountRegionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZerotrustRegions*(client: CloudflareClient,
                                           accountId: types.TunnelAccountId): Future[types.TunnelAccountRegionResponseCollection] {.async.} =
  ## Lists the regions that the account can select for Cloudflare One. Returns an
  ## empty list if no regions are available to the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelAccountRegionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
