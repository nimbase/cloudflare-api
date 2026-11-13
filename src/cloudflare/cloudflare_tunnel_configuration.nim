# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PutAccountsAccountIdCfdTunnelTunnelIdConfigurationsRequest = object
    config: Option[JsonNode]

proc getAccountsAccountIdCfdTunnelTunnelIdConfigurations*(client: CloudflareClient,
                                                          accountId: types.TunnelIdentifier,
                                                          tunnelId: types.TunnelTunnelId2): Future[types.TunnelConfigurationResponse] {.async.} =
  ## Retrieves the configuration for a remotely managed Cloudflare Tunnel.

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
  ## Replaces the configuration for a remotely managed Cloudflare Tunnel, including
  ## its ingress rules and origin request settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/configurations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCfdTunnelTunnelIdConfigurations*(client: CloudflareClient,
                                                             accountId: types.TunnelIdentifier,
                                                             tunnelId: types.TunnelTunnelId2): Future[JsonNode] {.async.} =
  ## Resets a remotely managed Cloudflare Tunnel to an empty configuration, removing
  ## ingress rules and origin request settings. The tunnel remains remotely managed,
  ## and private network routes continue to determine WARP routing. Publishes a new
  ## configuration version when the configuration changes. Repeated requests succeed
  ## without creating additional versions. If the tunnel or configuration is absent,
  ## returns a null result. Locally managed tunnels cannot be reset with this
  ## endpoint.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/configurations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelIdConfigurations*(client: CloudflareClient,
                                                              accountId: types.TunnelIdentifier,
                                                              tunnelId: types.TunnelTunnelId2): Future[types.TunnelMeshConfigurationResponseSingle] {.async.} =
  ## Gets the high-availability configuration for a Mesh node.

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
  ## Adds or updates the high-availability configuration for a Mesh node.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/configurations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelMeshConfigurationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
