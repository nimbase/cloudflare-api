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
  PostAccountsAccountIdTeamnetRoutesRequest = object
    comment: Option[types.TunnelRouteComment]
    network: types.TunnelIpNetwork
    tunnel_id: types.TunnelTunnelId
    virtual_network_id: Option[types.TunnelVirtualNetworkIdComputedOptional]
  PostAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncodedRequest = object
    comment: Option[types.TunnelRouteComment]
    tunnel_id: types.TunnelTunnelId
    virtual_network_id: Option[types.TunnelVirtualNetworkId]
  PatchAccountsAccountIdTeamnetRoutesRouteIdRequest = object
    comment: Option[types.TunnelRouteComment]
    network: Option[types.TunnelIpNetwork]
    tunnel_id: Option[types.TunnelTunnelId]
    virtual_network_id: Option[types.TunnelVirtualNetworkIdComputedOptional]

proc getAccountsAccountIdTeamnetRoutes*(client: CloudflareClient,
                                        accountId: types.TunnelAccountId,
                                        comment: types.TunnelRouteComment = default(types.TunnelRouteComment),
                                        isDeleted: bool = default(bool),
                                        networkSubset: JsonNode = default(JsonNode),
                                        networkSuperset: JsonNode = default(JsonNode),
                                        existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                        tunnelId: types.TunnelTunnelId = default(types.TunnelTunnelId),
                                        routeId: types.TunnelRouteId = default(types.TunnelRouteId),
                                        tunTypes: types.TunnelTunnelTypes = default(types.TunnelTunnelTypes),
                                        virtualNetworkId: types.TunnelVirtualNetworkId = default(types.TunnelVirtualNetworkId),
                                        perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                        page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelTeamnetResponseCollection] {.async.} =
  ## Lists and filters private network routes in an account.

  var q = initOrderedTable[string, string]()
  q["comment"] = $comment
  q["is_deleted"] = $isDeleted
  q["network_subset"] = $networkSubset
  q["network_superset"] = $networkSuperset
  q["existed_at"] = $existedAt
  q["tunnel_id"] = $tunnelId
  q["route_id"] = $routeId
  q["tun_types"] = $tunTypes
  q["virtual_network_id"] = $virtualNetworkId
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/teamnet/routes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTeamnetResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTeamnetRoutes*(client: CloudflareClient,
                                         accountId: types.TunnelAccountId,
                                         body: PostAccountsAccountIdTeamnetRoutesRequest): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Routes a private network through a Cloudflare Tunnel.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/teamnet/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTeamnetRoutesIpIp*(client: CloudflareClient,
                                            ip: types.TunnelIp,
                                            accountId: types.TunnelAccountId,
                                            virtualNetworkId: types.TunnelVirtualNetworkId = default(types.TunnelVirtualNetworkId),
                                            defaultVirtualNetworkFallback: bool = true): Future[types.TunnelTeamnetResponseSingle] {.async.} =
  ## Fetches routes that contain the given IP address.

  var q = initOrderedTable[string, string]()
  q["virtual_network_id"] = $virtualNetworkId
  q["default_virtual_network_fallback"] = $defaultVirtualNetworkFallback
  let res = await client.httpGET(fmt"/accounts/{accountId}/teamnet/routes/ip/{ip}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTeamnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncoded*(client: CloudflareClient,
                                                                ipNetworkEncoded: types.TunnelIpNetworkEncoded,
                                                                accountId: types.TunnelAccountId,
                                                                body: PostAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncodedRequest): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Routes a private network through a Cloudflare Tunnel. The CIDR in
  ## `ip_network_encoded` must be written in URL-encoded format.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/teamnet/routes/network/{ipNetworkEncoded}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncoded*(client: CloudflareClient,
                                                                  ipNetworkEncoded: types.TunnelIpNetworkEncoded,
                                                                  accountId: types.TunnelAccountId,
                                                                  virtualNetworkId: types.TunnelVirtualNetworkId = default(types.TunnelVirtualNetworkId),
                                                                  tunType: types.TunnelTunnelType = default(types.TunnelTunnelType),
                                                                  tunnelId: types.TunnelTunnelId = default(types.TunnelTunnelId)): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Deletes a private network route from an account. The CIDR in
  ## `ip_network_encoded` must be written in URL-encoded format. If no
  ## virtual_network_id is provided it will delete the route from the default vnet.
  ## If no tun_type is provided it will fetch the type from the tunnel_id or if that
  ## is missing it will assume Cloudflare Tunnel as default. If tunnel_id is provided
  ## it will delete the route from that tunnel, otherwise it will delete the route
  ## based on the vnet and tun_type.

  var q = initOrderedTable[string, string]()
  q["virtual_network_id"] = $virtualNetworkId
  q["tun_type"] = $tunType
  q["tunnel_id"] = $tunnelId
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/teamnet/routes/network/{ipNetworkEncoded}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTeamnetRoutesNetworkIpNetworkEncoded*(client: CloudflareClient,
                                                                 ipNetworkEncoded: types.TunnelIpNetworkEncoded,
                                                                 accountId: types.TunnelAccountId): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Updates an existing private network route in an account. The CIDR in
  ## `ip_network_encoded` must be written in URL-encoded format.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/teamnet/routes/network/{ipNetworkEncoded}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTeamnetRoutesRouteId*(client: CloudflareClient,
                                               accountId: types.TunnelAccountId,
                                               routeId: types.TunnelRouteId): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Get a private network route in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/teamnet/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTeamnetRoutesRouteId*(client: CloudflareClient,
                                                  routeId: types.TunnelRouteId,
                                                  accountId: types.TunnelAccountId): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Deletes a private network route from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/teamnet/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTeamnetRoutesRouteId*(client: CloudflareClient,
                                                 routeId: types.TunnelRouteId,
                                                 accountId: types.TunnelAccountId,
                                                 body: PatchAccountsAccountIdTeamnetRoutesRouteIdRequest): Future[types.TunnelRouteResponseSingle] {.async.} =
  ## Updates an existing private network route in an account. The fields that are
  ## meant to be updated should be provided in the body of the request.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/teamnet/routes/{routeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
