# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCniCnis*(client: CloudflareClient,
                                  slot: string = default(string),
                                  tunnelId: string = default(string),
                                  cursor: int32 = default(int32),
                                  limit: int64 = default(int64),
                                  accountId: types.NscAccountTag): Future[types.NscCniList] {.async.} =
  ## Lists all Cloud Network Interconnects (CNIs) configured for the account, showing
  ## connection
  ## status and parameters.

  var q = initOrderedTable[string, string]()
  q["slot"] = $slot
  q["tunnel_id"] = $tunnelId
  q["cursor"] = $cursor
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/cnis", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscCniList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCniCnis*(client: CloudflareClient,
                                   accountId: types.NscAccountTag,
                                   body: types.NscCniCreate): Future[types.NscCni] {.async.} =
  ## Creates a new Cloud Network Interconnect (CNI) for private network connectivity
  ## between
  ## Cloudflare and your infrastructure. CNIs enable dedicated, high-performance
  ## network links.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cni/cnis", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscCni)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCniCnisCni*(client: CloudflareClient, cni: string,
                                     accountId: types.NscAccountTag): Future[types.NscCni] {.async.} =
  ## Retrieves configuration details for a specific Cloud Network Interconnect (CNI),
  ## including
  ## connection status and parameters.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/cnis/{cni}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscCni)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCniCnisCni*(client: CloudflareClient, cni: string,
                                     accountId: types.NscAccountTag,
                                     body: types.NscCni): Future[types.NscCni] {.async.} =
  ## Updates the configuration of an existing Cloud Network Interconnect (CNI),
  ## including
  ## connection parameters and routing settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cni/cnis/{cni}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscCni)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCniCnisCni*(client: CloudflareClient, cni: string,
                                        accountId: types.NscAccountTag): Future[AsyncResponse] {.async.} =
  ## Permanently removes a Cloud Network Interconnect (CNI) configuration. The
  ## private network
  ## connection will be terminated.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cni/cnis/{cni}")
  return res
