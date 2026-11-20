# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdTunnelsTunnelIdHostnames*(client: CloudflareClient,
                                                   accountId: types.TunnelAccountId,
                                                   tunnelId: types.TunnelTunnelId2,
                                                   hostname: string = default(string),
                                                   canonical: bool = default(bool),
                                                   isDeleted: bool = false,
                                                   perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                                   page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelTunnelHostnameResponseCollection] {.async.} =
  ## Lists and filters the hostnames assigned to a tunnel.

  var q = initOrderedTable[string, string]()
  q["hostname"] = $hostname
  q["canonical"] = $canonical
  q["is_deleted"] = $isDeleted
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelHostnameResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTunnelsTunnelIdHostnames*(client: CloudflareClient,
                                                    accountId: types.TunnelAccountId,
                                                    tunnelId: types.TunnelTunnelId2,
                                                    body: types.TunnelPostTunnelHostnameBody): Future[types.TunnelTunnelHostnameResponseSingle] {.async.} =
  ## Assigns a hostname to a tunnel. If the tunnel has no active hostnames, the new
  ## hostname is always canonical.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                             accountId: types.TunnelAccountId,
                                                             tunnelId: types.TunnelTunnelId2,
                                                             hostnameId: types.TunnelTunnelHostnameId): Future[types.TunnelTunnelHostnameResponseSingle] {.async.} =
  ## Fetches a hostname assigned to a tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                                accountId: types.TunnelAccountId,
                                                                tunnelId: types.TunnelTunnelId2,
                                                                hostnameId: types.TunnelTunnelHostnameId): Future[types.TunnelTunnelHostnameResponseSingle] {.async.} =
  ## Deletes a hostname assigned to a tunnel.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                               accountId: types.TunnelAccountId,
                                                               tunnelId: types.TunnelTunnelId2,
                                                               hostnameId: types.TunnelTunnelHostnameId,
                                                               body: types.TunnelPatchTunnelHostnameBody): Future[types.TunnelTunnelHostnameResponseSingle] {.async.} =
  ## Updates the hostname value or makes it canonical. To unset a canonical hostname,
  ## make a different hostname canonical instead.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelTunnelHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
