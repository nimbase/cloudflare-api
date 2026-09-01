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
  PostAccountsAccountIdCfdTunnelRequest = object
    config_src: Option[types.TunnelConfigSrc]
    name: types.TunnelTunnelName
    tunnel_secret: Option[types.TunnelTunnelSecret]
  PatchAccountsAccountIdCfdTunnelTunnelIdRequest = object
    name: Option[types.TunnelTunnelName]
    tunnel_secret: Option[types.TunnelTunnelSecret]
  PostAccountsAccountIdCfdTunnelTunnelIdManagementRequest = object
    resources: seq[types.TunnelManagementResources]
  PostAccountsAccountIdWarpConnectorRequest = object
    ha: Option[bool]
    name: types.TunnelTunnelName
  PatchAccountsAccountIdWarpConnectorTunnelIdRequest = object
    name: Option[types.TunnelTunnelName]
    tunnel_secret: Option[types.TunnelTunnelSecret]
  PutAccountsAccountIdWarpConnectorTunnelIdFailoverRequest = object
    client_id: types.TunnelClientIdInput

proc getAccountsAccountIdCfdTunnel*(client: CloudflareClient,
                                    accountId: types.TunnelAccountId,
                                    name: types.TunnelTunnelName = default(types.TunnelTunnelName),
                                    isDeleted: bool = default(bool),
                                    existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                    uuid: types.TunnelTunnelId = default(types.TunnelTunnelId),
                                    wasActiveAt: string = default(string),
                                    wasInactiveAt: string = default(string),
                                    includePrefix: string = default(string),
                                    excludePrefix: string = default(string),
                                    status: types.TunnelStatus = default(types.TunnelStatus),
                                    perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                    page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelCfdTunnelResponseCollection] {.async.} =
  ## Lists and filters Cloudflare Tunnels in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["is_deleted"] = $isDeleted
  q["existed_at"] = $existedAt
  q["uuid"] = $uuid
  q["was_active_at"] = $wasActiveAt
  q["was_inactive_at"] = $wasInactiveAt
  q["include_prefix"] = $includePrefix
  q["exclude_prefix"] = $excludePrefix
  q["status"] = $status
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelCfdTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCfdTunnel*(client: CloudflareClient,
                                     accountId: types.TunnelAccountId,
                                     body: PostAccountsAccountIdCfdTunnelRequest): Future[types.TunnelCfdTunnelResponseSingle] {.async.} =
  ## Creates a remotely or locally managed Cloudflare Tunnel in an account. After
  ## creation, retrieve its token and run cloudflared to establish the connector
  ## connection.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cfd_tunnel", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelCfdTunnelResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCfdTunnelTunnelId*(client: CloudflareClient,
                                            accountId: types.TunnelAccountId,
                                            tunnelId: types.TunnelTunnelId): Future[types.TunnelCfdTunnelResponseSingle] {.async.} =
  ## Fetches a single Cloudflare Tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelCfdTunnelResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCfdTunnelTunnelId*(client: CloudflareClient,
                                               accountId: types.TunnelAccountId,
                                               tunnelId: types.TunnelTunnelId): Future[types.TunnelCfdTunnelResponseSingle] {.async.} =
  ## Permanently deletes a Cloudflare Tunnel from an account. The tunnel must have no
  ## active connections.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelCfdTunnelResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCfdTunnelTunnelId*(client: CloudflareClient,
                                              tunnelId: types.TunnelTunnelId,
                                              accountId: types.TunnelAccountId,
                                              body: PatchAccountsAccountIdCfdTunnelTunnelIdRequest): Future[types.TunnelCfdTunnelResponseSingle] {.async.} =
  ## Updates the name or secret of an existing Cloudflare Tunnel.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelCfdTunnelResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCfdTunnelTunnelIdConnections*(client: CloudflareClient,
                                                       accountId: types.TunnelAccountId,
                                                       tunnelId: types.TunnelTunnelId): Future[types.TunnelTunnelConnectionsResponse] {.async.} =
  ## Lists the connections for a Cloudflare Tunnel, including connector IDs,
  ## cloudflared versions, and Cloudflare locations.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/connections")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelConnectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCfdTunnelTunnelIdConnections*(client: CloudflareClient,
                                                          accountId: types.TunnelAccountId,
                                                          tunnelId: types.TunnelTunnelId,
                                                          clientId: types.TunnelClientId = default(types.TunnelClientId)): Future[types.TunnelEmptyResponse] {.async.} =
  ## Removes a connection (aka Cloudflare Tunnel Connector) from a Cloudflare Tunnel
  ## independently of its current state. If no connector id (client_id) is provided
  ## all connectors will be removed. We recommend running this command after rotating
  ## tokens.

  var q = initOrderedTable[string, string]()
  q["client_id"] = $clientId
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/connections", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCfdTunnelTunnelIdConnectorsConnectorId*(client: CloudflareClient,
                                                                 accountId: types.TunnelAccountId,
                                                                 tunnelId: types.TunnelTunnelId,
                                                                 connectorId: types.TunnelClientId): Future[types.TunnelTunnelClientResponse] {.async.} =
  ## Retrieves a connector and its connection details for a Cloudflare Tunnel,
  ## including its cloudflared version, architecture, and connected Cloudflare
  ## locations.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/connectors/{connectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelClientResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCfdTunnelTunnelIdManagement*(client: CloudflareClient,
                                                       accountId: types.TunnelAccountId,
                                                       tunnelId: types.TunnelTunnelId,
                                                       body: PostAccountsAccountIdCfdTunnelTunnelIdManagementRequest): Future[types.TunnelTunnelResponseToken] {.async.} =
  ## Creates a short-lived management token for the requested Tunnel management
  ## resources, such as streaming logs. Treat the token as a secret.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/management", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelResponseToken)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCfdTunnelTunnelIdToken*(client: CloudflareClient,
                                                 accountId: types.TunnelAccountId,
                                                 tunnelId: types.TunnelTunnelId): Future[types.TunnelTunnelResponseToken] {.async.} =
  ## Retrieves the token used to run cloudflared and associate it with a specific
  ## Cloudflare Tunnel. Treat the token as a secret.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cfd_tunnel/{tunnelId}/token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelResponseToken)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTunnels*(client: CloudflareClient,
                                  accountId: types.TunnelAccountId,
                                  name: string = default(string),
                                  isDeleted: bool = default(bool),
                                  existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                  uuid: types.TunnelTunnelId = default(types.TunnelTunnelId),
                                  wasActiveAt: string = default(string),
                                  wasInactiveAt: string = default(string),
                                  includePrefix: string = default(string),
                                  excludePrefix: string = default(string),
                                  tunTypes: types.TunnelTunnelTypes = default(types.TunnelTunnelTypes),
                                  status: types.TunnelStatus = default(types.TunnelStatus),
                                  perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                  page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelTunnelResponseCollection] {.async.} =
  ## Lists and filters all types of Tunnels in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["is_deleted"] = $isDeleted
  q["existed_at"] = $existedAt
  q["uuid"] = $uuid
  q["was_active_at"] = $wasActiveAt
  q["was_inactive_at"] = $wasInactiveAt
  q["include_prefix"] = $includePrefix
  q["exclude_prefix"] = $excludePrefix
  q["tun_types"] = $tunTypes
  q["status"] = $status
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/tunnels", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnector*(client: CloudflareClient,
                                        accountId: types.TunnelAccountId,
                                        name: string = default(string),
                                        isDeleted: bool = default(bool),
                                        existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                        uuid: types.TunnelTunnelId = default(types.TunnelTunnelId),
                                        wasActiveAt: string = default(string),
                                        wasInactiveAt: string = default(string),
                                        includePrefix: string = default(string),
                                        excludePrefix: string = default(string),
                                        status: types.TunnelStatus = default(types.TunnelStatus),
                                        perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                        page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelWarpConnectorResponseCollection] {.async.} =
  ## Lists and filters Warp Connector Tunnels in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["is_deleted"] = $isDeleted
  q["existed_at"] = $existedAt
  q["uuid"] = $uuid
  q["was_active_at"] = $wasActiveAt
  q["was_inactive_at"] = $wasInactiveAt
  q["include_prefix"] = $includePrefix
  q["exclude_prefix"] = $excludePrefix
  q["status"] = $status
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelWarpConnectorResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWarpConnector*(client: CloudflareClient,
                                         accountId: types.TunnelAccountId,
                                         body: PostAccountsAccountIdWarpConnectorRequest): Future[types.TunnelWarpConnectorResponseSingle] {.async.} =
  ## Creates a new Warp Connector Tunnel in an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/warp_connector", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelWarpConnectorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelId*(client: CloudflareClient,
                                                accountId: types.TunnelAccountId,
                                                tunnelId: types.TunnelTunnelId): Future[types.TunnelWarpConnectorResponseSingle] {.async.} =
  ## Fetches a single Warp Connector Tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector/{tunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelWarpConnectorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWarpConnectorTunnelId*(client: CloudflareClient,
                                                   accountId: types.TunnelAccountId,
                                                   tunnelId: types.TunnelTunnelId): Future[types.TunnelWarpConnectorResponseSingle] {.async.} =
  ## Deletes a Warp Connector Tunnel from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/warp_connector/{tunnelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelWarpConnectorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWarpConnectorTunnelId*(client: CloudflareClient,
                                                  accountId: types.TunnelAccountId,
                                                  tunnelId: types.TunnelTunnelId,
                                                  body: PatchAccountsAccountIdWarpConnectorTunnelIdRequest): Future[types.TunnelWarpConnectorResponseSingle] {.async.} =
  ## Updates an existing Warp Connector Tunnel.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/warp_connector/{tunnelId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelWarpConnectorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelIdConnections*(client: CloudflareClient,
                                                           accountId: types.TunnelAccountId,
                                                           tunnelId: types.TunnelTunnelId): Future[types.TunnelTunnelWarpConnectorConnectionsResponse] {.async.} =
  ## Fetches connection details for a WARP Connector Tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/connections")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelWarpConnectorConnectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelIdConnectorsConnectorId*(client: CloudflareClient,
                                                                     accountId: types.TunnelAccountId,
                                                                     tunnelId: types.TunnelTunnelId,
                                                                     connectorId: types.TunnelClientId): Future[types.TunnelTunnelWarpConnectorClientResponse] {.async.} =
  ## Fetches connector and connection details for a WARP Connector Tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/connectors/{connectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelWarpConnectorClientResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWarpConnectorTunnelIdFailover*(client: CloudflareClient,
                                                        accountId: types.TunnelAccountId,
                                                        tunnelId: types.TunnelTunnelId,
                                                        body: PutAccountsAccountIdWarpConnectorTunnelIdFailoverRequest): Future[types.TunnelEmptyResponse] {.async.} =
  ## Triggers a manual failover for a specific WARP Connector Tunnel, setting the
  ## specified client as the active connector. The tunnel must be configured for high
  ## availability (HA) and the client must be linked to the tunnel.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/failover", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWarpConnectorTunnelIdToken*(client: CloudflareClient,
                                                     accountId: types.TunnelAccountId,
                                                     tunnelId: types.TunnelTunnelId): Future[types.TunnelTunnelResponseToken] {.async.} =
  ## Gets the token used to associate warp device with a specific Warp Connector
  ## tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/warp_connector/{tunnelId}/token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelResponseToken)
  else:
    raise newException(CloudflareClientError, body)
