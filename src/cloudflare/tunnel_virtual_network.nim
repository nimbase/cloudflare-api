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
  PostAccountsAccountIdTeamnetVirtualNetworksRequest = object
    comment: Option[types.TunnelVirtualNetworkComment]
    is_default: Option[bool]
    is_default_network: Option[types.TunnelIsDefaultNetworkOptional]
    name: types.TunnelVirtualNetworkName
  GetAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkIdRequest = object
    comment: Option[types.TunnelVirtualNetworkComment]
    is_default_network: Option[types.TunnelIsDefaultNetwork]
    name: Option[types.TunnelVirtualNetworkName]
  PatchAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkIdRequest = object
    comment: Option[types.TunnelVirtualNetworkComment]
    is_default_network: Option[types.TunnelIsDefaultNetworkOptional]
    name: Option[types.TunnelVirtualNetworkName]

proc getAccountsAccountIdTeamnetVirtualNetworks*(client: CloudflareClient,
                                                 accountId: types.TunnelAccountId,
                                                 id: types.TunnelVirtualNetworkId = default(types.TunnelVirtualNetworkId),
                                                 name: types.TunnelVirtualNetworkName = default(types.TunnelVirtualNetworkName),
                                                 isDefault: bool = default(bool),
                                                 isDefaultNetwork: bool = default(bool),
                                                 isDeleted: bool = default(bool)): Future[types.TunnelVnetResponseCollection] {.async.} =
  ## Lists and filters virtual networks in an account.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["name"] = $name
  q["is_default"] = $isDefault
  q["is_default_network"] = $isDefaultNetwork
  q["is_deleted"] = $isDeleted
  let res = await client.httpGET(fmt"/accounts/{accountId}/teamnet/virtual_networks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelVnetResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTeamnetVirtualNetworks*(client: CloudflareClient,
                                                  accountId: types.TunnelAccountId,
                                                  body: PostAccountsAccountIdTeamnetVirtualNetworksRequest): Future[types.TunnelVnetResponseSingle] {.async.} =
  ## Adds a new virtual network to an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/teamnet/virtual_networks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelVnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkId*(client: CloudflareClient,
                                                                 accountId: types.TunnelAccountId,
                                                                 virtualNetworkId: types.TunnelVirtualNetworkId,
                                                                 body: GetAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkIdRequest): Future[types.TunnelVnetResponseSingle] {.async.} =
  ## Get a virtual network.

  let res = await client.httpGET(fmt"/accounts/{accountId}/teamnet/virtual_networks/{virtualNetworkId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelVnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkId*(client: CloudflareClient,
                                                                    virtualNetworkId: types.TunnelVirtualNetworkId,
                                                                    accountId: types.TunnelAccountId): Future[types.TunnelVnetResponseSingle] {.async.} =
  ## Deletes an existing virtual network.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/teamnet/virtual_networks/{virtualNetworkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelVnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkId*(client: CloudflareClient,
                                                                   accountId: types.TunnelAccountId,
                                                                   virtualNetworkId: types.TunnelVirtualNetworkId,
                                                                   body: PatchAccountsAccountIdTeamnetVirtualNetworksVirtualNetworkIdRequest): Future[types.TunnelVnetResponseSingle] {.async.} =
  ## Updates an existing virtual network.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/teamnet/virtual_networks/{virtualNetworkId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelVnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
