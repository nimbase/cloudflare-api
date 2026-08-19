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
  PutAccountsAccountIdCfdTunnelTunnelIdConfigurationsRequest = object
    config: Option[types.TunnelConfig]

proc getAccountsAccountIdCfdTunnelTunnelIdConfigurations*(client: CloudflareClient,
                                                          accountId: types.TunnelIdentifier,
                                                          tunnelId: types.TunnelTunnelId2): Future[types.TunnelConfigurationResponse] {.async.} =
  ## Gets the configuration for a remotely-managed tunnel

  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/configurations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCfdTunnelTunnelIdConfigurations*(client: CloudflareClient,
                                                          accountId: types.TunnelIdentifier,
                                                          tunnelId: types.TunnelTunnelId2,
                                                          body: PutAccountsAccountIdCfdTunnelTunnelIdConfigurationsRequest): Future[types.TunnelConfigurationResponse] {.async.} =
  ## Adds or updates the configuration for a remotely-managed tunnel.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/configurations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelIdConfigurations*(client: CloudflareClient,
                                                              accountId: types.TunnelIdentifier,
                                                              tunnelId: types.TunnelTunnelId2): Future[types.TunnelMeshConfigurationResponseSingle] {.async.} =
  ## Gets the high-availability configuration for a WARP Connector tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/configurations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelMeshConfigurationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWarpConnectorTunnelIdConfigurations*(client: CloudflareClient,
                                                              accountId: types.TunnelIdentifier,
                                                              tunnelId: types.TunnelTunnelId2,
                                                              body: types.TunnelMeshConfigurationRequestBody): Future[types.TunnelMeshConfigurationResponseSingle] {.async.} =
  ## Adds or updates the high-availability configuration for a WARP Connector tunnel.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/configurations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelMeshConfigurationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
