# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicIpsecTunnels*(client: CloudflareClient,
                                            accountId: types.MagicIdentifier): Future[types.MagicSchemasTunnelsCollectionResponse] {.async.} =
  ## Lists IPsec tunnels associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/ipsec_tunnels")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicIpsecTunnels*(client: CloudflareClient,
                                             accountId: types.MagicIdentifier,
                                             body: types.MagicIpsecTunnelAddRequest): Future[types.MagicSchemasCreateIpsecTunnelResponse] {.async.} =
  ## Creates a new IPsec tunnel associated with an account. Use `?validate_only=true`
  ## as an optional query parameter to only run validation without persisting
  ## changes.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/ipsec_tunnels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasCreateIpsecTunnelResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicIpsecTunnels*(client: CloudflareClient,
                                            accountId: types.MagicIdentifier): Future[types.MagicSchemasModifiedTunnelsCollectionResponse] {.async.} =
  ## Update multiple IPsec tunnels associated with an account. Use
  ## `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/ipsec_tunnels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasModifiedTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicIpsecTunnelsPsk*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier,
                                                validateOnly: bool = default(bool),
                                                body: types.MagicIpsecTunnelsPskRequest): Future[types.MagicIpsecTunnelsPskResponse] {.async.} =
  ## Sets Pre-Shared Keys for multiple IPsec tunnels associated with an account. Use
  ## `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes. After PSKs are applied, they are immediately
  ## persisted to Cloudflare's edge and cannot be retrieved later. Store the PSKs in
  ## a safe place.

  var q = initOrderedTable[string, string]()
  q["validate_only"] = $validateOnly
  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/ipsec_tunnels/psk", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicIpsecTunnelsPskResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId*(client: CloudflareClient,
                                                         ipsecTunnelId: types.MagicIdentifier,
                                                         accountId: types.MagicIdentifier): Future[types.MagicSchemasTunnelSingleResponse] {.async.} =
  ## Lists details for a specific IPsec tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/ipsec_tunnels/{ipsecTunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasTunnelSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId*(client: CloudflareClient,
                                                         ipsecTunnelId: types.MagicIdentifier,
                                                         accountId: types.MagicIdentifier,
                                                         body: types.MagicIpsecTunnelAddSingleRequest): Future[types.MagicSchemasTunnelModifiedResponse] {.async.} =
  ## Updates a specific IPsec tunnel associated with an account. Use
  ## `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/ipsec_tunnels/{ipsecTunnelId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasTunnelModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicIpsecTunnelsIpsecTunnelId*(client: CloudflareClient,
                                                            ipsecTunnelId: types.MagicIdentifier,
                                                            accountId: types.MagicIdentifier): Future[types.MagicSchemasTunnelDeletedResponse] {.async.} =
  ## Disables and removes a specific static IPsec Tunnel associated with an account.
  ## Use `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/ipsec_tunnels/{ipsecTunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSchemasTunnelDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicIpsecTunnelsIpsecTunnelIdPskGenerate*(client: CloudflareClient,
                                                                     ipsecTunnelId: types.MagicIdentifier,
                                                                     accountId: types.MagicIdentifier): Future[types.MagicPskGenerationResponse] {.async.} =
  ## Generates a Pre-Shared Key for a specific IPsec tunnel used in the IKE session.
  ## Use `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes. After a PSK is generated, the PSK is immediately
  ## persisted to Cloudflare's edge and cannot be retrieved later. Store the PSK in a
  ## safe place.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/ipsec_tunnels/{ipsecTunnelId}/psk_generate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicPskGenerationResponse)
  else:
    raise newException(CloudflareClientError, body)
