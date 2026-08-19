# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PatchAccountsAccountIdZerotrustConnectivitySettingsRequest = object
    icmp_proxy_enabled: Option[types.TunnelIcmpProxyEnabled]
    offramp_warp_enabled: Option[types.TunnelOfframpWarpEnabled]

proc getAccountsAccountIdZerotrustConnectivitySettings*(client: CloudflareClient,
                                                        accountId: types.TunnelAccountId): Future[types.TunnelZeroTrustConnectivitySettingsResponse] {.async.} =
  ## Gets the Zero Trust Connectivity Settings for the given account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/connectivity_settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelZeroTrustConnectivitySettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdZerotrustConnectivitySettings*(client: CloudflareClient,
                                                          accountId: types.TunnelAccountId,
                                                          body: PatchAccountsAccountIdZerotrustConnectivitySettingsRequest): Future[types.TunnelZeroTrustConnectivitySettingsResponse] {.async.} =
  ## Updates the Zero Trust Connectivity Settings for the given account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/zerotrust/connectivity_settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelZeroTrustConnectivitySettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
