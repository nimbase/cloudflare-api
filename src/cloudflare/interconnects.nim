# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCniInterconnects*(client: CloudflareClient,
                                           site: string = default(string),
                                           `type`: string = default(string),
                                           cursor: int32 = default(int32),
                                           limit: int64 = default(int64),
                                           accountId: types.NscAccountTag): Future[types.NscInterconnectList] {.async.} =
  ## Lists all network interconnects configured for the account, including physical
  ## and virtual
  ## connections.

  var q = initOrderedTable[string, string]()
  q["site"] = $site
  q["type"] = $`type`
  q["cursor"] = $cursor
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/interconnects", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscInterconnectList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCniInterconnects*(client: CloudflareClient,
                                            accountId: types.NscAccountTag,
                                            body: types.NscInterconnectCreate): Future[types.NscInterconnect] {.async.} =
  ## Creates a new network interconnect for connecting Cloudflare's network to
  ## external networks.
  ## Interconnects provide dedicated bandwidth and reduced latency for traffic
  ## exchange.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cni/interconnects", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscInterconnect)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCniInterconnectsIcon*(client: CloudflareClient,
                                               icon: string,
                                               accountId: types.NscAccountTag): Future[types.NscInterconnect] {.async.} =
  ## Retrieves configuration and status details for a specific network interconnect.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/interconnects/{icon}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscInterconnect)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCniInterconnectsIcon*(client: CloudflareClient,
                                                  icon: string,
                                                  accountId: types.NscAccountTag): Future[AsyncResponse] {.async.} =
  ## Permanently removes a network interconnect configuration. The physical or
  ## virtual connection
  ## will be terminated.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cni/interconnects/{icon}")
  return res

proc getAccountsAccountIdCniInterconnectsIconLoa*(client: CloudflareClient,
                                                  icon: string,
                                                  name: string = default(string),
                                                  accountId: types.NscAccountTag): Future[AsyncResponse] {.async.} =
  ## Downloads the Letter of Authorization (LOA) for a network interconnect, required
  ## for
  ## physical cross-connect provisioning.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/interconnects/{icon}/loa", q)
  return res

proc getAccountsAccountIdCniInterconnectsIconLoaDefault*(client: CloudflareClient,
                                                         icon: string,
                                                         accountId: types.NscAccountTag): Future[types.NscDefaultNameResponse] {.async.} =
  ## Retrieves the default customer name that will be used in the LOA if no name is
  ## provided to the
  ## `/accounts/{account_id}/cni/interconnects/{icon}/loa` endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/interconnects/{icon}/loa/default")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscDefaultNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCniInterconnectsIconStatus*(client: CloudflareClient,
                                                     icon: string,
                                                     accountId: types.NscAccountTag): Future[types.NscStatusInfo] {.async.} =
  ## Gets the current operational status of a network interconnect, including link
  ## state and
  ## traffic metrics.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/interconnects/{icon}/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscStatusInfo)
  else:
    raise newException(CloudflareClientError, body)
