# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCniSlots*(client: CloudflareClient,
                                   addressContains: string = default(string),
                                   site: string = default(string),
                                   speed: string = default(string),
                                   occupied: bool = default(bool),
                                   cursor: int32 = default(int32),
                                   limit: int64 = default(int64),
                                   accountId: types.NscAccountTag): Future[types.NscSlotList] {.async.} =
  ## Lists all available infrastructure slots for the account, showing allocation
  ## status and
  ## capacity.

  var q = initOrderedTable[string, string]()
  q["address_contains"] = $addressContains
  q["site"] = $site
  q["speed"] = $speed
  q["occupied"] = $occupied
  q["cursor"] = $cursor
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/slots", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscSlotList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCniSlotsSlot*(client: CloudflareClient, slot: string,
                                       accountId: types.NscAccountTag): Future[types.NscSlotInfo] {.async.} =
  ## Gets information about a specific infrastructure slot allocation.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cni/slots/{slot}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NscSlotInfo)
  else:
    raise newException(CloudflareClientError, body)
