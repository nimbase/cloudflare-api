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
                                                   page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelHostnameRecordResponseCollection] {.async.} =
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
    result = fromJson(body, types.TunnelHostnameRecordResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTunnelsTunnelIdHostnames*(client: CloudflareClient,
                                                    accountId: types.TunnelAccountId,
                                                    tunnelId: types.TunnelTunnelId2,
                                                    body: types.TunnelPostHostnameRecordBody): Future[types.TunnelHostnameRecordResponseSingle] {.async.} =
  ## Assigns a hostname to a tunnel. If the tunnel has no active hostnames, the new
  ## hostname is always canonical.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRecordResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                             accountId: types.TunnelAccountId,
                                                             tunnelId: types.TunnelTunnelId2,
                                                             hostnameId: types.TunnelHostnameRecordId): Future[types.TunnelHostnameRecordResponseSingle] {.async.} =
  ## Fetches a hostname assigned to a tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRecordResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                                accountId: types.TunnelAccountId,
                                                                tunnelId: types.TunnelTunnelId2,
                                                                hostnameId: types.TunnelHostnameRecordId): Future[types.TunnelHostnameRecordResponseSingle] {.async.} =
  ## Deletes a hostname assigned to a tunnel.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRecordResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId*(client: CloudflareClient,
                                                               accountId: types.TunnelAccountId,
                                                               tunnelId: types.TunnelTunnelId2,
                                                               hostnameId: types.TunnelHostnameRecordId,
                                                               body: types.TunnelPatchHostnameRecordBody): Future[types.TunnelHostnameRecordResponseSingle] {.async.} =
  ## Updates the hostname value or makes it canonical. To unset a canonical hostname,
  ## make a different hostname canonical instead.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/tunnels/{tunnelId}/hostnames/{hostnameId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRecordResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
