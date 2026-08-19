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
  PostAccountsAccountIdMnmConfigRequest = object
    default_sampling: types.MagicVisibilityMnmMnmConfigDefaultSampling
    name: types.MagicVisibilityMnmMnmConfigName
    router_ips: Option[types.MagicVisibilityMnmMnmConfigRouterIps]
    warp_devices: Option[types.MagicVisibilityMnmMnmConfigWarpDevices]
  PutAccountsAccountIdMnmConfigRequest = object
    default_sampling: types.MagicVisibilityMnmMnmConfigDefaultSampling
    name: types.MagicVisibilityMnmMnmConfigName
    router_ips: Option[types.MagicVisibilityMnmMnmConfigRouterIps]
    warp_devices: Option[types.MagicVisibilityMnmMnmConfigWarpDevices]
  PatchAccountsAccountIdMnmConfigRequest = object
    default_sampling: Option[types.MagicVisibilityMnmMnmConfigDefaultSampling]
    name: Option[types.MagicVisibilityMnmMnmConfigName]
    router_ips: Option[types.MagicVisibilityMnmMnmConfigRouterIps]
    warp_devices: Option[types.MagicVisibilityMnmMnmConfigWarpDevices]

proc getAccountsAccountIdMnmConfig*(client: CloudflareClient,
                                    accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Lists default sampling, router IPs and warp devices for account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/mnm/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMnmConfig*(client: CloudflareClient,
                                     accountId: types.MagicVisibilityMnmAccountIdentifier,
                                     body: PostAccountsAccountIdMnmConfigRequest): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Create a new network monitoring configuration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/mnm/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMnmConfig*(client: CloudflareClient,
                                    accountId: types.MagicVisibilityMnmAccountIdentifier,
                                    body: PutAccountsAccountIdMnmConfigRequest): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Update an existing network monitoring configuration, requires the entire
  ## configuration to be updated at once.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/mnm/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMnmConfig*(client: CloudflareClient,
                                       accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Delete an existing network monitoring configuration.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/mnm/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMnmConfig*(client: CloudflareClient,
                                      accountId: types.MagicVisibilityMnmAccountIdentifier,
                                      body: PatchAccountsAccountIdMnmConfigRequest): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Update fields in an existing network monitoring configuration.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/mnm/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMnmConfigFull*(client: CloudflareClient,
                                        accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmConfigSingleResponse] {.async.} =
  ## Lists default sampling, router IPs, warp devices, and rules for account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/mnm/config/full")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
