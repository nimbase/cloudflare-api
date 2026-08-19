# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelDns*(client: CloudflareClient,
                                   accountId: types.IntelIdentifier,
                                   startEndParams: types.IntelStartEndParams = default(types.IntelStartEndParams),
                                   ipv4: string = default(string),
                                   page: float64 = default(float64),
                                   perPage: float64 = default(float64)): Future[types.IntelComponentsSchemasSingleResponse] {.async.} =
  ## Gets a list of all the domains that have resolved to a specific IP address.

  var q = initOrderedTable[string, string]()
  q["start_end_params"] = $startEndParams
  q["ipv4"] = $ipv4
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/dns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
