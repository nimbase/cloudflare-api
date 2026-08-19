# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicGreTunnels*(client: CloudflareClient,
                                          accountId: types.MagicIdentifier): Future[types.MagicTunnelsCollectionResponse] {.async.} =
  ## Lists GRE tunnels associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/gre_tunnels")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicGreTunnels*(client: CloudflareClient,
                                           accountId: types.MagicIdentifier,
                                           body: types.MagicCreateGreTunnelRequest): Future[types.MagicCreateGreTunnelResponse] {.async.} =
  ## Creates a new GRE tunnel. Use `?validate_only=true` as an optional query
  ## parameter to only run validation without persisting changes.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/gre_tunnels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCreateGreTunnelResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicGreTunnels*(client: CloudflareClient,
                                          accountId: types.MagicIdentifier): Future[types.MagicModifiedTunnelsCollectionResponse] {.async.} =
  ## Updates multiple GRE tunnels. Use `?validate_only=true` as an optional query
  ## parameter to only run validation without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/gre_tunnels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicModifiedTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicGreTunnelsGreTunnelId*(client: CloudflareClient,
                                                     greTunnelId: types.MagicIdentifier,
                                                     accountId: types.MagicIdentifier): Future[types.MagicTunnelSingleResponse] {.async.} =
  ## Lists informtion for a specific GRE tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/gre_tunnels/{greTunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTunnelSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicGreTunnelsGreTunnelId*(client: CloudflareClient,
                                                     greTunnelId: types.MagicIdentifier,
                                                     accountId: types.MagicIdentifier,
                                                     body: types.MagicGreTunnelUpdateRequest): Future[types.MagicTunnelModifiedResponse] {.async.} =
  ## Updates a specific GRE tunnel. Use `?validate_only=true` as an optional query
  ## parameter to only run validation without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/gre_tunnels/{greTunnelId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTunnelModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicGreTunnelsGreTunnelId*(client: CloudflareClient,
                                                        greTunnelId: types.MagicIdentifier,
                                                        accountId: types.MagicIdentifier): Future[types.MagicTunnelDeletedResponse] {.async.} =
  ## Disables and removes a specific static GRE tunnel. Use `?validate_only=true` as
  ## an optional query parameter to only run validation without persisting changes.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/gre_tunnels/{greTunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTunnelDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)
