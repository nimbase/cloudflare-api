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
  PostAccountsAccountIdZerotrustRoutesHostnameRequest = object
    comment: Option[types.TunnelHostnameComment]
    hostname: Option[types.TunnelHostname]
    tunnel_id: Option[types.TunnelTunnelId3]
  PatchAccountsAccountIdZerotrustRoutesHostnameHostnameRouteIdRequest = object
    comment: Option[types.TunnelHostnameComment]
    hostname: Option[types.TunnelHostname]
    tunnel_id: Option[types.TunnelTunnelId3]

proc getAccountsAccountIdZerotrustRoutesHostname*(client: CloudflareClient,
                                                  accountId: types.TunnelAccountId,
                                                  id: types.TunnelHostnameRouteId = default(types.TunnelHostnameRouteId),
                                                  hostname: types.TunnelHostname = default(types.TunnelHostname),
                                                  tunnelId: types.TunnelTunnelId3 = default(types.TunnelTunnelId3),
                                                  comment: types.TunnelHostnameQueryComment = default(types.TunnelHostnameQueryComment),
                                                  existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                                  isDeleted: bool = false,
                                                  perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                                  page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelHostnameRouteResponseCollection] {.async.} =
  ## Lists and filters hostname routes in an account.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["hostname"] = $hostname
  q["tunnel_id"] = $tunnelId
  q["comment"] = $comment
  q["existed_at"] = $existedAt
  q["is_deleted"] = $isDeleted
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/routes/hostname", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRouteResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdZerotrustRoutesHostname*(client: CloudflareClient,
                                                   accountId: types.TunnelAccountId,
                                                   body: PostAccountsAccountIdZerotrustRoutesHostnameRequest): Future[types.TunnelHostnameRouteResponseSingle] {.async.} =
  ## Create a hostname route.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/zerotrust/routes/hostname", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZerotrustRoutesHostnameHostnameRouteId*(client: CloudflareClient,
                                                                 accountId: types.TunnelAccountId,
                                                                 hostnameRouteId: types.TunnelHostnameRouteId): Future[types.TunnelHostnameRouteResponseSingle] {.async.} =
  ## Get a hostname route.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/routes/hostname/{hostnameRouteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdZerotrustRoutesHostnameHostnameRouteId*(client: CloudflareClient,
                                                                    accountId: types.TunnelAccountId,
                                                                    hostnameRouteId: types.TunnelHostnameRouteId): Future[types.TunnelHostnameRouteResponseSingle] {.async.} =
  ## Delete a hostname route.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/zerotrust/routes/hostname/{hostnameRouteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdZerotrustRoutesHostnameHostnameRouteId*(client: CloudflareClient,
                                                                   accountId: types.TunnelAccountId,
                                                                   hostnameRouteId: types.TunnelHostnameRouteId,
                                                                   body: PatchAccountsAccountIdZerotrustRoutesHostnameHostnameRouteIdRequest): Future[types.TunnelHostnameRouteResponseSingle] {.async.} =
  ## Updates a hostname route.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/zerotrust/routes/hostname/{hostnameRouteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelHostnameRouteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
