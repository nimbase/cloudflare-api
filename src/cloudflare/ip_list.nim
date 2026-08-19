# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelIpLists*(client: CloudflareClient,
                                       accountId: types.IntelIdentifier): Future[types.IntelComponentsSchemasResponse] {.async.} =
  ## Returns a list of available IP list categories (e.g., anonymizer, botnetcc,
  ## malware, tor, vpn, open_proxies). This endpoint provides metadata about which IP
  ## lists are available in the system.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/ip-lists")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelComponentsSchemasResponse)
  else:
    raise newException(CloudflareClientError, body)
